//
//  TTATwitterSignatureBaseStringBuilder.m
//  TweetsTest
//
//  Created by a.protko on 12.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTATwitterSignatureBaseStringBuilder.h"
#import "NSCharacterSet+TTANoEscaped.h"

@implementation TTATwitterSignatureBaseStringBuilder

- (NSString *)buildSignatureBaseStringWithURL:(NSURL *)url
                                       method:(NSString *)method
                                   parameters:(NSDictionary *)parameters {

    const __auto_type noEscapedCharacters = [NSCharacterSet tta_noEscapedCharacterSet];

    NSMutableString *result = [NSMutableString new];
    [result appendString:[method uppercaseString]];
    [result appendString:@"&"];

    NSString *escapedURL = [url.absoluteString stringByAddingPercentEncodingWithAllowedCharacters:noEscapedCharacters];
    [result appendString:escapedURL];
    [result appendString:@"&"];

    NSString *parametersString = [self parametersStringWith:parameters];
    NSString *escapedParametersString = [parametersString stringByAddingPercentEncodingWithAllowedCharacters:noEscapedCharacters];
    [result appendString:escapedParametersString];

    return [result copy];
}

- (NSString *)parametersStringWith:(NSDictionary *)parameters {
    NSArray<NSString *> *sortedKeys = [parameters.allKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    const __auto_type noEscapedCharacters = [NSCharacterSet tta_noEscapedCharacterSet];

    NSMutableString *result = [NSMutableString new];
    BOOL first = YES;

    for (NSString *key in sortedKeys) {
        NSString *value = parameters[key];
        NSString *encodedKey = [key stringByAddingPercentEncodingWithAllowedCharacters:noEscapedCharacters];
        NSString *encodedValue = [value stringByAddingPercentEncodingWithAllowedCharacters:noEscapedCharacters];

        if (!first) {
            [result appendString:@"&"];
        } else {
            first = NO;
        }

        [result appendString:encodedKey];
        [result appendString:@"="];
        [result appendString:encodedValue];
    }
    
    return [result copy];
}

@end
