//
//  TTATweetCell.m
//  TweetsTest
//
//  Created by a.protko on 18.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTATweetCell.h"
#import "TTATweetCellObject.h"
#import <UIImageView+WebCache.h>

static const CGFloat TTAAvatarMargin = 8;

@implementation TTATweetCell

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

- (void)configureWithCellObject:(TTATweetCellObject *)cellObject {
    if (cellObject.shouldDisplayImage) {
        NSURL *url = [NSURL URLWithString:cellObject.model.photoID];
        [self.avatarImageView sd_setImageWithURL:url];
    } else {
        self.avatarImageView.image = nil;
    }
    self.avatarImageView.hidden = !cellObject.shouldDisplayImage;

    [self updateLabelsConstraints:cellObject.shouldDisplayImage];

    self.tweetLabel.text = cellObject.model.text;
    self.authorLabel.text = cellObject.model.authorName;
}

- (void)updateLabelsConstraints:(BOOL)shouldDisplayImage {
    CGFloat margin;
    if (shouldDisplayImage) {
        margin = self.avatarImageViewWidthConstraint.constant + 2 * TTAAvatarMargin;
    } else {
        margin = TTAAvatarMargin;
    }

    self.tweetLabelLeadingConstraint.constant = margin;
    self.authorLabelLeadingConstraint.constant = margin;
}

@end
