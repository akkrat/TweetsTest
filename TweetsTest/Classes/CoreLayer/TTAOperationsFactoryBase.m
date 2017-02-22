//
//  TTAOperationsFactoryBase.m
//  TweetsTest
//
//  Created by a.protko on 18.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTAOperationsFactoryBase.h"
#import "TTANetworkOperation.h"
#import "TTACoreAssembly.h"
#import "TTAJSONParser.h"
#import "TTATimelineResponceValidator.h"
#import "TTATweetMapper.h"
#import "TTATweetsMapper.h"

static NSString *const TTAAPIURL = @"APIURL";
static NSString *const TTATimelineEndpoint = @"TimelineEndpoint";
static NSString *const TTATimelineMethod = @"TimelineMethod";

@interface TTAOperationsFactoryBase ()

@property (nonatomic, strong) TTACoreAssembly *core;

@end

@implementation TTAOperationsFactoryBase

- (NSOperation *)downloadTweetsOperationWithParameters:(NSDictionary *)parameters completion:(TTAResultBlock)block {
    return [TyphoonDefinition withClass:[TTANetworkOperation class] configuration:^(TyphoonDefinition *definition) {
        definition.parent = [self networkOperation];
        [definition injectProperty:@selector(method) with:[self timelineMethod]];
        [definition injectProperty:@selector(baseURL) with:[self baseURL]];
        [definition injectProperty:@selector(endpoint) with:[self timelineEndpoint]];

        [definition injectProperty:@selector(mapper) with:[self tweetsMapper]];

        [definition injectProperty:@selector(parameters) with:parameters];
        [definition injectProperty:@selector(operationCompletionBlock) with:block];
    }];
}

- (TTANetworkOperation *)networkOperation {
    return [TyphoonDefinition withClass:[TTANetworkOperation class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(requestFactory) with:[self.core requestFactory]];
                              [definition injectProperty:@selector(client) with:[self.core networkClient]];
                              [definition injectProperty:@selector(parser) with:[self jsonParser]];
                              [definition injectProperty:@selector(validator) with:[self tweetsValidator]];

                              definition.abstract = YES;
                          }];
}

- (id<TTAParser>)jsonParser {
    return [TyphoonDefinition withClass:[TTAJSONParser class]];
}

- (id<TTAMapper>)tweetsMapper {
    return [TyphoonDefinition withClass:[TTATweetsMapper class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(tweetMapper) with:[self tweetMapper]];
    }];
}

- (id<TTAMapper>)tweetMapper {
    return [TyphoonDefinition withClass:[TTATweetMapper class]];
}

- (id<TTAValidator>)tweetsValidator {
    return [TyphoonDefinition withClass:[TTATimelineResponceValidator class]];
}

- (NSURL *)baseURL {
    return TyphoonConfig(TTAAPIURL);
}

- (NSString *)timelineEndpoint {
    return TyphoonConfig(TTATimelineEndpoint);
}

- (NSString *)timelineMethod {
    return TyphoonConfig(TTATimelineMethod);
}

@end
