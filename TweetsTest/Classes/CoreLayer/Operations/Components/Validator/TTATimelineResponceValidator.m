//
//  TTATimelineResponceValidator.m
//  TweetsTest
//
//  Created by a.protko on 18.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTATimelineResponceValidator.h"
#import "NSError+TTAErrors.h"

@implementation TTATimelineResponceValidator

- (BOOL)validateResponse:(id)response error:(NSError *__autoreleasing *)error {
    if ([response isKindOfClass:[NSArray class]]) {
        return YES;
    }

    if (error != nil) {
        *error = [NSError tta_validationError];
    }
    return NO;
}

@end
