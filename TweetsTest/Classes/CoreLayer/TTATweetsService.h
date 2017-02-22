//
//  TTATweetsService.h
//  TweetsTest
//
//  Created by a.protko on 17.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTATweet.h"
#import "Common.h"

typedef void(^TTATweetLoadingBlock)(NSArray<TTATweet *> *tweets, NSError *error);
typedef void(^TTAIDResultBlock)(NSNumber *tweetID, NSError *error);

@protocol TTATweetsService <NSObject>

- (void)obtainRecentTweetsByScreenName:(NSString *)screenName
                            completion:(TTATweetLoadingBlock)block;

- (void)downloadTweetsByScreenName:(NSString *)screenName
                           sinceID:(int64_t)sinceID
                             count:(NSUInteger)count
                        completion:(TTATweetLoadingBlock)block;

- (void)downloadTweetsByScreenName:(NSString *)screenName
                             maxID:(int64_t)maxID
                             count:(NSUInteger)count
                        completion:(TTATweetLoadingBlock)block;

- (void)saveTweets:(NSArray<TTATweet *> *)tweets withCompletion:(TTAErrorBlock)block;
- (void)obtainTweetsFromLocalStorageWithCompletion:(TTATweetLoadingBlock)block;
- (void)obtainLocalMinTweetIDWithCompletion:(TTAIDResultBlock)block;
- (void)obtainLocalMaxTweetIDWithCompletion:(TTAIDResultBlock)block;

@end
