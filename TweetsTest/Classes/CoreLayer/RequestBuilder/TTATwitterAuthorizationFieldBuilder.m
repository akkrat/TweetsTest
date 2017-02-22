//
//  TTATwitterAuthorizationFieldBuilder.m
//  TweetsTest
//
//  Created by a.protko on 11.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTATwitterAuthorizationFieldBuilder.h"
#import "NSCharacterSet+TTANoEscaped.h"
#import "TTANonceFieldBuilder.h"
#import "TTATimestampFieldBuilder.h"
#import "TTASignatureBuilder.h"

@implementation TTATwitterAuthorizationFieldBuilder

- (NSString *)buildAuthorizationFieldWithURL:(NSURL *)url
                                      method:(NSString *)method
                                  parameters:(NSDictionary *)parameters {
    NSString *nonce = [self.nonceFieldBuilder generateNonceField];
    NSString *timestamp = [self.timestampFieldBuilder obtainCurrentTimestamp];

    NSDictionary *headers = @{
        @"oauth_consumer_key": self.consumerKey,
        @"oauth_nonce": nonce,
        @"oauth_version": @"1.0",
        @"oauth_token": self.accessToken,
        @"oauth_timestamp": timestamp,
        @"oauth_signature_method": @"HMAC-SHA1",
    };

    NSMutableDictionary *allHeaders = [headers mutableCopy];
    [allHeaders addEntriesFromDictionary:parameters];
    NSString *signature = [self.signatureBuilder buildSignatureWithURL:url
                                                                method:method
                                                            parameters:[allHeaders copy]];

    NSMutableDictionary *oauthHeaders = [headers mutableCopy];
    [oauthHeaders setObject:signature forKey:@"oauth_signature"];

    NSMutableString *result = [@"OAuth " mutableCopy];
    NSArray<NSString *> *sortedKeys = [oauthHeaders.allKeys sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
    BOOL first = YES;

    const __auto_type noEscapedCharacters = [NSCharacterSet tta_noEscapedCharacterSet];

    for (NSString *key in sortedKeys) {
        NSString *value = oauthHeaders[key];
        NSString *encodedKey = [key stringByAddingPercentEncodingWithAllowedCharacters:noEscapedCharacters];
        NSString *encodedValue = [value stringByAddingPercentEncodingWithAllowedCharacters:noEscapedCharacters];

        if (!first) {
            [result appendString:@", "];
        } else {
            first = NO;
        }

        [result appendString:encodedKey];
        [result appendString:@"=\""];
        [result appendString:encodedValue];
        [result appendString:@"\""];
    }

    return [result copy];
}

@end
