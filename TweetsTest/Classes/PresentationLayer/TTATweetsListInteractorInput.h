//
//  TTATweetsListInteractorInput.h
//  TweetsTest
//
//  Created by a.protko on 21.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TTATweetsListInteractorInput <NSObject>

- (void)loadCachedTweets;
- (void)loadRecentTweets;
- (void)loadNextPage;
- (BOOL)shouldDisplayImages;

@end
