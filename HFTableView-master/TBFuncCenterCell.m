//
//  TBFuncCenterCell.m
//  SyncKit
//
//  Created by TB-Mac-106 on 2019/6/12.
//  Copyright © 2019年 TB-Mac-106. All rights reserved.
//

#import "TBFuncCenterCell.h"
#import "TBMobileShareManager.h"
#import "UIImageView+HF.h"

@interface TBFuncCenterCell()

@property (nonatomic, weak) UILabel *titleName;

@property (nonatomic, weak) UILabel *descLabel;

@property (nonatomic, weak) UIButton *getBtn;

@property (nonatomic, strong) UIImageView *vipView;

@property (nonatomic, strong) UIButton *guideBtn;

@property (nonatomic, strong) UIImageView *betaView;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UIImageView *icon;

@end

@implementation TBFuncCenterCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    
    return self;
}

- (void)setupUI {
    self.backgroundColor = ColorRgb(0xf6f6f6);
    
    CGFloat width = 36;
    CGFloat height = 36;
    self.icon.frame = CGRectMake(kMarginDis, (kCellRow-height)*0.5, width, height);
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.icon.frame)+10, 10, 135, 17)];
    titleLabel.font = [UIFont boldSystemFontOfSize:14];
    titleLabel.textColor = ColorRgb(0x333333);
    [self.contentView addSubview:titleLabel];
    self.titleName = titleLabel;
    
    self.vipView.frame = CGRectMake(CGRectGetMaxX(titleLabel.frame), 12, 22, 12);
    self.betaView.frame = CGRectMake(CGRectGetMaxX(titleLabel.frame), 12, 29, 12);
    self.guideBtn.frame = CGRectMake(CGRectGetMaxX(self.vipView.frame)+10, 10, 40, 15);
    
    UIButton *getBtn = [[UIButton alloc] initWithFrame:CGRectMake(kDefaultWidth-49-kMarginDis, (kCellRow-24)*0.5, 49, 24)];
    [getBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    getBtn.backgroundColor = ColorRgb(0x26a7ff);
    getBtn.layer.cornerRadius = 4;
    getBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:getBtn];
    [getBtn addTarget:self action:@selector(getBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.getBtn = getBtn;
    
    width = self.getBtn.frame.origin.x - CGRectGetMaxX(self.icon.frame) - 10;
    UILabel *descLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.icon.frame)+10, CGRectGetMaxY(titleLabel.frame)+5, width, 15)];
    descLabel.font = [UIFont systemFontOfSize:12];
    descLabel.textColor = ColorRgb(0x999999);
//    descLabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:descLabel];
    self.descLabel = descLabel;
//    self.lineView.frame = CGRectMake(kMarginDis, kCellRow-1, self.contentView.tb_width-2*kMarginDis, 1);
}

- (void)updateUI {
    self.vipView.frame = CGRectMake(CGRectGetMaxX(self.titleName.frame)+5, 12, 22, 12);
    self.betaView.frame = CGRectMake(CGRectGetMaxX(self.titleName.frame)+5, 12, 0, 0);
    if (_model.funcType == EnumFuncAutoClick || _model.funcType == EnumFuncAccetor || _model.funcType == EnumFuncAutoTouch) {
        self.guideBtn.frame = CGRectMake(CGRectGetMaxX(self.betaView.frame), 10, 40, 15);
    }
    else {
        self.guideBtn.frame = CGRectMake(CGRectGetMaxX(self.vipView.frame), 10, 40, 15);
    }
}

- (void)setModel:(TBFuncModel *)model {
    _model = model;
    self.titleName.text = model.title;
    [self.titleName sizeToFit];
    self.descLabel.text = model.desc;
    [self.icon hf_imageWithUrl:model.icon placehold:@"icon_default"];
    [self.getBtn setTitle:model.btnTittle forState:UIControlStateNormal];
    // 配置vip和beta两个view
    if (model.funcType == EnumFuncAutoClick
        || model.funcType == EnumFuncAccetor
        || model.funcType == EnumFuncAutoTouch) {
        self.vipView.hidden = YES;
        self.betaView.hidden = NO;
        
    }else {
        self.vipView.hidden = NO;
        self.betaView.hidden = YES;
    }
    
    // get按钮的配置
    if (model.funcType == EnumFuncAccetor) {
//        [self.vipView tb_setX:CGRectGetMaxX(self.titleName.frame)-50];
        [self.getBtn setTitle:@"Get" forState:UIControlStateNormal];
    }
    else if(model.funcType == EnumFuncModifier){
//        [self.vipView tb_setX:CGRectGetMaxX(self.titleName.frame)-50];
        if ([TBGlobalValue sharedValue].isModifierShow) {
            [self.getBtn setTitle:@"Show" forState:UIControlStateNormal];
        }else {
            [self.getBtn setTitle:@"Hide" forState:UIControlStateNormal];
        }
    }
    else if(model.funcType == EnumFuncCloudStore) {
        [self.getBtn setTitle:@"Load" forState:UIControlStateNormal];
    }
    else if (model.funcType == EnumFuncAutoClick) {
        [self.getBtn setTitle:@"Get" forState:UIControlStateNormal];
        //        self.vipView.hidden = YES;
    }
    
    // 配置guide
    NSString *CheetEngGuide = NETWORKPARAM.funcArr[kCheetEngine][kGuide];
    NSString *AccetorGuide = NETWORKPARAM.funcArr[kAccetor][kGuide];
    NSString *AutoClickGuide = NETWORKPARAM.funcArr[kAutoClickFlag][kGuide];
    NSString *CloudStoreGuide = NETWORKPARAM.funcArr[kCloudStoreFlag][kGuide];
    NSString *AutoTouchGuide = NETWORKPARAM.funcArr[kAutoTouchFlag][kGuide];
    if (model.funcType == EnumFuncModifier) {
        if (CheetEngGuide && ![CheetEngGuide isKindOfClass:[NSNull class]]) {
            self.guideBtn.hidden = CheetEngGuide.length == 0;
        }
        else {
            self.guideBtn.hidden = YES;
        }
    }
    else if (model.funcType == EnumFuncAccetor) {
        if (AccetorGuide && ![AccetorGuide isKindOfClass:[NSNull class]]) {
            self.guideBtn.hidden = AccetorGuide.length == 0;
        }
        else {
            self.guideBtn.hidden = YES;
        }
    }
    else if (model.funcType == EnumFuncAutoClick) {
        if (AutoClickGuide && ![AutoClickGuide isKindOfClass:[NSNull class]]) {
            self.guideBtn.hidden = AutoClickGuide.length == 0;
        }
        else {
            self.guideBtn.hidden = YES;
        }
    }
    else if (model.funcType == EnumFuncCloudStore) {
        if (CloudStoreGuide && ![CloudStoreGuide isKindOfClass:[NSNull class]]) {
            self.guideBtn.hidden = CloudStoreGuide.length == 0;
        }
        else {
            self.guideBtn.hidden = YES;
        }
    }
    else if (model.funcType == EnumFuncAutoTouch) {
        if (AutoTouchGuide && ![AutoTouchGuide isKindOfClass:[NSNull class]]) {
            self.guideBtn.hidden = AutoTouchGuide.length == 0;
        }
        else {
            self.guideBtn.hidden = YES;
        }
    }
    else {
        self.guideBtn.hidden = YES;
    }
    
    [self updateUI];
}



- (void)getBtnClick {
    static dispatch_once_t onceToken;
    if ([self.delegate respondsToSelector:@selector(funcCenterCell:funcType:)]) {
        [self.delegate funcCenterCell:self funcType:self.model.funcType];
    }
}

- (void)guideClick {
    if (self.model.funcType == EnumFuncAccetor) {
        NSString *accetorGuide = NETWORKPARAM.funcArr[kAccetor][kGuide];
        if (ABCheckString(accetorGuide)) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:accetorGuide]];
        }
    }
    else if (self.model.funcType == EnumFuncModifier) {
        NSString *CheetEngGuide = NETWORKPARAM.funcArr[kCheetEngine][kGuide];
        if (ABCheckString(CheetEngGuide)) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:CheetEngGuide]];
        }
    }
    else if (self.model.funcType == EnumFuncAutoClick) {
        NSString *AutoClickGuide = NETWORKPARAM.funcArr[kAutoClickFlag][kGuide];
        if (ABCheckString(AutoClickGuide)) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:AutoClickGuide]];
        }
    }
    else if (self.model.funcType == EnumFuncCloudStore) {
        NSString *CloudStoreGuide = NETWORKPARAM.funcArr[kCloudStoreFlag][kGuide];
        if (ABCheckString(CloudStoreGuide)) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:CloudStoreGuide]];
        }
    }
    else if (self.model.funcType == EnumFuncAutoTouch) {
        NSString *AutoTouchGuide = NETWORKPARAM.funcArr[kAutoTouchFlag][kGuide];
        if (ABCheckString(AutoTouchGuide)) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:AutoTouchGuide]];
        }
    }
}

- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc] init];
        _icon.layer.cornerRadius = 8.0;
        _icon.layer.masksToBounds = YES;
        [self.contentView addSubview:_icon];
    }
    return _icon;
}

- (UIImageView *)vipView {
    if (_vipView == nil) {
        _vipView = [[UIImageView alloc] init];
        _vipView.image = [UIImage imageWithContentsOfFile:ImagePath(@"pic_list_vipsign")];
        [self.contentView addSubview:_vipView];
    }
    return _vipView;
}

- (UIButton *)guideBtn {
    if (!_guideBtn) {
        _guideBtn = [[UIButton alloc] init];
        [_guideBtn setTitle:@"Guide" forState:UIControlStateNormal];
        [_guideBtn setTitleColor:ColorRgb(0x007AFF) forState:UIControlStateNormal];
        _guideBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        [_guideBtn addTarget:self action:@selector(guideClick) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_guideBtn];
    }
    return _guideBtn;
}

- (UIImageView *)betaView {
    if (!_betaView) {
        _betaView = [[UIImageView alloc] init];
        _betaView.image = [UIImage imageWithContentsOfFile:ImagePath(@"pic_list_betasign")];
        [self.contentView addSubview:_betaView];
    }
    return _betaView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = ColorRgb(0xececec);
        _lineView.alpha = 0.5;
        [self.contentView addSubview:_lineView];
    }
    return _lineView;
}

@end
