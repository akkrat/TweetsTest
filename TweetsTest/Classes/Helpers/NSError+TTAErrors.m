//
//  NSError+TTAErrors.m
//  TweetsTest
//
//  Created by a.protko on 22.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "NSError+TTAErrors.h"

static NSString *const TTAErrorDomain = @"org.pa.TweetsTest.error";
static NSInteger const TTAValidationError = 1;

@implementation NSError (TTAErrors)

+ (NSError *)tta_validationError {
    return [NSError errorWithDomain:TTAErrorDomain code:TTAValidationError userInfo:nil];
}

@end
