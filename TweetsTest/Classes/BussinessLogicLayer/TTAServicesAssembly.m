//
//  TTAServicesAssembly.m
//  TweetsTest
//
//  Created by a.protko on 22.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTAServicesAssembly.h"
#import "TTATweetsServiceBase.h"
#import "TTACoreAssembly.h"
#import "TTASettingsServiceBase.h"

static NSString *const TTANetworkQueueName = @"queue.org.pa.TweetsTest.network";

@implementation TTAServicesAssembly

- (id<TTATweetsService>)tweetsService {
    return [TyphoonDefinition withClass:[TTATweetsServiceBase class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(operationsFactory) with:self.operationsFactory];
                              [definition injectProperty:@selector(queue) with:[self networkQueue]];
                              [definition injectProperty:@selector(dataStorage) with:[self.coreAssembly dataStorage]];

                              definition.scope = TyphoonScopeSingleton;
                          }];
}

- (id<TTASettingsService>)settingsService {
    return [TyphoonDefinition withClass:[TTASettingsServiceBase class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(userDefaults) with:[self userDefaults]];

                              definition.scope = TyphoonScopeSingleton;
                          }];
}

- (NSUserDefaults *)userDefaults {
    return [NSUserDefaults standardUserDefaults];
}

- (NSOperationQueue *)networkQueue {
    return [TyphoonDefinition withClass:[NSOperationQueue class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(name) with:TTANetworkQueueName];
                              definition.scope = TyphoonScopeSingleton;
                          }];
}

@end
