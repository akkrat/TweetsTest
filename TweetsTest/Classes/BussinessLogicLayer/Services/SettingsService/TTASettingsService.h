//
//  TTASettingsService.h
//  TweetsTest
//
//  Created by a.protko on 22.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TTASettingsService <NSObject>

- (BOOL)shouldDisplayImages;
- (void)saveDisplayImagesFlag:(BOOL)shouldDisplayImages;

@end
