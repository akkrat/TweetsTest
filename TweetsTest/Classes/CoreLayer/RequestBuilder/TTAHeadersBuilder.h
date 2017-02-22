//
//  TTAHeadersBuilder.h
//  TweetsTest
//
//  Created by a.protko on 11.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Протокол построителя заголовков запроса
 */
@protocol TTAHeadersBuilder <NSObject>

/**
 Метод для построения заголовков запроса

 @param url url запроса
 @param method метод
 @param parameters параметры запроса
 @return заголовки запроса
 */
- (NSDictionary *)buildHeadersWithURL:(NSURL *)url
                               method:(NSString *)method
                           parameters:(NSDictionary *)parameters;


@end
