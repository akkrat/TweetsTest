//
//  TTATweetsListDataDisplayManager.h
//  TweetsTest
//
//  Created by a.protko on 19.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class TTATweet;

@interface TTATweetsListDataDisplayManager : NSObject

- (void)didAddNewTweets:(NSArray<TTATweet *> *)tweets withImageVisibility:(BOOL)isVisible;
- (void)setupTableView:(UITableView *)tableView;
- (void)changeImageVisibilityTo:(BOOL)isVisible;

@end
