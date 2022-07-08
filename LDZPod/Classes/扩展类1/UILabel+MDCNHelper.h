//
//  UILabel+MDCNHelper.h
//  healthyCommunity
//
//  Created by Apple on 2018/9/3.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (MDCNHelper)
/**
 *  字间距
 */
@property (nonatomic,assign)CGFloat characterSpace;

/**
 *  行间距
 */
@property (nonatomic,assign)CGFloat lineSpace;

/**
 *  关键字
 */
@property (nonatomic,copy)NSString *keywords;
@property (nonatomic,strong)UIFont *keywordsFont;
@property (nonatomic,strong)UIColor *keywordsColor;

/**
 *  下划线
 */
@property (nonatomic,copy)NSString *underlineStr;
@property (nonatomic,strong)UIColor *underlineColor;

/**
 *  计算label宽高，必须调用
 *
 *  @param maxWidth 最大宽度
 *
 *  @return label的size
 */
- (CGSize)getLableSizeWithMaxWidth:(CGFloat)maxWidth;
/**
 label 两端对齐
 */
- (void)changeAlignmentRightAndLeft;
/**
 label 两端对齐指定宽度

 @param labelWidth  label的宽度
 */
- (void)changeAlignmentRightAndLeftWithLabelWidth:(CGFloat)labelWidth;
@end
