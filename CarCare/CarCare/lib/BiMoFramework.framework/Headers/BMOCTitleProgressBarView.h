//
//  BMOCTitleProgressBarView.h
//  bmoc
//
//  Created by gu feng on 14-9-15.
//  Copyright (c) 2014年 baosight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMOCTitleProgressBarView : UIView

@property (nonatomic) NSAttributedString * title;
@property (nonatomic) NSString * valueString;
@property (nonatomic) CGFloat valueRate;

- (void)reloadData;
@end
