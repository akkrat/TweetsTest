//
//  TTATwitterRequestBuilder.h
//  TweetsTest
//
//  Created by a.protko on 11.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTARequestBuilder.h"

@protocol TTAHeadersBuilder;

@interface TTATwitterRequestBuilder : NSObject<TTARequestBuilder>

@property (nonatomic, strong) id<TTAHeadersBuilder> headersBuilder;

@end
