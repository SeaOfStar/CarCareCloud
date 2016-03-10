//
//  MIBDStockTimeLineView.h
//  MyTimeLineChart
//
//  Created by 吴向东 on 14/11/4.
//  Copyright (c) 2014年 DHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MIBDStockItemDataSource <NSObject>

@property (nonatomic, readonly) NSInteger yearForStockItem;
@property (nonatomic, readonly) NSInteger monthForStockItem;
@property (nonatomic, readonly) NSInteger dayForStockItem;
@property (nonatomic, readonly) double dayRateInYearForStockItem;
@property (nonatomic, readonly) double valueForStockItem;
@property (nonatomic, readonly) NSString *valueStringForStockItem;

@end


@interface MIBDStockTimeLineView : UIView

// 当前值、往年值、预期值三条数据
@property (nonatomic) NSArray *currentYear;
@property (nonatomic) NSArray *lastYear;
@property (nonatomic) NSArray *expect;

// 固定的数值（决定三条辅助线的位置）
@property (nonatomic) CGFloat upper;
@property (nonatomic) CGFloat floor;
@property (nonatomic) CGFloat median;


// 值域的范围
@property (nonatomic) CGFloat maxDataValue;
@property (nonatomic) CGFloat minDataValue;

// Y轴显示内容
@property (nonatomic) NSArray *stringsOnY;

// 是否为弹出的小画面
@property (nonatomic) BOOL isPopView;

@property (nonatomic) UIEdgeInsets edge;

- (void)reloadData;


// 取得某一天在一年中的位置（一年看为366天）
+ (CGFloat)rateForMonth:(NSInteger)month andDay:(NSInteger)day;

@end
