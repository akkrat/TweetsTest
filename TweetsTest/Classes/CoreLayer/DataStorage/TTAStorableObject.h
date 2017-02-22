//
//  TTAStorableObject.h
//  TweetsTest
//
//  Created by a.protko on 21.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Протокол объектов хранимых в хранилище
 */
@protocol TTAStorableObject <NSObject>

/**
 Массив значений свойств для сохранения
 */
@property (nonatomic, copy, readonly) NSArray *rawValues;

/**
 Создает объект из данных хранилища

 @param dictionary словарь со свойствами
 @return объект, прочитанный из хранилища
 */
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
