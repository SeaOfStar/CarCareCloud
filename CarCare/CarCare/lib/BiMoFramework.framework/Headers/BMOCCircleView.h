//
//  BMOCCircleView.h
//  bmoc
//
//  Created by 吴向东 on 14-9-11.
//  Copyright (c) 2014年 baosight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BMOCCircleView : UIView

@property (nonatomic) NSArray *values;
@property (nonatomic) NSString *valueString;

- (void)reloadData;

@end
