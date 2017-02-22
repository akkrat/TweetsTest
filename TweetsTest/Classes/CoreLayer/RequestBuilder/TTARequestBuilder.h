//
//  TTARequestBuilder.h
//  TweetsTest
//
//  Created by a.protko on 16.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TTARequestBuilder <NSObject>

/**
 Строит запрос по переданным параметрам

 @param method метод
 @param url base url
 @param endpoint endpoint
 @param parameters параметры
 @return запрос
 */
- (NSURLRequest *)requestWithMethod:(NSString *)method
                            baseURL:(NSURL *)url
                           endpoint:(NSString *)endpoint
                         parameters:(NSDictionary *)parameters;

@end
