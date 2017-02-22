//
//  TTAHashingAlghorithm.h
//  TweetsTest
//
//  Created by a.protko on 12.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TTAHashingAlghorithm <NSObject>

- (NSString *)hashOfData:(NSString *)data withKey:(NSString *)key;

@end
