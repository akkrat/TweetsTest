//
//  TTASettingsViewController.m
//  TweetsTest
//
//  Created by a.protko on 21.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTASettingsViewController.h"
#import "TTASettingsService.h"

@implementation TTASettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BOOL isOn = [self.settingsService shouldDisplayImages];
    self.displayImagesSwitch.on = isOn;
}

- (IBAction)didChangeDisplayImagesSetting:(UISwitch *)sender {
    BOOL isOn = self.displayImagesSwitch.isOn;
    [self.settingsService saveDisplayImagesFlag:isOn];
}

- (IBAction)didTapDoneButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
