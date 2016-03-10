//
//  BMOCCircledLabel.h
//  bmoc
//
//  Created by 吴向东 on 14-9-3.
//  Copyright (c) 2014年 baosight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMOCCircledLabel : UIView

// 这个数据是基于1.0f的百分比
@property (nonatomic) CGFloat valueRate;
- (void)reloadData;

@end
