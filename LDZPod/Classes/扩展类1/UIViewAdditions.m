#import "UIViewAdditions.h"

/**
 * Additions.
 */

@implementation UIView (KNCategory)

@dynamic borderColor;
@dynamic borderWidth;
@dynamic cornerRadius;

- (void)setBorderWidth:(CGFloat)borderWidth {
    if (borderWidth < 0) return;
    
    self.layer.borderWidth = borderWidth;
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = cornerRadius > 0;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)left {
  return self.frame.origin.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setLeft:(CGFloat)x {
  CGRect frame = self.frame;
  frame.origin.x = x;
  self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)top {
  return self.frame.origin.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setTop:(CGFloat)y {
  CGRect frame = self.frame;
  frame.origin.y = y;
  self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)right {
  return self.frame.origin.x + self.frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setRight:(CGFloat)right {
  CGRect frame = self.frame;
  frame.origin.x = right - frame.size.width;
  self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)bottom {
  return self.frame.origin.y + self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setBottom:(CGFloat)bottom {
  CGRect frame = self.frame;
  frame.origin.y = bottom - frame.size.height;
  self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)centerX {
  return self.center.x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCenterX:(CGFloat)centerX {
  self.center = CGPointMake(centerX, self.center.y);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)centerY {
  return self.center.y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setCenterY:(CGFloat)centerY {
  self.center = CGPointMake(self.center.x, centerY);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)width {
  return self.frame.size.width;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setWidth:(CGFloat)width {
  CGRect frame = self.frame;
  frame.size.width = width;
  self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)height {
  return self.frame.size.height;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setHeight:(CGFloat)height {
  CGRect frame = self.frame;
  frame.size.height = height;
  self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)ttScreenX {
  CGFloat x = 0;
  for (UIView* view = self; view; view = view.superview) {
    x += view.left;
  }
  return x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)ttScreenY {
  CGFloat y = 0;
  for (UIView* view = self; view; view = view.superview) {
    y += view.top;
  }
  return y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)screenViewX {
  CGFloat x = 0;
  for (UIView* view = self; view; view = view.superview) {
      x += view.left;

    if ([view isKindOfClass:[UIScrollView class]]) {
      UIScrollView* scrollView = (UIScrollView*)view;
      x -= scrollView.contentOffset.x;
    }
  }

  return x;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)screenViewY {
  CGFloat y = 0;
  for (UIView* view = self; view; view = view.superview) {
    y += view.top;

    if ([view isKindOfClass:[UIScrollView class]]) {
      UIScrollView* scrollView = (UIScrollView*)view;
      y -= scrollView.contentOffset.y;
    }
  }
  return y;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGRect)screenFrame {
  return CGRectMake(self.screenViewX, self.screenViewY, self.width, self.height);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGPoint)origin {
  return self.frame.origin;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setOrigin:(CGPoint)origin {
  CGRect frame = self.frame;
  frame.origin = origin;
  self.frame = frame;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)size {
  return self.frame.size;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)setSize:(CGSize)size {
  CGRect frame = self.frame;
  frame.size = size;
  self.frame = frame;
}

-(NSArray*)allSubviews {
    NSMutableArray *arr = [NSMutableArray array];
    [arr addObject:self];
    for (UIView * subview in self.subviews) {
        [arr addObjectsFromArray:(NSArray*)[subview allSubviews]];
    }
    return arr;
}
-(void)roundSize:(CGFloat )round{
    self.layer.cornerRadius = round;
    self.layer.masksToBounds=YES;
    // self.clipsToBounds=YES;
}
/**
 * 设置圆角
 */
-(void)roundSize:(CGFloat)round andCorner:(UIRectCorner)corners{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(round, round)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    
    CAShapeLayer *borderMaskLayer = [CAShapeLayer layer];
    borderMaskLayer.path = maskPath.CGPath;
    borderMaskLayer.lineWidth = self.layer.borderWidth;
    borderMaskLayer.strokeColor = self.layer.borderColor;
    borderMaskLayer.fillColor = [UIColor clearColor].CGColor;
    
    self.layer.mask = maskLayer;
    [self.layer addSublayer:borderMaskLayer];
}

- (void)showTipMessage:(NSString *)message
{
//    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:[UIApplication sharedApplication].keyWindow animated:YES];
//    HUD.mode = MBProgressHUDModeText;
//    HUD.label.text  = message;
//    HUD.label.numberOfLines = 2;
//    HUD.removeFromSuperViewOnHide = YES;
//    [HUD hideAnimated:NO afterDelay:2.0];
}

- (void)setJianBianWithColors:(NSArray *)colors
{
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    gradientLayer.colors = colors;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 0);
    gradientLayer.locations = @[@0,@1];
    [self.layer addSublayer:gradientLayer];
}
/**
 设置上下渐变色

 @param colors 颜色数组
 */
- (void)setSXJianBianWithColors:(NSArray *)colors
{
    CAGradientLayer * gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.bounds;
    gradientLayer.colors = colors;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    gradientLayer.locations = @[@0,@1];
    [self.layer addSublayer:gradientLayer];
}

- (void)addVisualEffect{
    self.backgroundColor = [UIColor clearColor];
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
    visualEffectView.frame =CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    [self addSubview:visualEffectView];
    [self sendSubviewToBack:visualEffectView];
}

-(void)addVisualEffectWithFrame:(CGRect)frame{
    self.backgroundColor = [UIColor clearColor];
    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc]initWithEffect:blurEffect];
    visualEffectView.frame =frame;
    [self addSubview:visualEffectView];
    [self sendSubviewToBack:visualEffectView];
}

-(void)removeVisualEffectView{
    for (id effectView in self.subviews) {
        if ([effectView isKindOfClass:[UIVisualEffectView class]]) {
            [effectView removeFromSuperview];
        }
    }
}


@end
