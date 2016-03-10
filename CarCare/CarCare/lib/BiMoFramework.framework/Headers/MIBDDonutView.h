//
//  MIBDDonutView.h
//  MIBDDoubleLayerDonutView
//
//  Created by 吴向东 on 14/10/30.
//  Copyright (c) 2014年 DHC. All rights reserved.
//

#import <UIKit/UIKit.h>


@class MIBDDonutView;
//@protocol MIBDDonutViewDataSource <NSObject>
//
//- (NSInteger)sectionCountForDonutView:(MIBDDonutView *)donut;
//- (NSString *)nameForDonutView:(MIBDDonutView *)donut atSection:(NSInteger)section;
//- (NSInteger)dataCountForDonutView:(MIBDDonutView *)donut atSection:(NSInteger)section;
//
//- (CGFloat)valueForDonutView:(MIBDDonutView *)donut atSection:(NSInteger)section;
//- (CGFloat)valueForDonutView:(MIBDDonutView *)donut atSection:(NSInteger)section andIndex:(NSInteger)index;
//
//@end

@protocol MIBDDonutViewDelegate <NSObject>

-(void)donutView:(MIBDDonutView *)donut didSelectForSection:(NSInteger)section andCell:(NSInteger)cell;
-(void)donutViewCanceledSelection:(MIBDDonutView *)donut;

@end

@interface MIBDDonutView : UIView

@property (nonatomic, weak) id <MIBDDonutViewDelegate> delegate;

@property (nonatomic) NSArray *dataList;

- (void)reloadData;

- (UIColor *)colorForSection:(NSInteger)section highlight:(BOOL)isHighlight;
//- (UIColor *)colorForSection:(NSInteger)section andCell:(NSInteger)cell highlight:(BOOL)isHighlight;

// -1意味着没有选择任何section
// 0或者正数数表示选择某个section
@property (nonatomic, readonly)NSInteger selection;

@property (nonatomic) NSString *titleString;
@property (nonatomic) NSArray *sectionStrings;

@end
