//
//  TTANetworkClientBase.h
//  TweetsTest
//
//  Created by a.protko on 11.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TTANetworkClient.h"

@interface TTANetworkClientBase : NSObject<TTANetworkClient>

@property (nonatomic, strong) NSURLSession *session;

@end
