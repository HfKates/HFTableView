//
//  HFTest1TableViewCell.m
//  HFTableView-master
//
//  Created by TB-Mac-106 on 2021/7/16.
//  Copyright © 2021 TB-Mac-106. All rights reserved.
//

#import "HFTest1TableViewCell.h"
#import "UITableViewCell+HFCell.h"
#import "HFTestModel1.h"
#import "HFTableViewEvent.h"
#import "UIResponder+HF.h"
@interface HFTest1TableViewCell ()

@property (nonatomic, strong) UILabel *titleLab;

@property (nonatomic, strong) UILabel *subTitleLab;

@property (nonatomic, strong) UIButton *icon;

@property (nonatomic, strong) UIButton *optBtn;

@property (nonatomic, strong) id model;

@end

@implementation HFTest1TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.icon = [[UIButton alloc] initWithFrame:CGRectMake(15, 5, 80, 80)];
    [self.icon addTarget:self action:@selector(iconClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.icon];
    self.titleLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.icon.frame)+5, 5, 100, 20)];
    [self.contentView addSubview:self.titleLab];
    self.subTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.icon.frame)+5, CGRectGetMaxY(self.titleLab.frame)+5, 200, 20)];
    [self.contentView addSubview:self.subTitleLab];
    
//    self.optBtn = [UIButton alloc] initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
}

- (void)iconClick:(UIButton *)btn {
    HFTableViewEvent *event = [[HFTableViewEvent alloc] init];
    [event.userInfo setValue:self.model forKey:@"data"];
    event.sender = self;
    [self.nextResponder respondEvent:event];
    
}

- (void)setHFData:(HFTestModel1 *)model {
    self.model = model;
    self.titleLab.text = model.title;
    self.subTitleLab.text = model.subTitle;
    [self.icon setImage:[UIImage imageNamed:model.icon] forState:UIControlStateNormal];
    
}

@end
