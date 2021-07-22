//
//  HFViewModel.h
//  HFTableView
//
//  Created by TB-Mac-106 on 2021/7/16.
//  Copyright © 2021 TB-Mac-106. All rights reserved.
//

#ifndef HFViewModel_h
#define HFViewModel_h

@protocol HFViewModelProtocol <NSObject>

@property (nonatomic, strong) Class modelClass;

@property (nonatomic, assign) double cellHeight; //缓存cell高度

@end


#endif /* HFViewModel_h */
