//
//  MIBDSimple7DayLineChart.h
//  MyMIBDSimpleLineChart
//
//  Created by 吴向东 on 14/11/3.
//  Copyright (c) 2014年 DHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MIBDSimple7DayLineChart : UIView

// 视图的四个边沿位置
// 注：右边沿被用于显示参考线的数值
//    下边沿被用于显示X轴刻度。
@property (nonatomic) UIEdgeInsets edge;

// 是否显示参考线
@property (nonatomic) BOOL showReference;

@property (nonatomic) CGFloat maxReferenceValue;
@property (nonatomic) CGFloat minReferenceValue;
@property (nonatomic) CGFloat middleReferenceValue;

@property (nonatomic) NSString *maxReferenceString;
@property (nonatomic) NSString *minReferenceString;
@property (nonatomic) NSString *middleReferenceString;


// 数据，内部元素为NSNumber
@property (nonatomic) NSArray *dataList;

// 页面的刷新
- (void)reloadData;

@end
