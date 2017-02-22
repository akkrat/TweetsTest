//
//  TTANetworkClient.h
//  TweetsTest
//
//  Created by a.protko on 11.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TTAClientCompletionBlock)(NSData *data, NSError *error);

@protocol TTANetworkClient <NSObject>

- (void)performRequest:(NSURLRequest *)request withCompletion:(TTAClientCompletionBlock)block;

@end
