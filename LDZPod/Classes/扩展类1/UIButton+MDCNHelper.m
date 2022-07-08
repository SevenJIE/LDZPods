//
//  UIButton+MDCNHelper.m
//  MDCNProject
//
//  Created by apple on 2018/4/14.
//  Copyright © 2018年 com.ruanmengapp. All rights reserved.
//

#import "UIButton+MDCNHelper.h"
#import <objc/runtime.h>
static const void *overviewKey = "overview";
@implementation UIButton (MDCNHelper)
/**
 *  按钮上的图片跟文字，居中对齐
 */
-(void)TiaoZhengButtonWithOffsit:(CGFloat)offset TextImageSite:(UIButtonTextSite)site{
    if (site==UIButtonTextLeft) {
        [self TextImageLeftWithOffsit:offset];
    } else if (site==UIButtonTextTop) {
        [self TextImageTopWithOffsit:offset];
    } else  if (site==UIButtonTextBottom) {
        [self TextImageBottomWithOffsit:offset];
    }else{
        [self TextImageRightWithOffsit:offset];
    }
}
/**
 *  文字在右边，图片在左边，居中对齐
 *
 *  @param offset 文字跟图片间的间距大小
 */
-(void)TextImageRightWithOffsit:(CGFloat)offset{
    
    CGFloat offsetBetweenImageAndText = offset;
    CGFloat insetAmount = offsetBetweenImageAndText / 2.0;
    self.imageEdgeInsets = UIEdgeInsetsMake(0,-insetAmount, 0,insetAmount);
    self.titleEdgeInsets = UIEdgeInsetsMake(0,insetAmount, 0, -insetAmount);
    self.contentEdgeInsets = UIEdgeInsetsMake(0, insetAmount, 0, insetAmount);
}
/**
 *  文字在左边，图片在右边，居中对齐
 *
 *  @param offset 文字跟图片间的间距大小
 */
-(void)TextImageLeftWithOffsit:(CGFloat)offset{
    CGFloat imgW=self.imageView.frame.size.width;
    CGFloat titleW=self.titleLabel.frame.size.width;
    CGFloat offsetBetweenImageAndText = offset;
    CGFloat insetAmount = offsetBetweenImageAndText / 2.0;
    self.imageEdgeInsets = UIEdgeInsetsMake(0,titleW+insetAmount, 0,-titleW-insetAmount);
    self.titleEdgeInsets = UIEdgeInsetsMake(0,-imgW-insetAmount, 0, imgW+insetAmount);
    self.contentEdgeInsets = UIEdgeInsetsMake(0, insetAmount, 0, insetAmount);
}
/**
 *  文字在下边，图片在上边，居中对齐
 *
 *  @param offset 文字跟图片间的间距大小
 */
-(void)TextImageBottomWithOffsit:(CGFloat)offset{
//    CGPoint buttonBoundsCenter = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
//    // 找出imageView最终的center
//    CGPoint endImageViewCenter = CGPointMake(buttonBoundsCenter.x, CGRectGetMidY(self.imageView.bounds));
//    // 找出titleLabel最终的center
//    CGPoint endTitleLabelCenter = CGPointMake(buttonBoundsCenter.x, CGRectGetHeight(self.bounds)-CGRectGetMidY(self.titleLabel.bounds));
//    // 取得imageView最初的center
//    CGPoint startImageViewCenter = self.imageView.center;
//    // 取得titleLabel最初的center
//    CGPoint startTitleLabelCenter = self.titleLabel.center;
//    // 设置imageEdgeInsets
//    CGFloat imgH=self.imageView.frame.size.height/2;
//    CGFloat titleH=self.titleLabel.frame.size.height/2;
//    CGFloat offsetBetweenImageAndText = offset;
//    CGFloat insetAmount = offsetBetweenImageAndText / 2.0;
//
//    CGFloat imageEdgeInsetsTop = -titleH-insetAmount;
//    CGFloat imageEdgeInsetsLeft = endImageViewCenter.x - startImageViewCenter.x;
//    CGFloat imageEdgeInsetsBottom = -imageEdgeInsetsTop;
//    CGFloat imageEdgeInsetsRight = -imageEdgeInsetsLeft;
//
//    self.imageEdgeInsets = UIEdgeInsetsMake(imageEdgeInsetsTop, imageEdgeInsetsLeft, imageEdgeInsetsBottom, imageEdgeInsetsRight);
//    // 设置titleEdgeInsets
//    CGFloat titleEdgeInsetsTop = imgH+insetAmount;
//    CGFloat titleEdgeInsetsLeft = endTitleLabelCenter.x - startTitleLabelCenter.x;
//    CGFloat titleEdgeInsetsBottom = -titleEdgeInsetsTop;
//    CGFloat titleEdgeInsetsRight = -titleEdgeInsetsLeft;
//    self.titleEdgeInsets = UIEdgeInsetsMake(titleEdgeInsetsTop, titleEdgeInsetsLeft, titleEdgeInsetsBottom, titleEdgeInsetsRight);
    
    CGSize imageSize = self.imageView.frame.size;
    CGSize titleSize = self.titleLabel.frame.size;
    CGSize textSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName : self.titleLabel.font}];
    CGSize frameSize = CGSizeMake(ceilf(textSize.width), ceilf(textSize.height));
    if (titleSize.width + 0.5 < frameSize.width) {
        titleSize.width = frameSize.width;
    }
    CGFloat totalHeight = (imageSize.height + titleSize.height + offset);
    self.imageEdgeInsets = UIEdgeInsetsMake(- (totalHeight - imageSize.height), 0.0, 0.0, - titleSize.width);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, - imageSize.width, - (totalHeight - titleSize.height), 0);
}
/**
 *  文字在上边，图片在下边，居中对齐
 *
 *  @param offset 文字跟图片间的间距大小
 */
-(void)TextImageTopWithOffsit:(CGFloat)offset{
    CGPoint buttonBoundsCenter = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    // 找出imageView最终的center
    CGPoint endImageViewCenter = CGPointMake(buttonBoundsCenter.x, CGRectGetMidY(self.imageView.bounds));
    // 找出titleLabel最终的center
    CGPoint endTitleLabelCenter = CGPointMake(buttonBoundsCenter.x, CGRectGetHeight(self.bounds)-CGRectGetMidY(self.titleLabel.bounds));
    // 取得imageView最初的center
    CGPoint startImageViewCenter = self.imageView.center;
    // 取得titleLabel最初的center
    CGPoint startTitleLabelCenter = self.titleLabel.center;
    // 设置imageEdgeInsets
    CGFloat imgH=self.imageView.frame.size.height/2;
    CGFloat titleH=self.titleLabel.frame.size.height/2;
    CGFloat offsetBetweenImageAndText = offset;
    CGFloat insetAmount = offsetBetweenImageAndText / 2.0;
    
    CGFloat imageEdgeInsetsTop = titleH+insetAmount;
    CGFloat imageEdgeInsetsLeft = endImageViewCenter.x - startImageViewCenter.x;
    CGFloat imageEdgeInsetsBottom = -imageEdgeInsetsTop;
    CGFloat imageEdgeInsetsRight = -imageEdgeInsetsLeft;
    
    self.imageEdgeInsets = UIEdgeInsetsMake(imageEdgeInsetsTop, imageEdgeInsetsLeft, imageEdgeInsetsBottom, imageEdgeInsetsRight);
    // 设置titleEdgeInsets
    CGFloat titleEdgeInsetsTop = -imgH-insetAmount;
    CGFloat titleEdgeInsetsLeft = endTitleLabelCenter.x - startTitleLabelCenter.x;
    CGFloat titleEdgeInsetsBottom = -titleEdgeInsetsTop;
    CGFloat titleEdgeInsetsRight = -titleEdgeInsetsLeft;
    self.titleEdgeInsets = UIEdgeInsetsMake(titleEdgeInsetsTop, titleEdgeInsetsLeft, titleEdgeInsetsBottom, titleEdgeInsetsRight);
}


- (void)handleControlEvent:(UIControlEvents)event withBlock:(ActionBlock)block {
    objc_setAssociatedObject(self, &overviewKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:event];
}
- (void) handleControlEventWithBlock:(ActionBlock)action{
    objc_setAssociatedObject(self, &overviewKey, action, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(callActionBlock:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)callActionBlock:(id)sender {
    ActionBlock block = (ActionBlock)objc_getAssociatedObject(self, &overviewKey);
    if (block) {
        block(sender);
    }
}
@end
