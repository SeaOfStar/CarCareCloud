//
//  BMOCDeliveryGatherTileView.h
//  bmoc
//
//  Created by gu feng on 14-9-16.
//  Copyright (c) 2014年 baosight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMOCDeliveryGatherTileView : UIView

@property (nonatomic) NSString * dailyTotalString;
@property (nonatomic) NSString * monthlyTotalString;
@property (nonatomic) NSString * typeString;
@property (nonatomic) UIColor * color;

- (void)reloadData;

@end
