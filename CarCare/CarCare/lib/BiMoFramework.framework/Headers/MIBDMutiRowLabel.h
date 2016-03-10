//
//  MIBDMutiRowLabel.h
//  MIBDPointerViewSample
//
//  Created by 吴向东 on 14/12/5.
//  Copyright (c) 2014年 DHC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MIBDMutiRowLabel : UIView

@property (nonatomic) CGFloat fontSize;     // 字号大小，必须设置
@property (nonatomic) CGFloat topFontSize;      // 上部文字字号大小，如果文字分行则必须设置
@property (nonatomic) CGFloat bottomFontSize;   // 下部文字字号大小，如果文字分行则必须设置

@property (nonatomic) UIColor *color;       // 文字前景色
@property (nonatomic) NSArray *texts;        // 文字内容（如果文字内容中含有'\n',则会在第一个'\n'处自动分行）

- (void)reloadData;

@end
