//
//  BMOCPerformanceControl.h
//  bmoc
//
//  Created by 吴向东 on 14-9-19.
//  Copyright (c) 2014年 baosight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMOCPerformanceControl : UIView

@property (nonatomic) CGFloat overstepLength;

// 这个数据是基于1.0f的数值
// 实际值
@property (nonatomic) CGFloat realityValueRate;
// 预期值
@property (nonatomic) CGFloat expectValueRate;
//// 季度达标
//@property (nonatomic) CGFloat standardValueRate;

// 实际值
@property (nonatomic) NSString *realitySring;

// 超预期值
@property (nonatomic) NSString *overstepString;

//// 是否显示达标标识
//@property (nonatomic) BOOL showStandFlag;

- (void)startAnimation;

@end
