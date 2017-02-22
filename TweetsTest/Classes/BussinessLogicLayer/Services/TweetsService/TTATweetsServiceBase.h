//
//  TTATweetsServiceBase.h
//  TweetsTest
//
//  Created by a.protko on 17.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTATweetsService.h"

@protocol TTAOperationsFactory;
@protocol TTADataStorage;

@interface TTATweetsServiceBase : NSObject<TTATweetsService>

@property (nonatomic, strong) id<TTAOperationsFactory> operationsFactory;
@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, strong) id<TTADataStorage> dataStorage;

@end
