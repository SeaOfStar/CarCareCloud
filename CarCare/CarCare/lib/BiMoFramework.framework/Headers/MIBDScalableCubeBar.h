//
//  MIBDScalableCubeBar.h
//  MyCubeBar
//
//  Created by 吴向东 on 14/10/20.
//  Copyright (c) 2014年 DHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MIBDScalableCubeBar : UIView


@property (nonatomic) CGSize edgeSize;

// 数据相关
@property (nonatomic) UIColor *dataColor;
@property (nonatomic) CGFloat startRate;
@property (nonatomic) CGFloat endRate;

// 文字相关
@property (nonatomic) NSString *text;
@property (nonatomic) NSString *compareText;
@property (nonatomic) UIColor *textColor;
@property (nonatomic) UIColor *compareColor;
@property (nonatomic) CGFloat fontSize;

- (void)reloadDataAnimation;

@end
