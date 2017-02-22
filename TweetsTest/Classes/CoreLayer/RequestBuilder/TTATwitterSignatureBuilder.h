//
//  TTATwitterSignatureBuilder.h
//  TweetsTest
//
//  Created by a.protko on 12.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTASignatureBuilder.h"

@protocol TTAHashingAlghorithm;
@protocol TTASignatureBaseStringBuilder;

/**
 Класс построителя подписи запроса
 */
@interface TTATwitterSignatureBuilder : NSObject<TTASignatureBuilder>

@property (nonatomic, copy) NSString *consumerSecret;
@property (nonatomic, copy) NSString *accessTokenSecret;
@property (nonatomic, strong) id<TTAHashingAlghorithm> hasher;
@property (nonatomic, strong) id<TTASignatureBaseStringBuilder> signatureBaseStringBuilder;


@end
