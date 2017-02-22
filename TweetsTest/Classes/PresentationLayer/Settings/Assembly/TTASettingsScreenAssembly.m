//
//  TTASettingsScreenAssembly.m
//  TweetsTest
//
//  Created by a.protko on 22.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTASettingsScreenAssembly.h"
#import "TTASettingsViewController.h"
#import "TTAServicesAssembly.h"

@implementation TTASettingsScreenAssembly

- (UIViewController *)settingsViewController {
    return [TyphoonDefinition withClass:[TTASettingsViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(settingsService) with:[self.servicesAssembly settingsService]];
                          }];
}

@end
