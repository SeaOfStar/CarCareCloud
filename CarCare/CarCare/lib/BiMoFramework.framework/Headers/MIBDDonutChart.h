//
//  MIBDDonutChart.h
//  MIBDDoubleLayerDonutView
//
//  Created by 吴向东 on 14/10/31.
//  Copyright (c) 2014年 DHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MIBDDonutChart;
@protocol MIBDDonutDataSource <NSObject>

- (NSInteger)sectionCountForDonutChart:(MIBDDonutChart *)chart;
- (NSInteger)cellCountForDonutChart:(MIBDDonutChart *)chart atSection:(NSInteger)section;

- (NSString *)textForChart:(MIBDDonutChart *)chart atSection:(NSInteger)section;
- (NSString *)textForChart:(MIBDDonutChart *)chart atSection:(NSInteger)section andCell:(NSInteger)cell;

- (CGFloat)valueForChart:(MIBDDonutChart *)chart atSection:(NSInteger)section andCell:(NSInteger)cell;

@end

@interface MIBDDonutChart : UIView

@property (nonatomic) CGFloat widthForLabelGroup;
@property (nonatomic) UIEdgeInsets edgeForLabelGroup;

@property (nonatomic, weak) id<MIBDDonutDataSource> dataSource;
@property (nonatomic) NSString *titleName;

- (void)reloadData;

@end
