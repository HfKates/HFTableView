//
//  HFEvent.h
//  HFTableView-master
//
//  Created by TB-Mac-106 on 2021/7/16.
//  Copyright © 2021 TB-Mac-106. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class UIResponder;

//@protocol HFTableViewEvent <NSObject>
//
//
//
//@end

@interface HFTableViewEvent : NSObject

@property (nonatomic, strong) __kindof UIResponder *sender;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, strong) NSMutableDictionary *userInfo;

@end

NS_ASSUME_NONNULL_END
