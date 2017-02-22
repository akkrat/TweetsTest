//
//  TTATweetMapper.m
//  TweetsTest
//
//  Created by a.protko on 18.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTATweetMapper.h"
#import "TTATweet.h"

@implementation TTATweetMapper

- (TTATweet *)map:(NSDictionary *)response {
    TTATweet *tweet = [TTATweet new];
    
    NSDictionary *user = response[@"user"];

    tweet.text = response[@"text"];
    tweet.tweetID = [response[@"id"] longLongValue];
    tweet.authorName = user[@"name"];
    tweet.photoID = user[@"profile_image_url_https"];

    return tweet;
}

@end
