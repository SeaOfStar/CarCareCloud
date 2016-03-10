//
//  MIBDScalableBarGroup.h
//  MyBarChart
//
//  Created by 吴向东 on 14/10/27.
//  Copyright (c) 2014年 DHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MIBDScalableBarGroup;
@protocol MIBDScalableBarGroupDataSource <NSObject>

- (CGFloat)rateForGroup:(MIBDScalableBarGroup *)group atIndex:(NSInteger)index;

@optional
- (NSString *)topTextForGroup:(MIBDScalableBarGroup *)group atIndex:(NSInteger)index;
- (NSString *)compareTextForGroup:(MIBDScalableBarGroup *)group atIndex:(NSInteger)index;
- (CGFloat)compareRateForGroup:(MIBDScalableBarGroup *)group atIndex:(NSInteger)index;
@end


@protocol MIBDScalableBarGroupDelegate <NSObject>

- (void)scalableBarGroupClicked:(MIBDScalableBarGroup *)group;

@end


@interface MIBDScalableBarGroup : UIView

@property (nonatomic) NSInteger barCount;
@property (nonatomic, weak) id<MIBDScalableBarGroupDataSource> dataSource;
@property (nonatomic, weak) id<MIBDScalableBarGroupDelegate> delegate;

- (void)reloadData;

- (UIColor *)colorForBarIndex:(NSInteger)barIndex;

@property (nonatomic) BOOL hasCompareLabel;
@property (nonatomic) BOOL horizontal;
@property (nonatomic) CGFloat barWidth;     // bar的宽度

- (CGFloat)xLocationForSeries:(NSInteger)index;

@end
