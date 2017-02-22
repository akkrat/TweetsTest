//
//  TTANetworkOperation.m
//  TweetsTest
//
//  Created by a.protko on 11.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTANetworkOperation.h"
#import "TTAMapper.h"
#import "TTAParser.h"
#import "TTAValidator.h"
#import "TTANetworkClient.h"
#import "TTARequestBuilder.h"
#import <libextobjc/EXTScope.h>

@interface TTANetworkOperation ()



@end

@implementation TTANetworkOperation

- (void)main {
    NSURLRequest *request = [self.requestFactory requestWithMethod:self.method
                                                           baseURL:self.baseURL
                                                          endpoint:self.endpoint
                                                        parameters:self.parameters];
    [self.client performRequest:request withCompletion:^(NSData *data, NSError *error) {
        if ([self handleCancelation]) {
            return;
        }

        if (error != nil) {
            [self completeWithResult:nil error:error];
            return;
        }

        [self parse:data];
    }];
}

- (void)parse:(NSData *)data {
    if ([self handleCancelation]) {
        return;
    }
    [self.parser parseData:data withBlock:^(id result, NSError *error) {
        if (error != nil) {
            [self completeWithResult:nil error:error];
            return;
        }

        [self validate:result];
    }];
}

- (void)validate:(id)data {
    if ([self handleCancelation]) {
        return;
    }

    NSError *error;
    if (![self.validator validateResponse:data error:&error]) {
        [self completeWithResult:nil error:error];
        return;
    }

    [self map:data];
}

- (void)map:(id)data {
    if ([self handleCancelation]) {
        return;
    }

    id result = [self.mapper map:data];
    [self completeWithResult:result error:nil];
}

- (BOOL)handleCancelation {
    if (self.isCancelled) {
        NSError *error = [NSError errorWithDomain:@"org.protko.a.TweetsTest" code:0 userInfo:nil];
        [self completeWithResult:nil error:error];

        return YES;
    }
    return NO;
}

- (void)completeWithResult:(id)result error:(NSError *)error {
    if (self.operationCompletionBlock) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            self.operationCompletionBlock(result, error);
        });
    }

    [self complete];
}

@end
