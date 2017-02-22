//
//  TTASettingsViewController.h
//  TweetsTest
//
//  Created by a.protko on 21.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TTASettingsService;

@interface TTASettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISwitch *displayImagesSwitch;

@property (nonatomic, strong) id<TTASettingsService> settingsService;

@end
