//
//  TTATweetsServiceBase.m
//  TweetsTest
//
//  Created by a.protko on 17.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTATweetsServiceBase.h"
#import <FMDB.h>
#import "TTAOperationsFactory.h"
#import "TTADataStorage.h"
#import "TTATweet.h"

@implementation TTATweetsServiceBase

- (void)obtainRecentTweetsByScreenName:(NSString *)screenName completion:(TTATweetLoadingBlock)block {
    __auto_type parameters = @{
                               @"screen_name": screenName
                               };
    __auto_type operation = [self.operationsFactory downloadTweetsOperationWithParameters:parameters completion:^(id result, NSError *error) {
        [self performBlock:block withTweets:result andError:error];
    }];
    [self.queue addOperation:operation];
}

- (void)downloadTweetsByScreenName:(NSString *)screenName
                           sinceID:(int64_t)sinceID
                             count:(NSUInteger)count
                        completion:(TTATweetLoadingBlock)block {
    __auto_type parameters = @{
                               @"screen_name": screenName,
                               @"since_id": [@(sinceID) stringValue],
                               @"count": [@(count) stringValue]
                               };
    __auto_type operation = [self.operationsFactory downloadTweetsOperationWithParameters:parameters completion:^(id result, NSError *error) {
        [self performBlock:block withTweets:result andError:error];
    }];
    [self.queue addOperation:operation];
}

- (void)downloadTweetsByScreenName:(NSString *)screenName
                             maxID:(int64_t)maxID
                             count:(NSUInteger)count
                        completion:(TTATweetLoadingBlock)block {
    __auto_type parameters = @{
                               @"screen_name": screenName,
                               @"max_id": [@(maxID) stringValue],
                               @"count": [@(count) stringValue]
                               };
    __auto_type operation = [self.operationsFactory downloadTweetsOperationWithParameters:parameters completion:^(id result, NSError *error) {
        [self performBlock:block withTweets:result andError:error];
    }];
    [self.queue addOperation:operation];
}

- (void)performBlock:(TTATweetLoadingBlock)block
          withTweets:(NSArray<TTATweet *> *)tweets
            andError:(NSError *)error {
    if (error != nil) {
        dispatch_async(dispatch_get_main_queue(), ^{
            block(nil, error);
        });
    } else {
        [self saveTweets:tweets withCompletion:^(NSError *error) {
            block(tweets, error);
        }];
    }
}

- (void)saveTweets:(NSArray<TTATweet *> *)tweets withCompletion:(TTAErrorBlock)block {
    [self.dataStorage saveObjects:tweets withQuery:@"insert or ignore into tweets(tweetID,text,authorName,photoID) values(?,?,?,?)" completion:block];
}

- (void)obtainTweetsFromLocalStorageWithCompletion:(TTATweetLoadingBlock)block {
    [self.dataStorage fetchObjectsWithQuery:@"select * from tweets order by tweetID desc" storableClass:[TTATweet class] completion:block];
}

- (void)obtainLocalMinTweetIDWithCompletion:(TTAIDResultBlock)block {
    [self.dataStorage fetchScalarWithQuery:@"select min(tweetID) from tweets" completion:block];
}

- (void)obtainLocalMaxTweetIDWithCompletion:(TTAIDResultBlock)block {
    [self.dataStorage fetchScalarWithQuery:@"select max(tweetID) from tweets" completion:block];
}

@end
