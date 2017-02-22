//
//  TTAOperationsFactory.h
//  TweetsTest
//
//  Created by a.protko on 18.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Common.h"

@protocol TTAOperationsFactory <NSObject>

- (NSOperation *)downloadTweetsOperationWithParameters:(NSDictionary *)parameters
                                            completion:(TTAResultBlock)block;

@end
