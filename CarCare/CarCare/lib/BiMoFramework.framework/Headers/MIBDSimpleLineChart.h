//
//  MIBDSimpleLineChart.h
//  MySimleLineChart
//
//  Created by 吴向东 on 14-10-14.
//  Copyright (c) 2014年 DHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MIBDSimpleLineChart;
@protocol MIBDSimpleLineChartDataSource <NSObject>

- (NSInteger)countForChart:(MIBDSimpleLineChart *)chart;
- (CGFloat)valueForChart:(MIBDSimpleLineChart *)chart atIndex:(NSInteger)index;

@end

@interface MIBDSimpleLineChart : UIView

@property (nonatomic, weak) id<MIBDSimpleLineChartDataSource> dataSource;
- (void)reloadData:(BOOL)animation;

@end
