//
//  TTAAuthorizationFieldBuilder.h
//  TweetsTest
//
//  Created by a.protko on 11.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Протокол построителя заголовка `Authorization`
 */
@protocol TTAAuthorizationFieldBuilder <NSObject>

/**
 Метод для построения заголовка `Authorization`

 @param url url запроса
 @param method метод
 @param parameters параметры
 @return значение заголовка `Authorization`
 */
- (NSString *)buildAuthorizationFieldWithURL:(NSURL *)url
                                      method:(NSString *)method
                                  parameters:(NSDictionary *)parameters;

@end
