//
//  UIImage+MDCNHelper.h
//  MDCNProject
//
//  Created by apple on 2018/4/14.
//  Copyright © 2018年 com.ruanmengapp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <Accelerate/Accelerate.h>
@interface UIImage (MDCNHelper)
/*
 *颜色这转为图片
 */
+(UIImage *)ImageForColor:(UIColor *)color;
/*
 *模糊图片
 */
+(UIImage *)blurryImage:(UIImage *)image
          withBlurLevel:(CGFloat)blur;
/* blur the current image with a box blur algoritm */
- (UIImage*)drn_boxblurImageWithBlur:(CGFloat)blur;

/* blur the current image with a box blur algoritm and tint with a color */
- (UIImage*)drn_boxblurImageWithBlur:(CGFloat)blur withTintColor:(UIColor*)tintColor;

+(UIImage *)setImgNameBianShen:(NSString *)Img;

/* 图片大小 */
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;
/*
 *获取图片某个点的RGBA值
 */
+(NSMutableArray *)getImagePixel:(UIImage *)image point:(CGPoint)apoint;
/*
*获取网络图片宽高
*/
+ (CGSize)getImageSizeWithURL:(id)URL;

//绘图(改变颜色)
-(UIImage*)imageChangeColor:(UIColor*)color;

+ (UIImage *)imageFromURLString: (NSString *) urlstring;
@end
