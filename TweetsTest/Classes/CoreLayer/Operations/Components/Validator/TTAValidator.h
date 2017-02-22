//
//  TTAValidator.h
//  TweetsTest
//
//  Created by a.protko on 18.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TTAValidator <NSObject>

- (BOOL)validateResponse:(id)response error:(NSError **)error;

@end
