//
//  TTATweetsListInteractor.h
//  TweetsTest
//
//  Created by a.protko on 20.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TTATweetsListInteractorInput.h"

@protocol TTATweetsListInteractorOutput;
@protocol TTADataStorage;
@protocol TTATweetsService;
@protocol TTASettingsService;


@interface TTATweetsListInteractor : NSObject<TTATweetsListInteractorInput>

@property (nonatomic, weak) id<TTATweetsListInteractorOutput> output;

@property (nonatomic, strong) id<TTATweetsService> tweetsService;
@property (nonatomic, strong) id<TTADataStorage> dataStorage;
@property (nonatomic, strong) id<TTASettingsService> settingsService;

@end
