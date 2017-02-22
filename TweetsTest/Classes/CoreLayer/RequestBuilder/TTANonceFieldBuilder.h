//
//  TTANonceFieldBuilder.h
//  TweetsTest
//
//  Created by a.protko on 12.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Протокол объекта, генерируещего поле `oauth_nonce`
 */
@protocol TTANonceFieldBuilder <NSObject>

/**
 Метод генерирует уникальную строку для поля `oauth_nonce`

 @return случайное значение поля `oauth_nonce`
 */
- (NSString *)generateNonceField;

@end
