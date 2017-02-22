//
//  TTATweetsListInteractorOutput.h
//  TweetsTest
//
//  Created by a.protko on 21.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TTATweet;

@protocol TTATweetsListInteractorOutput <NSObject>

- (void)didLoadTweets:(NSArray<TTATweet *> *)tweets withError:(NSError *)error;

@end
