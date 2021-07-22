//
//  HFSectionModel.h
//  HFTableView-master
//
//  Created by TB-Mac-106 on 2021/7/16.
//  Copyright © 2021 TB-Mac-106. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HFSectionModel : NSObject

@property (nonatomic, strong) NSMutableArray *itemArr;

@property (nonatomic, assign) CGFloat headerHeight;

@property (nonatomic, assign) CGFloat footerHeight;

@property (nonatomic, strong) Class headerViewCls;

@property (nonatomic, strong) Class footerViewCls;

@property (nonatomic, strong) id headerData;

@property (nonatomic, strong) id footerData;

@end

NS_ASSUME_NONNULL_END
