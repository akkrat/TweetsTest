//
//  NSCharacterSet+TTANoEscaped.m
//  TweetsTest
//
//  Created by a.protko on 11.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

@import Foundation;
#import "NSCharacterSet+TTANoEscaped.h"

@implementation NSCharacterSet (TTANoEscaped)

+ (NSCharacterSet *)tta_noEscapedCharacterSet {
    static NSCharacterSet *noEscapedCharacterSet = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *alphaNumerics = @"abcdefghijklmnopqrstuvwxyz"
                                   "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                   "0123456789_-.~";

        noEscapedCharacterSet = [NSCharacterSet characterSetWithCharactersInString:alphaNumerics];
    });

    return noEscapedCharacterSet;
}

@end
