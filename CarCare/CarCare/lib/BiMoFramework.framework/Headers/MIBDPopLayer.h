//
//  MIBDPopLayer.h
//  MyLayer
//
//  Created by 吴向东 on 14/12/28.
//  Copyright (c) 2014年 DHC. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef enum {
    MIBDPopDirectionTopRight = 0x00,
    MIBDPopDirectionTopLeft = 0x01,
//    MIBDPopDirectionBottomRight = 0x10,       // 暂时没有支持
//    MIBDPopDirectionBottomLeft = 0x11,        // 暂时没有支持
} MIBDPopLayerDirection;

@interface MIBDPopLayer : CALayer

@property (nonatomic) NSString *topTitle;
@property (nonatomic) NSString *bottomTitle;

@property (nonatomic) MIBDPopLayerDirection popDirection;

@end
