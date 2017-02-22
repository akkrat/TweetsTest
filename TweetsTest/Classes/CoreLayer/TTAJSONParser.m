//
//  TTAJSONParser.m
//  TweetsTest
//
//  Created by a.protko on 17.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTAJSONParser.h"
#import <SBJson5.h>

@implementation TTAJSONParser

- (void)parseData:(NSData *)data withBlock:(TTAResultBlock)block {
    SBJson5Parser *parser = [SBJson5Parser parserWithBlock:^(id item, BOOL *stop) {
        block(item, nil);
    } errorHandler:^(NSError *error) {
        block(nil, error);
    }];
    [parser parse:data];
}

@end
