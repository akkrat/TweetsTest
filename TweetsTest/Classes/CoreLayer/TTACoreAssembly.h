//
//  TTACoreAssembly.h
//  TweetsTest
//
//  Created by a.protko on 16.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Typhoon.h>

@protocol TTARequestBuilder;
@protocol TTANetworkClient;
@protocol TTADataStorage;

@interface TTACoreAssembly : TyphoonAssembly

- (id<TTARequestBuilder>)requestFactory;
- (id<TTANetworkClient>)networkClient;
- (id<TTADataStorage>)dataStorage;

@end
