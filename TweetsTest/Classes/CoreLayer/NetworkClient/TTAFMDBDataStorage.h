//
//  TTAFMDBDataStorage.h
//  TweetsTest
//
//  Created by a.protko on 18.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTADataStorage.h"

@class FMDatabaseQueue;

/**
 Хранилище на основе FMDB
 */
@interface TTAFMDBDataStorage : NSObject<TTADataStorage>

@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, strong) NSOperationQueue *callbackQueue;
@property (nonatomic, copy) NSString *databaseName;
@property (nonatomic, strong, readonly) FMDatabaseQueue *databaseQueue;

@end
