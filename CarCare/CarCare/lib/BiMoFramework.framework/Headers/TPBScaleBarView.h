//
//  TPBScaleBarView.h
//  ThreePartBar
//
//  Created by 吴向东 on 14-8-23.
//  Copyright (c) 2014年 MIBD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TPBScaleBarView : UIView

@property (nonatomic) CGFloat valueOfRate;

// 视觉上钢柱的顶点位置，使用TPBScaleBarView的父view的坐标
@property (nonatomic, readonly) CGFloat topY;

// 柱状体到frame边缘的距离（必定左右相等）
@property (nonatomic, readonly) CGFloat clearEdgeWidth;

@property (nonatomic, readonly) NSArray *imageNameList;

@end
