//
//  TTATweet.m
//  TweetsTest
//
//  Created by a.protko on 16.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTATweet.h"

@implementation TTATweet

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _tweetID = [dictionary[NSStringFromSelector(@selector(tweetID))] longLongValue];
        _authorName = [dictionary[NSStringFromSelector(@selector(authorName))] copy];
        _text = [dictionary[NSStringFromSelector(@selector(text))] copy];
        _photoID = [dictionary[NSStringFromSelector(@selector(photoID))] copy];
    }
    return self;
}

- (NSArray *)rawValues {
    return @[
             @(self.tweetID),
             self.text,
             self.authorName,
             self.photoID
    ];
}

@end
