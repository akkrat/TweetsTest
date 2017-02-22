//
//  TTAHMACSHA1HashingAlgorithm.m
//  TweetsTest
//
//  Created by a.protko on 12.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTAHMACSHA1HashingAlgorithm.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation TTAHMACSHA1HashingAlgorithm

- (NSString *)hashOfData:(NSString *)data withKey:(NSString *)key {
    const char *cKey  = [key cStringUsingEncoding:NSASCIIStringEncoding];
    const char *cData = [data cStringUsingEncoding:NSASCIIStringEncoding];

    unsigned char cHMAC[CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    
    NSData *hmac = [[NSData alloc] initWithBytes:cHMAC length:sizeof(cHMAC)];
    NSString *hash = [hmac base64EncodedStringWithOptions:kNilOptions];

    return hash;
}
@end
