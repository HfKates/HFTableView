//
//  HFHeadverFooterView.m
//  HFTableView-master
//
//  Created by TB-Mac-106 on 2021/7/16.
//  Copyright © 2021 TB-Mac-106. All rights reserved.
//

#import "HFHeadverFooterView.h"
#import "UITableViewHeaderFooterView+HF.h"

@interface HFHeadverFooterView ()

@property (nonatomic, strong) UILabel *title;

@end

@implementation HFHeadverFooterView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    self.title = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, [UIScreen mainScreen].bounds.size.width-2*15, 20)];
    [self addSubview:self.title];
}

- (void)setHFdata:(NSString *)data {
    self.title.text = data;
}

@end
