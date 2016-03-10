//
//  BMOCDoubleSteelBar.h
//  ThreePartBar
//
//  Created by 吴向东 on 14-8-29.
//  Copyright (c) 2014年 MIBD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMOCLabeledSteelBar.h"

@interface BMOCDoubleSteelBar : UIView

@property (nonatomic) NSString *titleString;
@property (nonatomic) NSString *unitString;

@property (nonatomic) CGFloat topLabelHight;

@property (nonatomic, readonly) BMOCLabeledSteelBar *leftBar;
@property (nonatomic, readonly) BMOCLabeledSteelBar *rightBar;

@property (nonatomic, readonly) NSArray *bars;

@property (nonatomic) CGFloat middleWidth;

- (void)reloadData;

@end
