//
//  MDCNDeviceDefine.h
//  MDCNProject
//
//  Created by apple on 2018/4/14.
//  Copyright © 2018年 com.ruanmengapp. All rights reserved.
//

#ifndef MDCNDeviceDefine_h
#define MDCNDeviceDefine_h

/**
 各个机型
 */
#define iPhone4s CGSizeEqualToSize(CGSizeMake(320, 480), [[UIScreen mainScreen] bounds].size)
#define iPhone5s ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhoneXR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhoneXS_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) : NO)

/**是否有刘海*/
#define iPhoneHasLiuHai (MD_StateHeight > 20)
#define AdaptNaviHeight (iPhoneHasLiuHai ? 24 : 0) //状态栏高度
/**状态栏高度*/
#define MD_StateHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define MD_NavBarHeight 44.0

/**导航栏高度*/
#define MD_NavHeight (MD_StateHeight + MD_NavBarHeight)
/**底部菜单高度*/
#define MD_TabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
/**底部遮罩视图高度*/
#define MD_bottomViewHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?34:0)
/**屏幕的宽度*/
#define MD_ViewWidth [[UIScreen mainScreen] bounds].size.width
/**屏幕的高度*/
#define MD_ViewHeight [[UIScreen mainScreen] bounds].size.height
/**keyWindow*/
#define MD_KeyWindow [UIApplication sharedApplication].keyWindow

/**屏幕的有效高度*/
#define MD_safeViewHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20 ? [[UIScreen mainScreen] bounds].size.height - 34 : [[UIScreen mainScreen] bounds].size.height)
/** 圆角*/
#define MD_CornerRadius  AutoSize(3)
/** 图片的圆角*/
#define MD_ImageCornerRadius AutoSize(3)
/** 线条高度*/
#define MD_LineHeight 1.0
/** 这个是为 点评项目写的宏  有些按钮字体要上移一点距离*/
#define MD_CustomButtonTitleEdgeInsets UIEdgeInsetsMake(-8, 2, 8, -2)

#endif /* MDCNDeviceDefine_h */
