//
//  TTATwitterHeadersBuilder.m
//  TweetsTest
//
//  Created by a.protko on 11.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTAAuthorizationFieldBuilder.h"
#import "TTATwitterHeadersBuilder.h"

@implementation TTATwitterHeadersBuilder

- (NSDictionary *)buildHeadersWithURL:(NSURL *)url
                               method:(NSString *)method
                           parameters:(NSDictionary *)parameters {
    NSString *authorizationField = [self.authorizationFieldBuilder buildAuthorizationFieldWithURL:url
                                                                                           method:method
                                                                                       parameters:parameters];

    __auto_type result = @{
                           @"Content-Type": @"application/x-www-form-urlencoded",
                           @"Authorization": authorizationField
    };

    return result;
}

@end
