//
//  TTASignatureBuilder.h
//  TweetsTest
//
//  Created by a.protko on 12.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Протокол построителя подписи запроса
 */
@protocol TTASignatureBuilder <NSObject>

/**
 Метод для построения подписи запроса

 @param url url
 @param method метод
 @param parameters параметры
 @return подпись
 */
- (NSString *)buildSignatureWithURL:(NSURL *)url
                             method:(NSString *)method
                         parameters:(NSDictionary *)parameters;

@end
