//
//  BMOC3DImageView.h
//  bmoc
//
//  Created by 吴向东 on 14-9-29.
//  Copyright (c) 2014年 baosight. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BMOC3DImageView;
@protocol BMOC3DImageViewDelegate <NSObject>

- (void)userDidClicked:(BMOC3DImageView *)imageView withIndex:(NSInteger)index;

@optional
- (void)imageView:(BMOC3DImageView *)imageView didScrollTo:(NSInteger)imageIndex;

@end

@interface BMOC3DImageView : UIView

@property (nonatomic) NSArray *images;

@property (nonatomic, weak) id <BMOC3DImageViewDelegate> delegate;

@end
