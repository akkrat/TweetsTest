//
//  TTASignatureBaseStringBuilder.h
//  TweetsTest
//
//  Created by a.protko on 12.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Протокол построителя `Signature Base String`
 */
@protocol TTASignatureBaseStringBuilder <NSObject>

/**
 Метод для построения `Signature Base String`

 @param url url запроса
 @param method метод
 @param parameters параметры
 @return `Signature Base String`
 */
- (NSString *)buildSignatureBaseStringWithURL:(NSURL *)url
                                       method:(NSString *)method
                                   parameters:(NSDictionary *)parameters;

@end
