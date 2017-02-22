//
//  TTATwitterHeadersBuilder.h
//  TweetsTest
//
//  Created by a.protko on 11.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTAHeadersBuilder.h"

@protocol TTAAuthorizationFieldBuilder;

/**
 Построитель заголовков запроса
 */
@interface TTATwitterHeadersBuilder : NSObject<TTAHeadersBuilder>

@property (nonatomic, strong) id<TTAAuthorizationFieldBuilder> authorizationFieldBuilder;

@end
