//
//  TTASettingsServiceBase.h
//  TweetsTest
//
//  Created by a.protko on 22.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTASettingsService.h"

@interface TTASettingsServiceBase : NSObject<TTASettingsService>

@property (nonatomic, strong) NSUserDefaults *userDefaults;

@end
