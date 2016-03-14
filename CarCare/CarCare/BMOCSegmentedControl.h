//
//  BMOCSegmentedControl.h
//  CustomSegmentedControls
//
//  Created by 吴向东 on 14-8-28.
//
//

#import <UIKit/UIKit.h>

@class BMOCSegmentedControl;
@protocol BMOCSegmentedControlDelegate <NSObject>

@optional
- (void)segmentValueWillChanged:(BMOCSegmentedControl *)control toIndex:(NSInteger)index;
- (void)segmentValueDidChanged:(BMOCSegmentedControl *)control;

@end

@interface BMOCSegmentedControl : UIView

@property (nonatomic) NSArray *titles;
@property (nonatomic) NSInteger selection;
@property (nonatomic, weak) id<BMOCSegmentedControlDelegate> delegate;

@end
