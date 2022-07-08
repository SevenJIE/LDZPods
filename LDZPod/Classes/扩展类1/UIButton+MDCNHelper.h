//
//  UIButton+MDCNHelper.h
//  MDCNProject
//
//  Created by apple on 2018/4/14.
//  Copyright © 2018年 com.ruanmengapp. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_OPTIONS(NSUInteger, UIButtonTextSite) {
    UIButtonTextRight=0,//图片在左文字在右
    UIButtonTextLeft ,//图片在右文字在左
    UIButtonTextBottom,//图片在上文字在下
    UIButtonTextTop,//图片在下文字在上
};

typedef void(^ActionBlock)(id sender);
@interface UIButton (MDCNHelper)
/**
 *  按钮上的图片跟文字位置
 *
 *  @param offset 间距
 *  @param site   位置
 */
-(void)TiaoZhengButtonWithOffsit:(CGFloat)offset TextImageSite:(UIButtonTextSite)site;
/**
 *UIButton+Block
 */
- (void) handleControlEvent:(UIControlEvents)controlEvent withBlock:(ActionBlock)action;
/**
 *UIButton+Block
 */
- (void) handleControlEventWithBlock:(ActionBlock)action;
@end
