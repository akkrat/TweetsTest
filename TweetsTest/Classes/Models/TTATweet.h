//
//  TTATweet.h
//  TweetsTest
//
//  Created by a.protko on 16.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTAStorableObject.h"

@interface TTATweet : NSObject<TTAStorableObject>

@property (nonatomic, assign) int64_t tweetID;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *photoID;
@property (nonatomic, copy) NSString *authorName;

@end
