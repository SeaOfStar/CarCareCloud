//
//  MIBDFourItemsLabel.h
//  bmoc
//
//  Created by gu feng on 15/3/9.
//  Copyright (c) 2015年 baosight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MIBDFourItemsLabel : UIView

@property (nonatomic) CGFloat fontSize;         // 字号大小，必须设置
@property (nonatomic) CGFloat itemFontSize;     // 下部子标签文字字号大小，必须设置

@property (nonatomic) UIColor *color;           // 文字前景色
@property (nonatomic) NSArray *texts;           // 文字内容，如果为空，那么隐藏
@property (nonatomic) NSString *firstItemName;  // 第一个子标签文字内容
@property (nonatomic) NSString *secondItemName; // 第二个子标签文字内容
@property (nonatomic) NSArray *firstSubTexts;   // 第一个子标签文字列
@property (nonatomic) NSArray *secondSubTexts;  // 第二个子标签文字列
@property (nonatomic) NSString *thirdItemName;  // 第三个子标签文字内容
@property (nonatomic) NSString *fouthItemName;  // 第四个子标签文字内容
@property (nonatomic) NSArray *thirdSubTexts;   // 第三个子标签文字列
@property (nonatomic) NSArray *fouthSubTexts;   // 第四个子标签文字列

- (void)reloadData;

@end
