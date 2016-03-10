//
//  BMOCDepotAndSettlementTileView.h
//  bmoc
//
//  Created by gu feng on 14-9-10.
//  Copyright (c) 2014年 baosight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMOCDepotAndSettlementTileView : UIView

@property (nonatomic) NSString * dailyTotalString;
@property (nonatomic) NSString * monthlyTotalString;

- (void)reloadData;

+ (void)addDefaultWhiteShadowToLayer:(CALayer *)layer;
+ (void)addDefaultWhiteShadowToView:(UIView *)view;

@end
