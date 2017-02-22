//
//  TTATweetsMapper.h
//  TweetsTest
//
//  Created by a.protko on 18.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTAMapper.h"

@interface TTATweetsMapper : NSObject<TTAMapper>

@property (nonatomic, strong) id<TTAMapper> tweetMapper;

@end
