//
//  MIBDPointerView.h
//  MIBDPointerViewSample
//
//  Created by 吴向东 on 14/11/17.
//  Copyright (c) 2014年 DHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MIBDPointerView : UIView

@property (nonatomic) NSString *text;
@property (nonatomic) CGFloat fontSize;
@property (nonatomic) CGSize pointOffset;
@property (nonatomic, getter=isSelected) BOOL selected;

- (void)reloadData;

@end
