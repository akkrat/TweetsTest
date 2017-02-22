//
//  TTATimestampFieldBuilder.h
//  TweetsTest
//
//  Created by a.protko on 12.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Протокол объекта, генерирующего Unix метку
 */
@protocol TTATimestampFieldBuilder <NSObject>

/**
 Метод для получения текущей Unix метки

 @return строка с Unix меткой
 */
- (NSString *)obtainCurrentTimestamp;

@end
