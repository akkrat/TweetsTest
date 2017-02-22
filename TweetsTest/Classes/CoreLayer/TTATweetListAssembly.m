//
//  TTATweetListAssembly.m
//  TweetsTest
//
//  Created by a.protko on 17.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTATweetListAssembly.h"
#import "TTATweetListViewController.h"
#import "TTACoreAssembly.h"
#import "TTATweetsListInteractor.h"
#import "TTATweetsListDataDisplayManager.h"
#import "TTAServicesAssembly.h"

static const NSUInteger TTACounterMax = 60;

@implementation TTATweetListAssembly

- (id)tweetListViewController {
    return [TyphoonDefinition withClass:[TTATweetListViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(interactor) with:[self tweetListInteractor]];
                              [definition injectProperty:@selector(dataDisplayManager) with:[self tweetListDatadisplayManager]];
                              [definition injectProperty:@selector(counterMax) with:@(TTACounterMax)];
                          }];
}

- (id)tweetListInteractor {
    return [TyphoonDefinition withClass:[TTATweetsListInteractor class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(tweetsService) with:[self.servicesAssembly tweetsService]];
        [definition injectProperty:@selector(dataStorage) with:[self.coreAssembly dataStorage]];
        [definition injectProperty:@selector(settingsService) with:[self.servicesAssembly settingsService]];
        [definition injectProperty:@selector(output) with:[self tweetListViewController]];
    }];
}

- (id)tweetListDatadisplayManager {
    return [TyphoonDefinition withClass:[TTATweetsListDataDisplayManager class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(delegate) with:[self tweetListViewController]];
    }];
}

@end
