//
//  TTATweetListViewController.h
//  TweetsTest
//
//  Created by a.protko on 17.02.17.
//  Copyright © 2017 a.protko. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TTATweetsService;
@protocol TTATweetsListInteractorInput;
@class TTATweetsListDataDisplayManager;

@interface TTATweetListViewController : UIViewController

@property (nonatomic, strong) id<TTATweetsListInteractorInput> interactor;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) TTATweetsListDataDisplayManager *dataDisplayManager;
@property (nonatomic, assign) NSUInteger counterMax;

@end
