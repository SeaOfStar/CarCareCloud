//
//  BMOCLabeledSteelBar.h
//  ThreePartBar
//
//  Created by 吴向东 on 14-8-29.
//  Copyright (c) 2014年 MIBD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMOCLabeledSteelBar : UIView

// 上下部标签的高度（标签宽度必然和控件宽度一致，但是标签内容可以超出控件范围）
@property (nonatomic) CGFloat topLabelHeight;
@property (nonatomic) CGFloat bottomLabelHeight;

// 视图中钢柱上部顶点的y坐标。
@property (nonatomic, readonly) CGFloat topY;

// 上下部标签的文字内容
@property (nonatomic) NSAttributedString *topLabelString;
@property (nonatomic) NSAttributedString *bottomLabelString;


// 范围为 0.0 ~ 1.0
// 超出范围会导致控件描绘控件外的内容
@property (nonatomic, readonly) CGFloat valueRate;
- (void)setValueRate:(CGFloat)valueRate animation:(BOOL)animation;

// 文本对齐方式
//@property (nonatomic) NSTextAlignment topLabelAligment;

// 刷新数据
- (void)reloadData;

@property (nonatomic, readonly)CGFloat clearEdgeWidth;

@end
