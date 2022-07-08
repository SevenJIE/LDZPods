//
//  MDCNFontDefine.h
//  MDCNProject
//
//  Created by apple on 2018/4/14.
//  Copyright © 2018年 com.ruanmengapp. All rights reserved.
//

#ifndef MDCNFontDefine_h
#define MDCNFontDefine_h

/**
 弱引用
 */
#define MD_WeakSelf __weak typeof(self) weakSelf = self



#define MD_URLSchemes @"zhongMouLifeCircle"

/**
 适配比例
 */
#define MD_Scale ([[UIScreen mainScreen] bounds].size.width / 375.0)
#define AutoSize(num) (num * MD_Scale)

/*
 * 细字体 "PingFangSC-Light"
 */
#define light10Font             [UIFont fontWithName:@"PingFang-SC-Light" size:10*MD_Scale]
#define light11Font             [UIFont fontWithName:@"PingFang-SC-Light" size:11*MD_Scale]
#define light12Font             [UIFont fontWithName:@"PingFang-SC-Light" size:12*MD_Scale]
#define light13Font             [UIFont fontWithName:@"PingFang-SC-Light" size:13*MD_Scale]
#define light14Font             [UIFont fontWithName:@"PingFang-SC-Light" size:14*MD_Scale]
#define light15Font             [UIFont fontWithName:@"PingFang-SC-Light" size:15*MD_Scale]
#define light16Font             [UIFont fontWithName:@"PingFang-SC-Light" size:16*MD_Scale]
#define light17Font             [UIFont fontWithName:@"PingFang-SC-Light" size:17*MD_Scale]
#define light18Font             [UIFont fontWithName:@"PingFang-SC-Light" size:18*MD_Scale]
#define lightCustomFont(num)              [UIFont fontWithName:@"PingFang-SC-Light" size:num*MD_Scale]


/*
 * 细字体 "PingFangSC-Medium"
 */
#define medium10Font             [UIFont systemFontOfSize:10*MD_Scale]
#define medium11Font             [UIFont systemFontOfSize:11*MD_Scale]
#define medium12Font             [UIFont systemFontOfSize:12*MD_Scale]
#define medium13Font             [UIFont systemFontOfSize:13*MD_Scale]
#define medium14Font             [UIFont systemFontOfSize:14*MD_Scale]
#define medium15Font             [UIFont systemFontOfSize:15*MD_Scale]
#define medium16Font             [UIFont systemFontOfSize:16*MD_Scale]
#define medium17Font             [UIFont systemFontOfSize:17*MD_Scale]
#define medium18Font             [UIFont systemFontOfSize:18*MD_Scale]
#define mediumCustomFont(num)              [UIFont systemFontOfSize:num*MD_Scale]

#define thickFont(x)                  [UIFont fontWithName:@"HelveticaNeue-Medium" size:MD_Scale*x]

/*
 * 常规字体
 */
#pragma mark -------------------------------- 普通字体
#define regular10Font             [UIFont systemFontOfSize:10*MD_Scale]
#define regular11Font             [UIFont systemFontOfSize:11*MD_Scale]
#define regular12Font             [UIFont systemFontOfSize:12*MD_Scale]
#define regular13Font             [UIFont systemFontOfSize:13*MD_Scale]
#define regular14Font             [UIFont systemFontOfSize:14*MD_Scale]
#define regular15Font             [UIFont systemFontOfSize:15*MD_Scale]
#define regular16Font             [UIFont systemFontOfSize:16*MD_Scale]
#define regular17Font             [UIFont systemFontOfSize:17*MD_Scale]
#define regular18Font             [UIFont systemFontOfSize:18*MD_Scale]
#define regularCustomFont(num)              [UIFont systemFontOfSize:num*MD_Scale]
/*
 * 加粗字体
 */
#pragma mark -------------------------------- 加粗字体
#define Bold10Font [UIFont boldSystemFontOfSize:10*MD_Scale]
#define Bold11Font [UIFont boldSystemFontOfSize:11*MD_Scale]
#define Bold12Font [UIFont boldSystemFontOfSize:12*MD_Scale]
#define Bold13Font [UIFont boldSystemFontOfSize:13*MD_Scale]
#define Bold14Font [UIFont boldSystemFontOfSize:14*MD_Scale]
#define Bold15Font [UIFont boldSystemFontOfSize:15*MD_Scale]
#define Bold16Font [UIFont boldSystemFontOfSize:16*MD_Scale]
#define Bold17Font [UIFont boldSystemFontOfSize:17*MD_Scale]
#define Bold18Font [UIFont boldSystemFontOfSize:18*MD_Scale]
#define BoldCustomFont(num)      [UIFont boldSystemFontOfSize:num*MD_Scale]

#endif /* MDCNFontDefine_h */
