//
//  UIColor+MDCNHelper.h
//  MDCNProject
//
//  Created by apple on 2018/4/14.
//  Copyright © 2018年 com.ruanmengapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (MDCNHelper)

/**
 十六进制字符串获取颜色

 @param color 16进制色值  支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 @return 颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color;


/**
 十六进制字符串获取颜色

 @param color 16进制色值  支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 @param alpha 透明度
 @return 颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end
