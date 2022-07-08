//
//  NSString+MDCNEmojiUnicode.h
//  MDCNProject
//
//  Created by apple on 2018/4/14.
//  Copyright © 2018年 com.ruanmengapp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MDCNEmojiUnicode)
+ (NSString *)replaceUnicode:(NSString *)unicodeStr;
+ (BOOL)isContainsTwoEmoji:(NSString *)string;
@end
