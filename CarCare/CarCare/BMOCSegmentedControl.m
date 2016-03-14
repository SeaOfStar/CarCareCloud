//
//  BMOCSegmentedControl.m
//  CustomSegmentedControls
//
//  Created by 吴向东 on 14-8-28.
//
//

#import "BMOCSegmentedControl.h"
//#import "UIImage+FrameworkLoad.h"

typedef enum {
    CapLeft          = 0,
    CapMiddle        = 1,
    CapRight         = 2,
    CapLeftAndRight  = 3
} CapLocation;

static const CGFloat kCapLeft = 15.0f;
static NSString *kNormalImageName = @"bottombarclear";
static NSString *kHightLightImageName = @"bottombarclear_pressed";
static NSString *kSplitImageName = @"clear-divider";

static UIFont *kLabelFont;

static UIColor *kHightColor;
static UIColor *kHighlightShadowColor;

@interface BMOCSegmentedControl ()

@property (nonatomic) NSArray *buttons;
@property (weak, nonatomic, readonly) UIColor *hightColor;
@property (weak, nonatomic, readonly) UIColor *selectedShadowColor;

@property (nonatomic, readonly) UIFont *labelFont;

@end

@implementation BMOCSegmentedControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)reloadData
{
    if (self.buttons.count > 0) {
        for (UIButton *button in self.buttons) {
            [button removeFromSuperview];
        }
    }

    self.buttons = nil;

    UIImage *splitImage = [UIImage imageNamed:kSplitImageName];

    CGFloat height = self.bounds.size.height;
    CGFloat splitWidth = splitImage.size.width;
    CGFloat totalWidth = 0;
    if (self.titles.count > 0) {
        totalWidth = self.bounds.size.width - (self.titles.count - 1) * splitWidth;
    }


    // 计算所有title的总长度
    CGFloat totalStringWidth = [self totalWidthOfTitle];
    const CGFloat scaleRateForString = totalWidth / totalStringWidth;

    CGFloat x = 0.0f;

    NSMutableArray *buffer = [NSMutableArray arrayWithCapacity:self.titles.count];
    for (int i=0; i<self.titles.count; i++) {
        NSString *title = self.titles[i];
        NSString *stringToShow = [NSString  stringWithFormat:@"    %@    ", title];
        CGFloat widthForTitle = [self lengthOfString:stringToShow] * scaleRateForString;

        CGSize size = CGSizeMake(widthForTitle, height);
        // 生成button
        UIButton *button = [self buttonAtIndex:i size:size];
        [self registActionForButton:button];
        [buffer addObject:button];

        if (i == self.selection) {
            button.selected = YES;
        }

        // 分割图片
        if (i != 0) {
            UIImageView *imageView = [[UIImageView alloc] initWithImage:splitImage];
            imageView.frame = CGRectMake(x, 0, splitWidth, height);
            [self addSubview:imageView];

            x += splitWidth;
        }

        // 分布位置
        button.frame = CGRectMake(x, 0, widthForTitle, self.bounds.size.height);
        [self addSubview:button];

        x += widthForTitle;
    }

    self.buttons = [NSArray arrayWithArray:buffer];

    [self refreshButtons];
}

- (CGFloat)totalWidthOfTitle
{
    CGFloat total = 0.0f;
    for (NSString *aTitle in self.titles) {
        NSString *stringToShow = [NSString  stringWithFormat:@"    %@    ", aTitle];
        total += [self lengthOfString:stringToShow];
    }

    return total;
}

- (CGFloat)lengthOfString:(NSString *)string
{
    static CGSize baseSize;
    static NSDictionary *attributs;
    if (! attributs) {
        baseSize = CGSizeMake(MAXFLOAT, 0);
        attributs = @{NSFontAttributeName: self.labelFont};
    }

    CGRect rect = [string boundingRectWithSize:baseSize options:0 attributes:attributs context:nil];
//    NSLog(@"[%@] = %@", string, NSStringFromCGRect(rect));
    return rect.size.width;
}

- (void)registActionForButton:(UIButton *)button
{
    [button addTarget:self action:@selector(touchDownAction:) forControlEvents:UIControlEventTouchDown];
    [button addTarget:self action:@selector(touchUpInsideAction:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(otherTouchesAction:) forControlEvents:UIControlEventTouchUpOutside];
    [button addTarget:self action:@selector(otherTouchesAction:) forControlEvents:UIControlEventTouchDragOutside];
    [button addTarget:self action:@selector(otherTouchesAction:) forControlEvents:UIControlEventTouchDragInside];
}

- (UIButton *)buttonAtIndex:(NSInteger)indexForButton size:(CGSize)buttonSize
{
    CapLocation location;
    if (self.titles.count == 1) {
        location = CapLeftAndRight;
    }
    else if (indexForButton == 0) {
        location = CapLeft;
    }
    else if (indexForButton == self.titles.count - 1) {
        location = CapRight;
    }
    else {
        location = CapMiddle;
    }

    UIImage* buttonImage = nil;
    UIImage* buttonPressedImage = nil;

    CGFloat capWidth = kCapLeft;

    if (location == CapLeftAndRight) {
        buttonImage = [[UIImage imageNamed:kNormalImageName] stretchableImageWithLeftCapWidth:capWidth topCapHeight:0.0];
        buttonPressedImage = [[UIImage imageNamed:kHightLightImageName] stretchableImageWithLeftCapWidth:capWidth topCapHeight:0.0];
    }
    else {
        buttonImage = [self image:[[UIImage imageNamed:kNormalImageName] stretchableImageWithLeftCapWidth:capWidth topCapHeight:0.0] withCap:location capWidth:capWidth buttonWidth:buttonSize.width];
        buttonPressedImage = [self image:[[UIImage imageNamed:kHightLightImageName] stretchableImageWithLeftCapWidth:capWidth topCapHeight:0.0] withCap:location capWidth:capWidth buttonWidth:buttonSize.width];
    }

    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0.0, 0.0, buttonSize.width, buttonSize.height);
//    NSLog(@"[%@].width=%f, height=%f", self.titles[indexForButton], buttonSize.width, buttonSize.height);

    [button setTitle:self.titles[indexForButton] forState:UIControlStateNormal];
    button.titleLabel.font = self.labelFont;
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:buttonPressedImage forState:UIControlStateHighlighted];
    [button setBackgroundImage:buttonPressedImage forState:UIControlStateSelected];
    button.adjustsImageWhenHighlighted = NO;
    button.clipsToBounds = YES;

    return button;
}

- (UIFont *)labelFont
{
    if (kLabelFont) {
        return kLabelFont;
    }

    kLabelFont = [UIFont systemFontOfSize:12.0f];
    return kLabelFont;
}

-(UIImage*)image:(UIImage*)image withCap:(CapLocation)location capWidth:(NSUInteger)capWidth buttonWidth:(NSUInteger)buttonWidth
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(buttonWidth, image.size.height), NO, 0.0);

    if (location == CapLeft)
        // To draw the left cap and not the right, we start at 0, and increase the width of the image by the cap width to push the right cap out of view
        [image drawInRect:CGRectMake(0, 0, buttonWidth + capWidth, image.size.height)];
    else if (location == CapRight)
        // To draw the right cap and not the left, we start at negative the cap width and increase the width of the image by the cap width to push the left cap out of view
        [image drawInRect:CGRectMake(0.0-capWidth, 0, buttonWidth + capWidth, image.size.height)];
    else if (location == CapMiddle)
        // To draw neither cap, we start at negative the cap width and increase the width of the image by both cap widths to push out both caps out of view
        [image drawInRect:CGRectMake(0.0-capWidth, 0, buttonWidth + (capWidth * 2), image.size.height)];

    UIImage* resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resultImage;
}


#pragma mark - reload
- (void)setTitles:(NSArray *)titles
{
    _titles = titles;
    [self reloadData];
}

#pragma mark - 点击事件处理
- (void)touchDownAction:(UIButton*)button
{
    NSInteger newIndex = [self.buttons indexOfObject:button];
    if ([self.delegate respondsToSelector:@selector(segmentValueWillChanged:toIndex:)]) {
        [self.delegate segmentValueWillChanged:self toIndex:newIndex];
    }

    self.selection = newIndex;
    [self refreshButtons];

    if ([self.delegate respondsToSelector:@selector(segmentValueDidChanged:)]) {
        [self.delegate segmentValueDidChanged:self];
    }
}

- (void)touchUpInsideAction:(UIButton*)button
{
    [self refreshButtons];
}

- (void)otherTouchesAction:(UIButton*)button
{
    [self refreshButtons];
}

-(void) refreshButtons
{
    for (int i=0; i<self.buttons.count; i++) {
        UIButton *button = self.buttons[i];
        if (i == self.selection) {
            button.selected = YES;
            button.highlighted = button.selected ? NO : YES;
            CALayer *layer = button.titleLabel.layer;
            layer.shadowColor = self.hightColor.CGColor;
            layer.shadowOffset = CGSizeMake(0, button.bounds.size.height / 2.0f);
            layer.shadowOpacity = 1.0f;
            layer.shadowRadius = 4.0f;
            layer.masksToBounds = NO;

//            button.titleLabel.textColor = self.hightColor;
//            button.titleLabel.highlightedTextColor = self.hightColor;
            [button setTintColor:self.hightColor];
            [button setTitleColor:self.hightColor forState:UIControlStateNormal];
            [button setTitleColor:self.hightColor forState:UIControlStateSelected];
            [button setTitleColor:self.hightColor forState:UIControlStateHighlighted];
        }
        else {
            button.selected = NO;
            button.highlighted = NO;
            CALayer *layer = button.titleLabel.layer;
            layer.shadowColor = [UIColor clearColor].CGColor;
            button.titleLabel.textColor = [UIColor whiteColor];
        }
    }
}


- (UIColor *)hightColor
{
    if (kHightColor) {
        return kHightColor;
    }

    kHightColor = [UIColor colorWithRed:0.26f green:0.94f blue:0.93f alpha:1.0f];
    return kHightColor;
}

- (UIColor *)selectedShadowColor
{
    if (kHighlightShadowColor) {
        return kHighlightShadowColor;
    }

    kHighlightShadowColor = [UIColor colorWithRed:0.46f green:0.94f blue:0.93f alpha:1.0f];
    return kHighlightShadowColor;
}

@end
