//
//  ViewController.m
//  HFTableView
//
//  Created by TB-Mac-106 on 2021/7/16.
//  Copyright © 2021 TB-Mac-106. All rights reserved.
//

#import "ViewController.h"
#import "HFTableView.h"
#import "HFSectionModel.h"
#import "HFTestModel1.h"
#import "HFHeadverFooterView.h"
#import "UIResponder+HF.h"
@interface ViewController ()<HFTableViewDelegate>

@property (nonatomic, strong) HFTableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
}

#pragma mark  -----------------------------------  HFTableViewDelegate  -----------------------------------
- (NSArray *)signalSectionTableView {
    return self.dataSource;
}

- (void)tableViewDidSelectAction:(HFTestModel1 *)model {
    NSLog(@"%@", model.title);
}

- (void)respondEvent:(HFTableViewEvent *)event {
    HFTestModel1 *model = [event.userInfo objectForKey:@"data"];
    NSLog(@"model:%@", model);
}

- (HFTableView *)tableView {
    if (!_tableView) {
        _tableView = [[HFTableView alloc] initWithDelegate:self tableViewStyle:UITableViewStyleGrouped];
        _tableView.frame = self.view.bounds;
    }
    return _tableView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
        HFTestModel1 *model1 = [[HFTestModel1 alloc] init];
        model1.title = @"Coin Master";
        model1.subTitle = @"Unlock Card Level 499";
        model1.icon = @"panda-center";
        
        HFTestModel1 *model2 = [[HFTestModel1 alloc] init];
        model2.title = @"Coin Master";
        model2.subTitle = @"Unlock Card Level 499";
        model2.icon = @"panda-center";
        
        HFTestModel1 *model3 = [[HFTestModel1 alloc] init];
        model3.title = @"Coin Master";
        model3.subTitle = @"Unlock Card Level 499";
        model3.icon = @"panda-center";
        
        HFSectionModel *secModel = [[HFSectionModel alloc] init];
        secModel.headerData = @"App List";
        secModel.headerHeight = 30;
        secModel.headerViewCls = [HFHeadverFooterView class];
        [secModel.itemArr addObject:model1];
        [secModel.itemArr addObject:model2];
        [secModel.itemArr addObject:model3];
        [_dataSource addObject:secModel];
    }
    return _dataSource;
}

@end
