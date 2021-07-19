//
//  TBFuncCenterCell.h
//  SyncKit
//
//  Created by TB-Mac-106 on 2019/6/12.
//  Copyright © 2019年 TB-Mac-106. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TBFuncModel.h"

#define kCellRow        54

@class TBFuncCenterCell;

@protocol TBFuncCenterCellDelegate<NSObject>

- (void)funcCenterCell:(TBFuncCenterCell *)centerCell funcType:(EnumFuncType)funcType;

@end

@interface TBFuncCenterCell : UITableViewCell

@property (nonatomic, strong) TBFuncModel* model;

@property (nonatomic, weak) id<TBFuncCenterCellDelegate> delegate;

@end
