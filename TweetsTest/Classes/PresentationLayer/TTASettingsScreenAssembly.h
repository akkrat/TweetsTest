//
//  TTASettingsScreenAssembly.h
//  TweetsTest
//
//  Created by a.protko on 22.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@class TTAServicesAssembly;

@interface TTASettingsScreenAssembly : TyphoonAssembly

- (UIViewController *)settingsViewController;

@property (nonatomic, strong) TTAServicesAssembly *servicesAssembly;

@end
