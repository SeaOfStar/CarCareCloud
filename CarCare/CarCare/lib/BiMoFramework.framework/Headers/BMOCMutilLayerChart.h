//
//  BMOCMutilLayerChart.h
//  MyLayer
//
//  Created by 吴向东 on 14/12/25.
//  Copyright (c) 2014年 DHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BMOCMutilLayerChart;

// 单条数据的协议
@protocol BMOCMutilLayerChartItemDataSource <NSObject>

// 数据的数据，决定其纵坐标位置
// 具体位置同BMOCMutilLayerChartDataSource中的topYValueForChart、bottomYValueForChart相关
@property (nonatomic, readonly) CGFloat itemValueForChart;

// 作为当前点时，该数据显示的内容
@property (nonatomic, readonly) NSString *itemValueStringForChart;

// 这个数值不影响X坐标，但从逻辑的独立性来看应该提供
@property (nonatomic, readonly) NSInteger yearForChart;
// x坐标基准
@property (nonatomic, readonly) NSInteger monthForChart;
@property (nonatomic, readonly) NSInteger dayForChart;

// 表示该数据在一年（#366天，不是365天，即2月29日即便不存在也要占相应的位置）中所处的位置
// 例如：
// 1月1日     ==> 0.0f
// 1月31日    ==> (31 - 1) / 366.0f;
// 2月28日    ==> (31 + 28 - 1) / 366.0f;
// 2月29日    ==> (31 + 29 - 1) / 366.0f;
// 3月1日     ==> (31 + 29 + 1 - 1) / 366.0f;
// 12月31日   ==> 1.0f
// 理论上该数据通过x坐标基准（monthForChart & dayForChart）可以运算出来
// 但是实际中需要反复的做大量的运算，如果条件允许，尽可能让数据类缓冲这个结果。
// 控件会优先使用该数据判断其横坐标位置，
// 如果没有该数据，再通过monthForChart & dayForChart计算X坐标位置。
// 该值的计算可以调用MIBD366DayAxesLayer的函数：
//+ (CGFloat)rateForMonth:(NSInteger)month andDay:(NSInteger)day;
@property (nonatomic, readonly) CGFloat rateForYear;

@end

// 整体数据协议
@protocol BMOCMutilLayerChartDataSource <NSObject>

// 系列数
- (NSInteger)countOfSeriesForChart:(BMOCMutilLayerChart *)chart;
// 某个系列的数据个数
- (NSInteger)countOfDataAtSeriesForChart:(BMOCMutilLayerChart *)chart atSeries:(NSInteger)series;
- (UIColor *)colorOfDataAtSeriesForChart:(BMOCMutilLayerChart *)chart atSeries:(NSInteger)series;

// 单条数据
- (id<BMOCMutilLayerChartItemDataSource>)itemForChart:(BMOCMutilLayerChart *)chart atSeries:(NSInteger)series andIndex:(NSInteger)index;

// y轴的显示范围
- (CGFloat)topYValueForChart:(BMOCMutilLayerChart *)chart;
- (CGFloat)bottomYValueForChart:(BMOCMutilLayerChart *)chart;

// y轴显示的内容（数组内容为文字，所有数据均匀分布在y轴上）
- (NSArray *)labelsForYOfChart:(BMOCMutilLayerChart *)chart;

@end



@interface BMOCMutilLayerChart : UIView

@property (nonatomic) UIEdgeInsets edge;

@property (nonatomic, weak) id <BMOCMutilLayerChartDataSource> dataSource;

// 默认值为-1，表示不高亮任何数据
@property (nonatomic) NSInteger highlightedSeries;

// 功能函数
- (void)reloadData;


@end
