//
//  HFTableView.m
//  HFTableView
//
//  Created by TB-Mac-106 on 2021/7/16.
//  Copyright © 2021 TB-Mac-106. All rights reserved.
//

#import "HFTableView.h"
#import "HFSectionModel.h"
#import "HFViewModelProtocol.h"
#import "UITableViewCell+HFCell.h"
#import "UITableViewHeaderFooterView+HF.h"


@interface HFTableView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray<HFSectionModel *> *sectionArr;

@end

@implementation HFTableView

- (instancetype)initWithDelegate:(id<HFTableViewDelegate>)delegate {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.hfDelegate = delegate;
    }
    
    return self;
}

- (instancetype)initWithDelegate:(id<HFTableViewDelegate>)delegate tableViewStyle:(UITableViewStyle)style {
    self = [super initWithFrame:CGRectZero style:style];
    if (self) {
        self.hfDelegate = delegate;
        [self configTableView];
    }
    return self;
}

- (void)configTableView {
    self.delegate = self;
    self.dataSource = self;
    
    /// 这里的 estimatedSectionHeaderHeight 和 estimatedSectionFooterHeight 设置为0 是为了iOS11之后版本的适配
    /// 因为iOS11以后，如果只设置heightForHeaderInSection和heightForFooterInSection是不起作用的
    self.estimatedSectionFooterHeight = 0;
    self.estimatedSectionHeaderHeight = 0;
}

#pragma mark  -----------------------------------  Delegate  -----------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@----", indexPath);
    HFSectionModel *sectionModel = self.sectionArr[indexPath.section];
    id<HFViewModelProtocol> cellModel = sectionModel.itemArr[indexPath.row];
    if ([self.hfDelegate respondsToSelector: @selector(tableViewDidSelectAction:)]) {
        [self.hfDelegate tableViewDidSelectAction:cellModel];
    }
}

#pragma mark  -----------------------------------  DataSource  -----------------------------------
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([self.hfDelegate respondsToSelector:@selector(multipleSectionTalbeView)]) {
        self.sectionArr = [self.hfDelegate multipleSectionTalbeView];
        return self.sectionArr.count;
    }
    else if ([self.hfDelegate respondsToSelector:@selector(signalSectionTableView)]) {
        self.sectionArr = [self.hfDelegate signalSectionTableView];
        return self.sectionArr.count;
    }
    
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    HFSectionModel *sectionModel = self.sectionArr[section];
    return sectionModel.itemArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HFSectionModel *sectionModel = self.sectionArr[indexPath.section];
    id<HFViewModelProtocol> cellModel = sectionModel.itemArr[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(cellModel.modelClass)];
    if (!cell) {
        cell = [[cellModel.modelClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(cellModel.modelClass)];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell setHFData:cellModel];
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // 缓存高度
    HFSectionModel *sectionModel = self.sectionArr[indexPath.section];
    id<HFViewModelProtocol> cellModel = sectionModel.itemArr[indexPath.row];
    cellModel.cellHeight = cell.frame.size.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    HFSectionModel *sectionModel = self.sectionArr[indexPath.section];
    id<HFViewModelProtocol> cellModel = sectionModel.itemArr[indexPath.row];
    return cellModel.cellHeight ? : UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    HFSectionModel *sectionModel = self.sectionArr[section];
    return sectionModel.footerHeight ?: CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    HFSectionModel *sectionModel = self.sectionArr[section];
    if (!sectionModel.footerViewCls) {
        return [UIView new];
    }
    
    UITableViewHeaderFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass(sectionModel.footerViewCls)];
    if (!footerView) {
        footerView = [[sectionModel.footerViewCls alloc] initWithReuseIdentifier:NSStringFromClass(sectionModel.footerViewCls)];
    }
    
    [footerView setHFdata:sectionModel.footerData];
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    HFSectionModel *sectionModel = self.sectionArr[section];
    return sectionModel.headerHeight ?: CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    HFSectionModel *sectionModel = self.sectionArr[section];
    if (!sectionModel.headerViewCls) {
        return [UIView new];
    }
    
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass(sectionModel.headerViewCls)];
    if (!headerView) {
        headerView = [[sectionModel.headerViewCls alloc] initWithReuseIdentifier:NSStringFromClass(sectionModel.headerViewCls)];
    }
    
    [headerView setHFdata:sectionModel.headerData];
    return headerView;
}

@end



