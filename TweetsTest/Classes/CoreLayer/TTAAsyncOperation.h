//
//  TTAAsyncOperation.h
//  TweetsTest
//
//  Created by a.protko on 16.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

@import Foundation;

@interface TTAAsyncOperation : NSOperation

/**
 Необходимо переопределить метод.
 */
- (void)main;

/**
 Необходимо вызвать по завершению операции.
 Выставляет флаги о завершение операции.
 */
- (void)complete;

@end
