//
//  HFSectionModel.m
//  HFTableView-master
//
//  Created by TB-Mac-106 on 2021/7/16.
//  Copyright © 2021 TB-Mac-106. All rights reserved.
//

#import "HFSectionModel.h"

@implementation HFSectionModel

- (NSMutableArray *)itemArr {
    if (!_itemArr) {
        _itemArr = [[NSMutableArray alloc] init];
    }
    return _itemArr;
}

@end
