//
//  TTATweetCellObject.m
//  TweetsTest
//
//  Created by a.protko on 20.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTATweetCellObject.h"

@implementation TTATweetCellObject

- (instancetype)initWithModel:(TTATweet *)model
           shouldDisplayImage:(BOOL)shouldDisplayImage {
    self = [super init];
    if (self) {
        _model = model;
        _shouldDisplayImage = shouldDisplayImage;
    }
    return self;
}

@end
