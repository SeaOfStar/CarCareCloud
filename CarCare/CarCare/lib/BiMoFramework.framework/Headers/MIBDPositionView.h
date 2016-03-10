//
//  MIBDPositionView.h
//  MIBDPointerViewSample
//
//  Created by 吴向东 on 14/11/26.
//  Copyright (c) 2014年 DHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MIBDPositionView : UIView

// 标题
@property (nonatomic) NSString *title;

// 标题偏移量
@property (nonatomic) CGPoint titleOffset;

// 是否隐藏标题
@property (nonatomic) BOOL hiddenTitleLabel;

// 是否高亮显示
@property (nonatomic) BOOL highLightTitle;

// label 宽度
@property (nonatomic) CGFloat labelWidth;

// 重新载入数据
- (void)reloadData;

// 显示连接线
- (void)addLineToView:(UIView *)toView animated:(BOOL)animated;
- (void)addLineToViewArray:(NSArray *)toViewList animated:(BOOL)animated;

// 隐藏连接线
- (void)hideAllLine;
- (void)hideLineForView:(UIView *)viewForHiddenLine;

@end
