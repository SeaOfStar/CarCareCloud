//
//  MyFinishRateBar.h
//  MyFinishRateBar
//
//  Created by 吴向东 on 14/11/24.
//  Copyright (c) 2014年 DHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MIBDFinishRateBar : UIView

@property (nonatomic) CGFloat rate;

// 期待值部分
@property (nonatomic) NSString *expectString;

// 超额部分
@property (nonatomic) CGFloat excessWidth;
@property (nonatomic) NSString *excessString;

@property (nonatomic) CGFloat fontSize;

// reload
- (void)reloadData;



@property (nonatomic, readonly) CALayer *greenLayer;
@property (nonatomic, readonly) CALayer *yellowLayer;
@property (nonatomic, readonly) CALayer *blueLayer;
@property (nonatomic, readonly) CAShapeLayer *blueMask;

@property (nonatomic, readonly) CATextLayer *expectTextLayer;
@property (nonatomic, readonly) CATextLayer *realVTextLayer;
@property (nonatomic, readonly) CATextLayer *excessTextLayer;

- (void)configLayers;

@end
