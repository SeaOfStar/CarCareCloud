//
//  BMOCCombinationSteelBar.h
//  bmoc
//
//  Created by 吴向东 on 14-9-11.
//  Copyright (c) 2014年 baosight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMOCCombinationSteelBar : UIView

@property (nonatomic) NSString *topTitle;
@property (nonatomic) NSString *frontBarValue;
@property (nonatomic) NSString *behindBarValue;
@property (nonatomic) NSString *frontBarName;
@property (nonatomic) NSString *behindBarName;
@property (nonatomic) NSString *name;

@property (nonatomic) float frontbarValueRate;      // 范围：0~1
@property (nonatomic) float behindBarValueRate;     // 范围：0~1

// 刷新数据
- (void)reloadData;

//// 动画调节数据的长度，目前似乎没有必要
//- (void)changeFrontValueTo:(float)frontValue
//          andBehindValueTo:(float)behindValue
//                 animation:(BOOL)animation;

@end
