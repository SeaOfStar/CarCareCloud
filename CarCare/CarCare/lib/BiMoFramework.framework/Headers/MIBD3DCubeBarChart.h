//
//  MIBD3DCubeBarChart.h
//  MyBarChart
//
//  Created by 吴向东 on 14/10/27.
//  Copyright (c) 2014年 DHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MIBD3DCubeBarChart;

//////////////////////////
// 数据源接口定义
//////////////////////////
@protocol MIBD3DCubeBarChartDataSource <NSObject>

- (CGFloat)valueForCubeChart:(MIBD3DCubeBarChart *)chart atSeries:(NSInteger)series andStep:(NSInteger)step;
- (NSString *)nameForCubeChart:(MIBD3DCubeBarChart *)chart atStep:(NSInteger)step;
- (NSString *)valueStringForCubeChart:(MIBD3DCubeBarChart *)chart atSeries:(NSInteger)series andStep:(NSInteger)step;

- (NSString *)nameForCubeChart:(MIBD3DCubeBarChart *)chart atSeries:(NSInteger)series;
- (CGFloat)valueForCubeChart:(MIBD3DCubeBarChart *)chart atSeries:(NSInteger)series;


@optional

// 后面的附加值（带括号的橘黄色数值），如果datasource不实现该接口，则认为不显示此值。
- (NSNumber *)valueInBracketForCubeChart:(MIBD3DCubeBarChart *)chart atSeries:(NSInteger)series;

// 用于描述线数据的借口（线数据的数量必须小于等于series数量）
- (CGFloat)valueForCubeChart:(MIBD3DCubeBarChart *)chart atLines:(NSInteger)series andStep:(NSInteger)step;

// 下面的比较值（带括号的橘黄色或浅绿色数值）
- (CGFloat)compareValueForCubeChart:(MIBD3DCubeBarChart *)chart atSeries:(NSInteger)series andStep:(NSInteger)step;
- (NSString *)compareValueStringForCubeChart:(MIBD3DCubeBarChart *)chart atSeries:(NSInteger)series andStep:(NSInteger)step;
//- (NSString *)nameForCubeChart:(MIBD3DCubeBarChart *)chart atLines:(NSInteger)line;
//- (NSString *)valueStringForCubeChart:(MIBD3DCubeBarChart *)chart atLines:(NSInteger)line;

@optional
- (NSInteger)countOfLabelForY:(MIBD3DCubeBarChart *)chart;

@end

//////////////////////////
// 委托接口定义
//////////////////////////
@protocol MIBD3DCubeBarChartDelegate <NSObject>

- (void)cubeChart:(MIBD3DCubeBarChart *)chart clickedAtStep:(NSInteger)step;

@end



@interface MIBD3DCubeBarChart : UIView

@property (nonatomic, weak) id <MIBD3DCubeBarChartDataSource> dataSource;
@property (nonatomic, weak) id <MIBD3DCubeBarChartDelegate> delegate;
@property (nonatomic) NSInteger seriesCount;
@property (nonatomic) NSInteger stepCount;
@property (nonatomic) NSInteger lineCount;          // 设计上线的数量必须小于seriesCount

@property (nonatomic) CGFloat maxYValueForData;     // 数据的坐标范围
@property (nonatomic) CGFloat maxYValueForYAxes;    // y轴显示用的数值

@property (nonatomic) BOOL hiddenLabelGroup;

@property (nonatomic) BOOL useRankGroup;        // 柱状图是平铺还是竖直叠加

@property (nonatomic) BOOL hasCompareLabel;

// 是否为弹出的小画面
@property (nonatomic) BOOL isPopView;

- (void)reloadData;

@end
