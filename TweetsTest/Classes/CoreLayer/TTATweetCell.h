//
//  TTATweetCell.h
//  TweetsTest
//
//  Created by a.protko on 18.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TTATweetCellObject;

@interface TTATweetCell : UITableViewCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *avatarImageViewWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tweetLabelLeadingConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *authorLabelLeadingConstraint;

@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;

- (void)configureWithCellObject:(TTATweetCellObject *)cellObject;

@end
