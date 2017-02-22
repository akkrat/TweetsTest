//
//  TTATwitterAuthorizationFieldBuilder.h
//  TweetsTest
//
//  Created by a.protko on 11.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTAAuthorizationFieldBuilder.h"

@protocol TTANonceFieldBuilder;
@protocol TTATimestampFieldBuilder;
@protocol TTASignatureBuilder;

/**
 Класс построителя заголовка `Authorization`
 */
@interface TTATwitterAuthorizationFieldBuilder : NSObject<TTAAuthorizationFieldBuilder>

@property (nonatomic, copy) NSString *accessToken;
@property (nonatomic, copy) NSString *consumerKey;

@property (nonatomic, strong) id<TTANonceFieldBuilder> nonceFieldBuilder;
@property (nonatomic, strong) id<TTATimestampFieldBuilder> timestampFieldBuilder;
@property (nonatomic, strong) id<TTASignatureBuilder> signatureBuilder;

@end
