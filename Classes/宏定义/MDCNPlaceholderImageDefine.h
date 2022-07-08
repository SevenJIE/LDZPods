//
//  MDCNPlaceholderImageDefine.h
//  MDCNProject
//
//  Created by apple on 2018/4/14.
//  Copyright © 2018年 com.ruanmengapp. All rights reserved.
//

#ifndef MDCNPlaceholderImageDefine_h
#define MDCNPlaceholderImageDefine_h

/** 本地icon命名*/
#define MD_UIImageNamed(name)    [UIImage imageNamed:name]
/** 网络图片加载*/
#define MD_HTTPUIImageNamed(name)   ([name hasPrefix:@"http"] ? [NSURL URLWithString:[NSString stringWithFormat:@"%@",name]] : [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",ServiceIP,name]])

/** 左上角返回按钮默认图片 */
#define MD_LeftPopImage    [UIImage imageNamed:@"dingbu_fenhui"]
/** 向右箭头更多按钮默认图片 */
#define MD_RightArrowImage    [UIImage imageNamed:@"center_15"]

/** 轮播图默认图片 */
#define MD_BannerDefaultImage  [UIImage imageNamed:@"bannerpic"]
/** 正方形图片 */
#define MD_squareDefaultImage   [UIImage imageNamed:@"squareDefault"]
/** 长方形图片 */
#define MD_longSquareDefaultImage     [UIImage imageNamed:@"rectpic"]
/** 头像图片 */
#define MD_headerDefaultImage      [UIImage imageNamed:@"userHeader"]
/** 头像图片 */
#define MD_colorDefaultImage      [UIImage imageNamed:@"longDefault"]
/** 默认网络图 */
#define MD_defaultWebImage     @"https://b-ssl.duitang.com/uploads/item/20182/21/2018221142159_MZ33z.jpeg"
#define MD_VerticalWebImage     @"http://s7.sinaimg.cn/mw690/006PhMfPzy7d2Cou8Cy46&690"
#define MD_HorizontalWebImage     @"http://s7.sinaimg.cn/mw690/006PhMfPzy7d2Cou8Cy46&690"

#endif /* MDCNPlaceholderImageDefine_h */
