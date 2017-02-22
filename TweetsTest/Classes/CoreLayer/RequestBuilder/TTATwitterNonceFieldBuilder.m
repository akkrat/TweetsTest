//
//  TTATwitterNonceFieldBuilder.m
//  TweetsTest
//
//  Created by a.protko on 12.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTATwitterNonceFieldBuilder.h"

@implementation TTATwitterNonceFieldBuilder

- (NSString *)generateNonceField {
    const NSUInteger length = 32;
    uint8_t buffer[length];
    
    arc4random_buf(buffer, length);
    NSData *radomData = [NSData dataWithBytes:buffer length:length];
    NSString *base64 = [radomData base64EncodedStringWithOptions:kNilOptions];
    NSString *result = [base64 stringByReplacingOccurrencesOfString:@"^[\\+\\/=]"
                                                         withString:@""
                                                            options:NSRegularExpressionSearch
                                                              range:NSMakeRange(0, base64.length)];

    return result;
}

@end
