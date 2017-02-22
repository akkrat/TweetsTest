//
//  TTATwitterRequestBuilder.m
//  TweetsTest
//
//  Created by a.protko on 11.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTATwitterRequestBuilder.h"
#import "TTAHeadersBuilder.h"

@implementation TTATwitterRequestBuilder

- (NSURLRequest *)requestWithMethod:(NSString *)method
                            baseURL:(NSURL *)url
                           endpoint:(NSString *)endpoint
                         parameters:(NSDictionary *)parameters {
    NSURLComponents *urlBuilder = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:NO];
    urlBuilder.path = endpoint;

    NSURL *urlWithoutQuery = urlBuilder.URL;

    NSMutableArray<NSURLQueryItem *> *queryItems = [NSMutableArray arrayWithCapacity:parameters.count];
    [parameters enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, NSString * _Nonnull value, BOOL * _Nonnull stop) {
        NSURLQueryItem *item = [[NSURLQueryItem alloc] initWithName:key value:value];
        [queryItems addObject:item];
    }];

    urlBuilder.queryItems = queryItems;
    NSURL *resultURL = urlBuilder.URL;

    __auto_type headers = [self.headersBuilder buildHeadersWithURL:urlWithoutQuery method:method parameters:parameters];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:resultURL];
    request.allHTTPHeaderFields = headers;
    request.HTTPMethod = method;

    return [request copy];
}


@end
