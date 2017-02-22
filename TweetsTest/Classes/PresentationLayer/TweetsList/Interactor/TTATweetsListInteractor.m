//
//  TTATweetsListInteractor.m
//  TweetsTest
//
//  Created by a.protko on 20.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTATweetsListInteractor.h"
#import "TTADataStorage.h"
#import "TTATweetsListInteractorOutput.h"
#import "TTATweetsService.h"
#import "TTASettingsService.h"
#import <EXTScope.h>

static NSInteger const TTAPageSize = 20;
static NSString *const TTAScreenName = @"applenws";

@implementation TTATweetsListInteractor

- (BOOL)shouldDisplayImages {
    return [self.settingsService shouldDisplayImages];
}

- (void)loadCachedTweets {
    @weakify(self);
    [self.tweetsService obtainTweetsFromLocalStorageWithCompletion:^(NSArray<TTATweet *> *tweets, NSError *error) {
        @strongify(self);
        [self.output didLoadTweets:tweets withError:error];
    }];
}

- (void)loadRecentTweets {
    @weakify(self);
    [self.tweetsService obtainLocalMaxTweetIDWithCompletion:^(NSNumber *tweetID, NSError *error) {
        @strongify(self);
        if (error != nil) {
            [self.output didLoadTweets:nil withError:error];
            return;
        }

        int64_t sinceID = [tweetID longLongValue] + 1;
        [self.tweetsService downloadTweetsByScreenName:TTAScreenName sinceID:sinceID count:TTAPageSize completion:^(NSArray<TTATweet *> *tweets, NSError *error) {
            @strongify(self);
            [self.output didLoadTweets:tweets withError:error];
        }];
    }];
}

- (void)loadNextPage {
    @weakify(self);
    [self.tweetsService obtainLocalMinTweetIDWithCompletion:^(NSNumber *tweetID, NSError *error) {
        @strongify(self);
        if (error != nil) {
            [self.output didLoadTweets:nil withError:error];
            return;
        }

        int64_t maxID = [tweetID longLongValue] - 1;
        [self.tweetsService downloadTweetsByScreenName:TTAScreenName maxID:maxID count:TTAPageSize completion:^(NSArray<TTATweet *> *tweets, NSError *error) {
            @strongify(self);
            [self.output didLoadTweets:tweets withError:error];
        }];
    }];
}

@end
