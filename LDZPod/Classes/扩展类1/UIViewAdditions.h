#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (KNCategory)

/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = left
 */
@property (nonatomic) CGFloat left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property (nonatomic) CGFloat top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat height;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat centerY;

/**
 * Return the x coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat ttScreenX;

/**
 * Return the y coordinate on the screen.
 */
@property (nonatomic, readonly) CGFloat ttScreenY;

/**
 * Return the x coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewX;

/**
 * Return the y coordinate on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGFloat screenViewY;

/**
 * Return the view frame on the screen, taking into account scroll views.
 */
@property (nonatomic, readonly) CGRect screenFrame;

/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint origin;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize size;

@property (nonatomic, assign) IBInspectable CGFloat borderWidth;

@property (nonatomic, strong) IBInspectable UIColor *borderColor;

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

@property (nonatomic,readonly) NSArray * allSubviews;

/**
 设置视图圆角

 @param round 圆角大小
 */
-(void)roundSize:(CGFloat )round;

/**
 设置自定义圆角

 @param round 圆角大小
 @param corners 圆角方向
 */
-(void)roundSize:(CGFloat)round andCorner:(UIRectCorner)corners;

- (void)showTipMessage:(NSString *)message;

/**
 设置左右渐变色

 @param colors 颜色数组
 */
- (void)setJianBianWithColors:(NSArray *)colors;
/**
 设置上下渐变色

 @param colors 颜色数组
 */
- (void)setSXJianBianWithColors:(NSArray *)colors;

/**
 为当前的view添加模糊效果
 */
- (void)addVisualEffect;


/**
 为当前的view添加模糊效果

 @param frame 需要增加的区域
 */
- (void)addVisualEffectWithFrame:(CGRect)frame;

/**
 移除当前view的毛玻璃效果
 */
-(void)removeVisualEffectView;

@end
