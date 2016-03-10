//
//  MIBDColoredLabelGroup.h
//  MyBarChart
//
//  Created by 吴向东 on 14/10/29.
//  Copyright (c) 2014年 DHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MIBDColoredLabelGroup;
@protocol MIBDColoredLabelGroupDataSource <NSObject>

- (NSString *)textForGroup:(MIBDColoredLabelGroup *)group atLine:(NSInteger)line andRow:(NSInteger)row;

// 注意：如果dataSource实现了image接口，控件将忽略color接口
- (UIColor *)colorForGroup:(MIBDColoredLabelGroup *)group atLine:(NSInteger)line andRow:(NSInteger)row;

@optional

- (UIImage *)imageForGroup:(MIBDColoredLabelGroup *)group atLine:(NSInteger)line andRow:(NSInteger)row;
- (NSAttributedString *)attributedStringForGroup:(MIBDColoredLabelGroup *)group atLine:(NSInteger)line andRow:(NSInteger)row;

@end


@interface MIBDColoredLabelGroup : UIView

@property (nonatomic, weak) id<MIBDColoredLabelGroupDataSource> dataSource;

// 矩形排列的label的行数和列数
@property (nonatomic) NSInteger lineCount;              // 默认值为 1
@property (nonatomic) NSInteger rowCount;               // 默认值为 1
//@property (nonatomic) CGFloat offsetBetweenLine;        // 行间距
@property (nonatomic) CGFloat cellHeight;               // 单条数据的高度

- (void)reloadData;

@end
