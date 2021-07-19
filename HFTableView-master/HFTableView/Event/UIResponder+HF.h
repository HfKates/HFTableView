//
//  UIResponder+HF.h
//  HFTableView-master
//
//  Created by TB-Mac-106 on 2021/7/16.
//  Copyright © 2021 TB-Mac-106. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "HFTableViewEvent.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIResponder (HF)

- (void)respondEvent:(HFTableViewEvent *)event;

@end

NS_ASSUME_NONNULL_END
