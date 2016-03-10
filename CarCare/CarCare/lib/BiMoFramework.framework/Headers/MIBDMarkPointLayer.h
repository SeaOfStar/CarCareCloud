//
//  MIBDMarkPointLayer.h
//  MyLayer
//
//  Created by 吴向东 on 14/12/28.
//  Copyright (c) 2014年 DHC. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface MIBDMarkPointLayer : CALayer

@property (nonatomic) BOOL hideCross;
@property (nonatomic) BOOL hidePoint;
@property (nonatomic) BOOL hideTitle;

- (void)markPoint:(CGPoint)point
     withTopTitle:(NSString *)upperTitle
      bottomTitle:(NSString *)bottomTitle;

@end
