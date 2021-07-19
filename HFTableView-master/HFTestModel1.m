//
//  HFTestModel1.m
//  HFTableView-master
//
//  Created by TB-Mac-106 on 2021/7/16.
//  Copyright © 2021 TB-Mac-106. All rights reserved.
//

#import "HFTestModel1.h"
#import "HFTest1TableViewCell.h"

@implementation HFTestModel1

@synthesize cellHeight;
@synthesize modelClass;

- (instancetype)init {
    self = [super init];
    if (self) {
        modelClass = [HFTest1TableViewCell class];
        cellHeight = 90;
    }
    
    return self;
}

@end


