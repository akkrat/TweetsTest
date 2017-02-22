//
//  TTAServicesAssembly.h
//  TweetsTest
//
//  Created by a.protko on 22.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@protocol TTATweetsService;
@protocol TTASettingsService;
@class TTAOperationsFactoryBase;
@class TTACoreAssembly;

@interface TTAServicesAssembly : TyphoonAssembly

- (id<TTATweetsService>)tweetsService;
- (id<TTASettingsService>)settingsService;

@property (nonatomic, strong) TTAOperationsFactoryBase *operationsFactory;
@property (nonatomic, strong) TTACoreAssembly *coreAssembly;

@end
