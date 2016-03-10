//
//  UIView+BMOCAction.h
//  bmoc
//
//  Created by 吴向东 on 14-9-26.
//  Copyright (c) 2014年 baosight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BMOCAction)

- (void)bezierDropFromPoint:(CGPoint)origin after:(NSTimeInterval)delay duration:(NSTimeInterval)duration;
- (void)bezierJumpToPoint:(CGPoint)destination after:(NSTimeInterval)delay duration:(NSTimeInterval)duration;

- (void)directJumpFromPoint:(CGPoint)origin after:(NSTimeInterval)delay duration:(NSTimeInterval)duration;
- (void)directJumpToPoint:(CGPoint)origin after:(NSTimeInterval)delay duration:(NSTimeInterval)duration;

@end
