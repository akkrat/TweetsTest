//
//  TTACoreAssembly.m
//  TweetsTest
//
//  Created by a.protko on 16.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTACoreAssembly.h"

#import "TTANetworkClientBase.h"
#import "TTATwitterRequestBuilder.h"
#import "TTATwitterHeadersBuilder.h"
#import "TTATwitterSignatureBuilder.h"
#import "TTATwitterNonceFieldBuilder.h"
#import "TTATwitterTimestampFieldBuilder.h"
#import "TTATwitterAuthorizationFieldBuilder.h"
#import "TTATwitterSignatureBaseStringBuilder.h"
#import "TTAHMACSHA1HashingAlgorithm.h"
#import "TTATweetsServiceBase.h"
#import "TTANetworkOperation.h"
#import "TTAOperationsFactoryBase.h"
#import "TTAFMDBDataStorage.h"



static NSString *const TTAConsumerSecretKey = @"ConsumerSecret";
static NSString *const TTAConsumerKeyKey = @"ConsumerKey";
static NSString *const TTAAccessTokenKey = @"AccessToken";
static NSString *const TTAAccessTokenSecretKey = @"AccessTokenSecret";
static NSString *const TTADatabaseNameKey = @"DatabaseName";
static NSString *const TTADatabaseQueueName = @"queue.org.pa.TweetsTest.data";

@implementation TTACoreAssembly

- (id<TTADataStorage>)dataStorage {
    return [TyphoonDefinition withClass:[TTAFMDBDataStorage class]
                   configuration:^(TyphoonDefinition *definition) {
                       [definition injectProperty:@selector(databaseName) with:[self databaseName]];
                       [definition injectProperty:@selector(operationQueue) with:[self databaseQueue]];
                       [definition injectProperty:@selector(callbackQueue) with:[self callbackQueue]];

                       definition.scope = TyphoonScopeSingleton;
                   }];
}

- (NSOperationQueue *)callbackQueue {
    return [TyphoonDefinition withFactory:[NSOperationQueue class] selector:@selector(mainQueue)];
}

- (NSOperationQueue *)databaseQueue {
    return [TyphoonDefinition withClass:[NSOperationQueue class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(name) with:TTADatabaseQueueName];
                              [definition injectProperty:@selector(maxConcurrentOperationCount) with:@(1)];
                              definition.scope = TyphoonScopeSingleton;
                          }];
}

- (id)networkClient {
    return [TyphoonDefinition withClass:[TTANetworkClientBase class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(session) with:[self session]];
                              definition.scope = TyphoonScopeSingleton;
                          }];
}

- (NSURLSession *)session {
    return [NSURLSession sharedSession];
}

- (id)requestFactory {
    return [TyphoonDefinition withClass:[TTATwitterRequestBuilder class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(headersBuilder) with:[self headersBuilder]];
                              definition.scope = TyphoonScopeSingleton;
                          }];
}

- (id)headersBuilder {
    return [TyphoonDefinition withClass:[TTATwitterHeadersBuilder class]
                   configuration:^(TyphoonDefinition *definition) {
                       [definition injectProperty:@selector(authorizationFieldBuilder) with:[self authorizationFieldBuilder]];
                   }];
}

- (id)authorizationFieldBuilder {
    return [TyphoonDefinition withClass:[TTATwitterAuthorizationFieldBuilder class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(nonceFieldBuilder) with:[self nonceFieldBuilder]];
                              [definition injectProperty:@selector(timestampFieldBuilder) with:[self timestampFieldBuilder]];
                              [definition injectProperty:@selector(signatureBuilder) with:[self signatureBuilder]];
                              [definition injectProperty:@selector(accessToken) with:[self accessToken]];
                              [definition injectProperty:@selector(consumerKey) with:[self consumerKey]];
                          }];
}

- (id)timestampFieldBuilder {
    return [TyphoonDefinition withClass:[TTATwitterTimestampFieldBuilder class]];
}

- (id)nonceFieldBuilder {
    return [TyphoonDefinition withClass:[TTATwitterNonceFieldBuilder class]];
}

- (id)signatureBuilder {
    return [TyphoonDefinition withClass:[TTATwitterSignatureBuilder class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(consumerSecret) with:[self consumerSecret]];
                              [definition injectProperty:@selector(accessTokenSecret) with:[self accessTokenSecret]];
                              [definition injectProperty:@selector(hasher) with:[self hasher]];
                              [definition injectProperty:@selector(signatureBaseStringBuilder) with:[self signatureBaseStringBuilder]];
                          }];
}

- (id)hasher {
    return [TyphoonDefinition withClass:[TTAHMACSHA1HashingAlgorithm class]];
}

- (id)signatureBaseStringBuilder {
    return [TyphoonDefinition withClass:[TTATwitterSignatureBaseStringBuilder class]];
}

- (id)consumerSecret {
    return TyphoonConfig(TTAConsumerSecretKey);
}

- (id)consumerKey {
    return TyphoonConfig(TTAConsumerKeyKey);
}

- (id)accessToken {
    return TyphoonConfig(TTAAccessTokenKey);
}

- (id)accessTokenSecret {
    return TyphoonConfig(TTAAccessTokenSecretKey);
}

- (id)databaseName {
    return TyphoonConfig(TTADatabaseNameKey);
}

@end
