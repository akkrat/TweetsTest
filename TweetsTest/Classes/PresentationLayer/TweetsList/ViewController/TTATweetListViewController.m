//
//  TTATweetListViewController.m
//  TweetsTest
//
//  Created by a.protko on 17.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import "TTATweetListViewController.h"
#import "TTATweetsService.h"
#import "TTATweetCell.h"
#import <INSDefaultInfiniteIndicator.h>
#import <INSPullToRefresh/UIScrollView+INSPullToRefresh.h>
#import "TTATweetsListInteractorOutput.h"
#import "TTATweetsListInteractorInput.h"
#import "TTATweetsListDataDisplayManager.h"
#import <EXTScope.h>

@interface TTATweetListViewController () <TTATweetsListInteractorOutput, INSInfiniteScrollBackgroundViewDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *counterItem;
@property (nonatomic, strong) UIView<INSAnimatable> *infinityView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSUInteger counter;
@property (nonatomic, assign) BOOL shouldDisplayImages;

@end

@implementation TTATweetListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.shouldDisplayImages = [self.interactor shouldDisplayImages];
    [self setupInfinityScroll];
    [self setupTimer];
    [self.dataDisplayManager setupTableView:self.tableView];
    [self.interactor loadCachedTweets];
    [self.interactor loadRecentTweets];
}

- (void)setupTimer {
    self.counter = self.counterMax;
    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(ticktack) userInfo:nil repeats:YES];
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)setupInfinityScroll {
    @weakify(self);
    [self.tableView ins_addInfinityScrollWithHeight:60 handler:^(UIScrollView *scrollView) {
        @strongify(self);
        [self didTriggerInfinityScroll];
    }];

    CGRect defaultFrame = CGRectMake(0, 0, 48, 48);
    INSDefaultInfiniteIndicator *view = [[INSDefaultInfiniteIndicator alloc] initWithFrame:defaultFrame];
    self.infinityView = view;
    self.tableView.ins_infiniteScrollBackgroundView.delegate = self;
    [self.tableView.ins_infiniteScrollBackgroundView addSubview:self.inputView];
}

- (void)didTriggerInfinityScroll {
    [self.interactor loadNextPage];
}

- (void)infinityScrollBackgroundView:(INSInfiniteScrollBackgroundView *)infinityScrollBackgroundView didChangeState:(INSInfiniteScrollBackgroundViewState)state {
    if (state == INSInfiniteScrollBackgroundViewStateLoading) {
        [self.infinityView startAnimating];
    } else {
        [self.infinityView stopAnimating];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    BOOL shouldDisplayImages = [self.interactor shouldDisplayImages];
    if (self.shouldDisplayImages != shouldDisplayImages) {
        self.shouldDisplayImages = shouldDisplayImages;
        [self.dataDisplayManager changeImageVisibilityTo:self.shouldDisplayImages];
    }
}

- (void)didLoadTweets:(NSArray<TTATweet *> *)tweets withError:(NSError *)error {
    [self.tableView ins_endInfinityScroll];
    if (error != nil || tweets.count == 0) {
        return;
    }

    [self.dataDisplayManager didAddNewTweets:tweets withImageVisibility:self.shouldDisplayImages];
}

- (void)didChangeModel {
    [self.tableView reloadData];
}

- (void)ticktack {
    self.navigationItem.leftBarButtonItem.title = [@(self.counter) stringValue];

    if (self.counter == 0) {
        self.counter = self.counterMax;
        [self.interactor loadRecentTweets];
    } else {
        self.counter--;
    }
}

- (void)dealloc {
    [self.timer invalidate];
}

@end
