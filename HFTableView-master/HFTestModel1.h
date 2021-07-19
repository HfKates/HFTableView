//
//  HFTestModel1.h
//  HFTableView-master
//
//  Created by TB-Mac-106 on 2021/7/16.
//  Copyright © 2021 TB-Mac-106. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HFViewModelProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface HFTestModel1 : NSObject<HFViewModelProtocol>

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *subTitle;

@property (nonatomic, copy) NSString *icon;

@end

NS_ASSUME_NONNULL_END
