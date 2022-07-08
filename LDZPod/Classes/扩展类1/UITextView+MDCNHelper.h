//
//  UITextView+MDCNHelper.h
//  MDCNProject
//
//  Created by apple on 2018/4/14.
//  Copyright © 2018年 com.ruanmengapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (MDCNHelper)
@property (nonatomic, readonly) UILabel *placeholderLabel;
@property (nonatomic, strong) IBInspectable NSString *placeholder;
@property (nonatomic, strong) NSAttributedString *attributedPlaceholder;
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;

+ (UIColor *)defaultPlaceholderColor;
/**
 *  限制字数
 */
-(void)setMaxLength:(NSInteger)maxlength;
@end
