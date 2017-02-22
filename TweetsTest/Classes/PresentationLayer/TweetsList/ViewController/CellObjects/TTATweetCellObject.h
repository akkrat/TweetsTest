//
//  TTATweetCellObject.h
//  TweetsTest
//
//  Created by a.protko on 20.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTATweet.h"
#import <UIKit/UIKit.h>

@interface TTATweetCellObject : NSObject

@property (nonatomic, strong) TTATweet *model;
@property (nonatomic, assign) BOOL shouldDisplayImage;

- (instancetype)initWithModel:(TTATweet *)model
           shouldDisplayImage:(BOOL)shouldDisplayImage;

@end
