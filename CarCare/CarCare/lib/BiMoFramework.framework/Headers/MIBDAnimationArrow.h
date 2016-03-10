//
//  MIBDAnimationArrow.h
//  MyAnimationArrow
//
//  Created by 吴向东 on 14/11/25.
//  Copyright (c) 2014年 DHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MIBDAnimationArrow : UIView

// 指向的目标点，基于MIBDAnimationArrow本身的左上角坐标
@property (nonatomic) CGPoint targetPoint;

// 该值越大，曲线弯曲程度越高，如果为0则为直线。
// 当箭头指向X轴方向时，正值代表曲线中间部分向Y轴正向弯曲
// 负值代表曲线中间向Y轴负向弯曲
@property (nonatomic) CGFloat bendRate;

- (void)reloadData;
- (void)startAnimation;


@end
