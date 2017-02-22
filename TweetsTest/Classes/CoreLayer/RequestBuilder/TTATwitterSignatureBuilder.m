//
//  TTATwitterSignatureBuilder.m
//  TweetsTest
//
//  Created by a.protko on 12.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTATwitterSignatureBuilder.h"
#import "TTAHashingAlghorithm.h"
#import "TTASignatureBaseStringBuilder.h"
#import "NSCharacterSet+TTANoEscaped.h"

@interface TTATwitterSignatureBuilder ()

@property (nonatomic, copy, readonly) NSString *signatureKey;

@end

@implementation TTATwitterSignatureBuilder

@synthesize signatureKey = _signatureKey;

- (NSString *)buildSignatureWithURL:(NSURL *)url
                             method:(NSString *)method
                         parameters:(NSDictionary *)parameters {
    NSString *signatureBaseString = [self.signatureBaseStringBuilder buildSignatureBaseStringWithURL:url
                                                                                              method:method
                                                                                          parameters:parameters];
    NSString *signature = [self.hasher hashOfData:signatureBaseString withKey:self.signatureKey];

    return signature;
}

- (NSString *)signatureKey {
    if (_signatureKey == nil) {
        const __auto_type noEscapedCharacters = [NSCharacterSet tta_noEscapedCharacterSet];

        NSString *escapedConsumerSecret = [self.consumerSecret stringByAddingPercentEncodingWithAllowedCharacters:noEscapedCharacters];
        NSString *escapedAccessTokenSecret = [self.accessTokenSecret stringByAddingPercentEncodingWithAllowedCharacters:noEscapedCharacters];

        NSMutableString *key = [NSMutableString new];
        [key appendString:escapedConsumerSecret];
        [key appendString:@"&"];
        [key appendString:escapedAccessTokenSecret];

        _signatureKey = [key copy];
    }

    return _signatureKey;
}

@end
