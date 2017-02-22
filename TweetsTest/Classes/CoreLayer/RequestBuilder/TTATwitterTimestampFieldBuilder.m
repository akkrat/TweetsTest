//
//  TTATwitterTimestampFieldBuilder.m
//  TweetsTest
//
//  Created by a.protko on 12.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTATwitterTimestampFieldBuilder.h"

@implementation TTATwitterTimestampFieldBuilder

- (NSString *)obtainCurrentTimestamp {
    return [NSString stringWithFormat:@"%.0f", [[NSDate date] timeIntervalSince1970]];
}

@end
