//
//  TTAFMDBDataStorage.m
//  TweetsTest
//
//  Created by a.protko on 18.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB.h>
#import "TTAFMDBDataStorage.h"
#import "TTAStorableObject.h"

@implementation TTAFMDBDataStorage

@synthesize databaseQueue = _databaseQueue;

- (FMDatabaseQueue *)databaseQueue {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *path = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES).lastObject;
        NSString *databasePath = [path stringByAppendingPathComponent:self.databaseName];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        if (![fileManager fileExistsAtPath:databasePath]) {
            NSBundle *bundle = [NSBundle bundleForClass:[self class]];
            NSString *fileName = [self.databaseName stringByDeletingPathExtension];
            NSString *extension = [self.databaseName pathExtension];
            NSString *emptyDatabasePath = [bundle pathForResource:fileName ofType:extension];
            [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
            [fileManager copyItemAtPath:emptyDatabasePath toPath:databasePath error:nil];
        }

        _databaseQueue = [FMDatabaseQueue databaseQueueWithPath:databasePath];
    });
    return _databaseQueue;
}

- (void)fetchObjectsWithQuery:(NSString *)query
                  storableClass:(Class)clazz
                   completion:(TTAResultBlock)block {
    [self fetchObjectsWithQuery:query
                      arguments:nil
                  storableClass:clazz
                     completion:block];
}

- (void)fetchObjectsWithQuery:(NSString *)query
                    arguments:(NSArray *)arguments
                storableClass:(Class)clazz
                   completion:(TTAResultBlock)block {

    [self performTransaction:^(FMDatabase *db, BOOL *rollback) {
        NSMutableArray *result = [NSMutableArray new];
        FMResultSet *resultSet = [db executeQuery:query withArgumentsInArray:arguments];
        while ([resultSet next]) {
            NSDictionary *dictionary = [resultSet resultDictionary];
            id item = [[clazz alloc] initWithDictionary:dictionary];
            [result addObject:item];
        }

        [self performCallback:^{
            block([result copy], nil);
        }];
    }];
}

- (void)saveObjects:(NSArray<id<TTAStorableObject>> *)objects
          withQuery:(NSString *)query
         completion:(TTAErrorBlock)block {
    if (objects.count == 0) {
        [self performCallback:^{
            block(nil);
        }];
        return;
    }

    [self performTransaction:^(FMDatabase *db, BOOL *rollback) {
        NSError *error = nil;
        for (id<TTAStorableObject> object in objects) {
            NSArray *values = [object rawValues];

            [db executeUpdate:query values:values error:&error];

            if (error != nil) {
                *rollback = YES;
                break;
            }
        }
        [self performCallback:^{
            block(error);
        }];
    }];
}

- (void)fetchScalarWithQuery:(NSString *)query
                  completion:(TTAResultBlock)block {

    [self performTransaction:^(FMDatabase *db, BOOL *rollback) {
        FMResultSet *resultSet = [db executeQuery:query];
        NSAssert([resultSet columnCount] == 1, @"Ожидался скалярный запрос");

        id result = nil;
        if ([resultSet next]) {
            result = [resultSet objectForColumnIndex:0];
            NSAssert(![resultSet next], @"Ожидался скалярный запрос");
        }

        if (result == [NSNull null]) {
            result = nil;
        }
        [self performCallback:^{
            block(result, nil);
        }];
    }];
}

- (void)performTransaction:(void (^)(FMDatabase *db, BOOL *rollback))block {
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
        [self.databaseQueue inDeferredTransaction:block];
    }];

    [self.operationQueue addOperation:operation];
}

- (void)performCallback:(void (^)())block {
    NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:block];

    [self.callbackQueue addOperation:operation];
}

@end
