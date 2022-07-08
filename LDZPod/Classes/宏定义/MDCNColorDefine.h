//
//  MDCNColorDefine.h
//  MDCNProject
//
//  Created by apple on 2018/4/14.
//  Copyright © 2018年 com.ruanmengapp. All rights reserved.
//

#ifndef MDCNColorDefine_h
#define MDCNColorDefine_h

/**传入16进制值，默认透明度1.0*/
#define ColorWithRGB(RGB) [UIColor colorWithRed:((float)((RGB & 0xFF0000) >> 16))/255.0 green:((float)((RGB & 0xFF00) >> 8))/255.0 blue:((float)(RGB & 0xFF))/255.0 alpha:1.0]
/**传入16进制值，自定义透明度*/
#define ColorWithRGBA(RGB,a) [UIColor colorWithRed:((float)((RGB & 0xFF0000) >> 16))/255.0 green:((float)((RGB & 0xFF00) >> 8))/255.0 blue:((float)(RGB & 0xFF))/255.0 alpha:a]

#pragma mark -------------------------------- 背景颜色
/** 透明背景*/
#define ClearColor [UIColor clearColor]
/** 白色背景*/
#define WhiteBGColor [UIColor whiteColor]
/** 遮罩背景*/
#define MaskControlColor [UIColor colorWithRed:0 green:0 blue:0 alpha:MD_MaskViewAlpha]
/** 默认背景颜色*/
#define DefaultBGColor ColorWithRGB(0xF8F8F8)
///蓝色背景
#define BlueColor ColorWithRGB(0x226597)
///浅蓝色背景
#define LightBlueColor ColorWithRGB(0x95ADC5)
/**黄色背景*/
#define YellowColor ColorWithRGB(0xF8D04E)
/**红色背景*/
#define RedColor ColorWithRGB(0xD80A2C)
/**红色背景*/
#define OrangeColor ColorWithRGB(0xDF7C1B)
/**绿色背景*/
#define GreenColor ColorWithRGB(0x5ACFB1)
/**特殊颜色*/
#define SpecialMatchColor ColorWithRGB(0x868FBF)

#pragma mark -------------------------------- 字体颜色
/** 白色字体*/
#define WhiteTextColor [UIColor whiteColor]
/**深黑色字体颜色*/
#define DeepBlackTextColor [UIColor blackColor]
/**黑色字体颜色*/
#define BlackTextColor ColorWithRGB(0x222222)
/**浅黑色字体颜色*/
#define LightBlackTextColor ColorWithRGB(0x1A1A1A)
/**标题字体颜色*/
#define TitleTextColor ColorWithRGB(0x42424C)
/**灰色字体颜色*/
#define GrayTextColor ColorWithRGB(0x666666)
/**灰色字体颜色*/
#define LightGrayTextColor ColorWithRGB(0x999999)
/**提示字体颜色*/
#define PlaceHolderTextColor ColorWithRGB(0xC7C7CD)

#pragma mark -------------------------------- 线条颜色
/**灰色线条颜色*/
#define GrayLineColor ColorWithRGB(0xF0F0F0)

#pragma mark -------------------------------- 边框颜色
/**灰色边框颜色*/
#define GrayBoardColor ColorWithRGB(0xF0F0F0)

#endif /* MDCNColorDefine_h */
