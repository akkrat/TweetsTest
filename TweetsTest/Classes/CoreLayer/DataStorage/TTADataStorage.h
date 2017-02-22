//
//  TTADataStorage.h
//  TweetsTest
//
//  Created by a.protko on 17.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTATweet.h"
#import "Common.h"
#import <FMDatabase.h>

@protocol TTAStorableObject;

/**
 Протокол хранилища данных
 */
@protocol TTADataStorage <NSObject>

/**
 Выполняет запрос и возвращает массив объектов заданного класса или ошибку

 @param query запрос на выборку
 @param clazz класс возвращаемых объектов
 @param block блок результата
 */
- (void)fetchObjectsWithQuery:(NSString *)query
                storableClass:(Class)clazz
                   completion:(TTAResultBlock)block;

/**
 Выполняет запрос и возвращает массив объектов заданного класса или ошибку

 @param query запрос на выборку
 @param arguments параметры запроса
 @param clazz класс возвращаемых объектов
 @param block блок результата
 */
- (void)fetchObjectsWithQuery:(NSString *)query
                    arguments:(NSArray *)arguments
                storableClass:(Class)clazz
                   completion:(TTAResultBlock)block;

/**
 Сохраняет массив объектов в хранилище

 @param objects объекты для записи
 @param statement параметризированный запрос на сохранение
 @param block блок результата
 */
- (void)saveObjects:(NSArray<id<TTAStorableObject>> *)objects
          withQuery:(NSString *)statement
         completion:(TTAErrorBlock)block;

/**
 Выполняет скалярный запрос

 @param query запрос
 @param block блок завершения
 */
- (void)fetchScalarWithQuery:(NSString *)query
                  completion:(TTAResultBlock)block;

@end
