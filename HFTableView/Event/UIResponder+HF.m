//
//  UIResponder+HF.m
//  HFTableView-master
//
//  Created by TB-Mac-106 on 2021/7/16.
//  Copyright © 2021 TB-Mac-106. All rights reserved.
//

#import "UIResponder+HF.h"


@implementation UIResponder (HF)

- (void)respondEvent:(HFTableViewEvent *)event {
    [self.nextResponder respondEvent:event];
}

@end
