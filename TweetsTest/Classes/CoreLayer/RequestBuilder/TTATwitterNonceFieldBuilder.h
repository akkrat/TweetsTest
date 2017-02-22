//
//  TTATwitterNonceFieldBuilder.h
//  TweetsTest
//
//  Created by a.protko on 12.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTANonceFieldBuilder.h"

/**
 Класс генератора уникальных строк для построения 'oauth_nonce' поля
 
 @see https://dev.twitter.com/oauth/overview/authorizing-requests
 */
@interface TTATwitterNonceFieldBuilder : NSObject<TTANonceFieldBuilder>

@end
