//
//  MIBDYAxesLayer.h
//  MyLayer
//
//  Created by 吴向东 on 14/12/25.
//  Copyright (c) 2014年 DHC. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface MIBD366DayAxesLayer : CALayer



// 某月某日在一年中的位置（0.0 ~ 1.0）
// 1月1日：0.0
// 12月31日：1.0
// 注意有2月29日
+ (CGFloat)rateForMonth:(NSInteger)month andDay:(NSInteger)day;

@property (nonatomic) NSInteger endYear;
@property (nonatomic) NSInteger endMonth;


@end
