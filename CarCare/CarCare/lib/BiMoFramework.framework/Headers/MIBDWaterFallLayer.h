//
//  MIBDWaterFallLayer.h
//  MyLayer
//
//  Created by 吴向东 on 14/12/26.
//  Copyright (c) 2014年 DHC. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface MIBDWaterFallLayer : CAShapeLayer

// 下部效果的透明度(默认为0.0f,即完全透明，此时该layer表现同普通shapelayer无异)
@property (nonatomic) CGFloat waterFallAlpha;

@end
