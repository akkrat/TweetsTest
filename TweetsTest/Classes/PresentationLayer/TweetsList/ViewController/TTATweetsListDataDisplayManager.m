//
//  TTATweetsListDataDisplayManager.m
//  TweetsTest
//
//  Created by a.protko on 19.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTATweetsListDataDisplayManager.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TTATweetCell.h"
#import "TTATweet.h"
#import "TTATweetCellObject.h"

@protocol TTATweetsListDataDisplayManagerDelegate <NSObject>

- (void)didChangeModel;

@end

@interface TTATweetsListDataDisplayManager ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy) NSArray<TTATweetCellObject *> *cellObjects;
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) id<TTATweetsListDataDisplayManagerDelegate> delegate;

@end

@implementation TTATweetsListDataDisplayManager

- (instancetype)init {
    self = [super init];
    if (self) {
        _cellObjects = @[];
    }
    return self;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *reuseIdentifier = NSStringFromClass([TTATweetCell class]);
    TTATweetCell *cell = (TTATweetCell *)[tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    TTATweetCellObject *cellObject = [self.cellObjects objectAtIndex:indexPath.row];
    [cell configureWithCellObject:cellObject];
    [cell setNeedsLayout];
    [cell layoutIfNeeded]; // iOS 8

    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.cellObjects count];
}

- (void)setupTableView:(UITableView *)tableView {
    self.tableView = tableView;

    tableView.dataSource = self;
    tableView.delegate = self;

    tableView.rowHeight = UITableViewAutomaticDimension;
    tableView.estimatedRowHeight = 64;
}

- (void)didAddNewTweets:(NSArray<TTATweet *> *)tweets withImageVisibility:(BOOL)isVisible {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:self.cellObjects.count + tweets.count];

    NSUInteger tweetIndex = 0, cellObjectIndex = 0;

    while (tweetIndex < tweets.count && cellObjectIndex < self.cellObjects.count) {
        TTATweet *tweet = [tweets objectAtIndex:tweetIndex];
        TTATweetCellObject *cellObject = [self.cellObjects objectAtIndex:cellObjectIndex];

        if (tweet.tweetID > cellObject.model.tweetID) {
            TTATweetCellObject *tweetCellObject = [[TTATweetCellObject alloc] initWithModel:tweet shouldDisplayImage:isVisible];
            [result addObject:tweetCellObject];
            tweetIndex++;
        } else {
            [result addObject:cellObject];
            cellObjectIndex++;
            if (tweet.tweetID == cellObject.model.tweetID) {
                tweetIndex++;
            }
        }
    }
    while (tweetIndex < tweets.count) {
        TTATweet *tweet = [tweets objectAtIndex:tweetIndex];
        TTATweetCellObject *tweetCellObject = [[TTATweetCellObject alloc] initWithModel:tweet shouldDisplayImage:isVisible];
        [result addObject:tweetCellObject];
        tweetIndex++;
    }
    while (cellObjectIndex < self.cellObjects.count) {
        TTATweetCellObject *cellObject = [self.cellObjects objectAtIndex:cellObjectIndex];
        [result addObject:cellObject];
        cellObjectIndex++;
    }

    BOOL changed = (result.count != self.cellObjects.count);

    self.cellObjects = result;

    if (changed) {
        [self.delegate didChangeModel];
    }
}

- (void)changeImageVisibilityTo:(BOOL)isVisible {
    for (TTATweetCellObject *cellObject in self.cellObjects) {
        cellObject.shouldDisplayImage = isVisible;
    }
    [self.delegate didChangeModel];
}

@end
