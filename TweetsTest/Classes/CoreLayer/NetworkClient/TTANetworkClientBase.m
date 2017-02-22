//
//  TTANetworkClientBase.m
//  TweetsTest
//
//  Created by a.protko on 11.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTANetworkClientBase.h"

@implementation TTANetworkClientBase

- (void)performRequest:(NSURLRequest *)request withCompletion:(TTAClientCompletionBlock)block {
    __auto_type task = [self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        block(data, error);
    }];

    [task resume];
}

@end
