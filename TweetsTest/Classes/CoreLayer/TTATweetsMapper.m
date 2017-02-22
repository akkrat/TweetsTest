//
//  TTATweetsMapper.m
//  TweetsTest
//
//  Created by a.protko on 18.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTATweetsMapper.h"
#import "TTATweet.h"

@implementation TTATweetsMapper

- (NSArray<TTATweet *> *)map:(NSArray *)response {
    NSMutableArray<TTATweet *> *tweets = [[NSMutableArray alloc] initWithCapacity:response.count];
    for (NSDictionary *status in response) {
        TTATweet *tweet = [self.tweetMapper map:status];
        [tweets addObject:tweet];
    }
    return [tweets copy];
}

@end
