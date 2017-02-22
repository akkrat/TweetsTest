//
//  TTATweetListAssembly.h
//  TweetsTest
//
//  Created by a.protko on 17.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Typhoon/Typhoon.h>

@class TTATweetListViewController;
@class TTACoreAssembly;
@class TTAServicesAssembly;

@interface TTATweetListAssembly : TyphoonAssembly

- (TTATweetListViewController *)tweetListViewController;

@property (nonatomic, strong) TTACoreAssembly *coreAssembly;
@property (nonatomic, strong) TTAServicesAssembly *servicesAssembly;

@end
