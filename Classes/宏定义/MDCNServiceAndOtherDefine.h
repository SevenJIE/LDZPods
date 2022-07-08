//
//  MDCNServiceAndOtherDefine.h
//  westHarbourShop
//
//  Created by 1 on 2019/4/1.
//  Copyright © 2019年 1. All rights reserved.
//

#ifndef MDCNServiceAndOtherDefine_h
#define MDCNServiceAndOtherDefine_h

/**网络请求地址*/
#define ServiceIP @"http://47.104.174.59"
////本地IP
//#define ServiceIP @"http://192.168.3.150:8080"
//拼接图片链接
#define MD_AppendingHttp(urlStr) ([urlStr hasPrefix:@"http"] ? urlStr : [NSString stringWithFormat:@"%@%@",ServiceIP,urlStr])

//请求是否成功
#define SuccessCode(code) [code isEqualToString:@"0"]

//判断是否是男性
#define MD_isMan(sexStr) ([[[NSString stringWithFormat:@"%@",sexStr] EmptyStringByWhitespace]  isEqualToString:@"1"] ? YES : NO)

/**
 DES三层加密
 */
#define Des3appkey @"c306e6eb-fdba-11e7-9bb0-00163e0004bf"
#define Des3sercret @"jZ0F9RTa5Y4NDZ95C4n38SuddBgtSw05"

/**空白布局的样式统一*/
#define EmptyImageKey @"icon_empty"
#define EmptyTextTitleKey @"暂无内容"


//刷新首页数据
#define MD_refreshHomeData @"MD_refreshHomeData"
//刷新即买即送数据
#define MD_refreshBuyAndSendData @"MD_refreshBuyAndSendData"
//刷新购物车数据
#define MD_refreshShopCarData @"MD_refreshShopCarData"
//刷新用户中心数据
#define MD_refreshCustomCenterData @"MD_refreshCustomCenterData"
//刷新骑手中心数据
#define MD_refreshRiderCenterData @"MD_refreshRiderCenterData"

#define MD_refreshChooseAddressData @"MD_refreshChooseAddressData"


#endif /* MDCNServiceAndOtherDefine_h */
