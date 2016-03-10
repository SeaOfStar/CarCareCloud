//
//  MIBDStandLineView.h
//  MIBDStandLineView
//
//  Created by 吴向东 on 14/11/10.
//  Copyright (c) 2014年 DHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MIBD30DayFinishRateView;
//@protocol MIBDStandLineDataSource <NSObject>
//
//// 数据线接口
//- (NSInteger)countOfSeriesForStandView:(MIBDStandLineView *)view;
//- (NSInteger)countOfPointForStandView:(MIBDStandLineView *)view andSeries:(NSInteger)series;
//- (CGPoint)rateForView:(MIBDStandLineView *)view atSeries:(NSInteger)series andPoint:(NSInteger)index;
//- (UIColor *)colorForStandView:(MIBDStandLineView *)view andSeries:(NSInteger)series;
//
//// 坐标轴X接口
//- (NSInteger)countOfXLabelForStandView:(MIBDStandLineView *)view;
//- (NSString *)stringOfXLabelForStandView:(MIBDStandLineView *)view atIndex:(NSInteger)index;
//
//// 坐标轴Y接口
//- (NSInteger)countOfYLabelForStandView:(MIBDStandLineView *)view;
//- (NSString *)stringOfYLabelForStandView:(MIBDStandLineView *)view atIndex:(NSInteger)index;
//
//@end


@protocol MIBDRealTimeBillDataItem <NSObject>

@property (nonatomic, readonly) CGFloat finishRateValue;   // 接单完成率 50%即为0.5

@end


@interface MIBD30DayFinishRateView : UIView

@property (nonatomic) UIEdgeInsets edge;

@property (nonatomic) NSInteger year;
@property (nonatomic) NSInteger month;

@property (nonatomic) NSInteger lineYear;
@property (nonatomic) NSInteger lineMonth;
@property (nonatomic) NSInteger lineDay;

@property (nonatomic) NSArray *currentMonth;
@property (nonatomic) NSArray *lastMonth;

@property (nonatomic) BOOL showExpectLevelLine;
@property (nonatomic) CGFloat expectLevel;

- (void)reloadData;

@end
