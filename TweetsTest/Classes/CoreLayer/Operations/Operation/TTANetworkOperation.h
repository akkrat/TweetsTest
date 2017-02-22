//
//  TTANetworkOperation.h
//  TweetsTest
//
//  Created by a.protko on 11.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

@import Foundation;

#import "Common.h"
#import "TTAAsyncOperation.h"

@protocol TTARequestBuilder;
@protocol TTANetworkClient;
@protocol TTAParser;
@protocol TTAValidator;
@protocol TTAMapper;

@interface TTANetworkOperation : TTAAsyncOperation

@property (nonatomic, strong) id<TTARequestBuilder> requestFactory;
@property (nonatomic, strong) id<TTANetworkClient> client;
@property (nonatomic, strong) id<TTAParser> parser;
@property (nonatomic, strong) id<TTAValidator> validator;
@property (nonatomic, strong) id<TTAMapper> mapper;

@property (nonatomic, copy) NSString *method;
@property (nonatomic, copy) NSURL *baseURL;
@property (nonatomic, copy) NSString *endpoint;
@property (nonatomic, copy) NSDictionary *parameters;

@property (nonatomic, copy) TTAResultBlock operationCompletionBlock;


@end
