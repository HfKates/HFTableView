//
//  HFTableView.h
//  HFTableView
//
//  Created by TB-Mac-106 on 2021/7/16.
//  Copyright © 2021 TB-Mac-106. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol HFTableViewDelegate <NSObject>

- (NSArray *)multipleSectionTalbeView;

- (NSArray *)signalSectionTableView;

- (void)tableViewDidSelectAction:(id)model;

@end

@interface HFTableView : UITableView

@property (nonatomic, weak) id<HFTableViewDelegate> hfDelegate;


- (instancetype)initWithDelegate:(id<HFTableViewDelegate>)delegate;

- (instancetype)initWithDelegate:(id<HFTableViewDelegate>)delegate tableViewStyle:(UITableViewStyle)style;

@end



NS_ASSUME_NONNULL_END
