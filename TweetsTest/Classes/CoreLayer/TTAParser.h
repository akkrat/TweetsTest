//
//  TTAParser.h
//  TweetsTest
//
//  Created by a.protko on 17.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"

@protocol TTAParser <NSObject>

- (void)parseData:(NSData *)data withBlock:(TTAResultBlock)block;

@end
