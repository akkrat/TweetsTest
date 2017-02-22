//
//  TTASettingsServiceBase.m
//  TweetsTest
//
//  Created by a.protko on 22.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTASettingsServiceBase.h"

static NSString *const TTAShouldDisplayImages = @"ShouldDisplayImages";

@implementation TTASettingsServiceBase

- (BOOL)shouldDisplayImages {
    return [self.userDefaults boolForKey:TTAShouldDisplayImages];
}

- (void)saveDisplayImagesFlag:(BOOL)shouldDisplayImages {
    [self.userDefaults setBool:shouldDisplayImages
                        forKey:TTAShouldDisplayImages];
    [self.userDefaults synchronize];
}

@end
