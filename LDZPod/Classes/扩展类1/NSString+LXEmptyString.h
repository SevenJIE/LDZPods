//
//  NSString+LXEmptyString.h
//  GoodLuck
//
//  Created by 冠东 陈 on 15/9/8.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Foundation/Foundation.h>

@interface NSString (LXEmptyString)


/**
 *  小写
 *
 *  @
 */
- (NSString *)lowercaseFirstCharacter;

/**
 *  大写
 *
 *  @
 */
- (NSString *)uppercaseFirstCharacter;

/**
 *  除空
 *
 *  @
 */
- (NSString *)trim;

/**
 *  是否是有效手机格式
 *
 *  @
 */
- (BOOL)isValidMobileNumber;

/**
 *  是否是有效邮箱格式
 *
 邮箱
 *
 *  @
 */
-(BOOL)isValidEmail;


- (NSURL *)toUrl;


/**
 *  判断文字是否为空
 */
- (BOOL)isEmpty;
// 判断输入的密码
-(BOOL)checkPassword;
/**
 *  根据字体大计算高度
 *
 *  @param fontSize 字体大小
 *  @param width    控件宽度
 *
 *  @ 高度
 */
- (CGFloat)heightForSizeWithFont:(UIFont *)fontSize andWidth:(float)width;

/**
 *  根据字体大戏计算宽度
 *
 *  @param fontSize 字体大小
 *  @param height   控件高度
 *
 *  @ 宽度
 */
- (CGFloat)widthForSizeFont:(UIFont *)fontSize andHeight:(float)height;

/**
 *  jason字符串转化
 *
 *  @ 返回的json数据
 */
- (NSDictionary *)jsonValue;

/**
 *  字符串是否为空
 *
 *  @
 */
- (BOOL)isNotBlank;
/**
 *  动态计算文字的宽高（单行）
 *
 *  @param font 文字的字体
 *
 *  @return 计算的宽高
 */
- (CGSize)mh_sizeWithFont:(UIFont *)font;


/**
 *  动态计算文字的宽高（多行）
 *
 *  @param font 文字的字体
 *  @param limitSize 限制的范围
 *
 *  @return 计算的宽高
 */
- (CGSize)mh_sizeWithFont:(UIFont *)font limitSize:(CGSize)limitSize;

/**
 *  动态计算文字的宽高（多行）
 *
 *  @param font 文字的字体
 *
 *  @return 计算的宽高
 */
- (CGSize)mh_sizeWithFont:(UIFont *)font limitWidth:(CGFloat)limitWidth;

/**
 根据传入字体大小，行间距返回CGSize
 */
+ (CGSize)dc_sizeWithText:(NSString *)text WithTextFont:(UIFont *)textFont WithMaxW:(CGFloat)maxW WithLineSpacing:(CGFloat)lineSpacing;
/**
 根据传入字体大小，行间距返回NSMutableAttributedString
 */
+ (NSMutableAttributedString *)dc_attributedStringWithText:(NSString *)text WithTextFont:(UIFont *)textFont WithLineSpacing:(CGFloat)lineSpacing;

+ (NSDate *)dateFromString:(NSString *)str;

+ (NSString *)stringFromDate:(NSDate *)date;


- (NSString *)encodedURLParameterString;
- (NSString*)decodeURLString;

- (NSString *)md5;
- (int)actualLength;

-(NSString *)MD5ForUpper32Bate:(NSString *)str;

-(NSString *)MD5ForUpper16Bate:(NSString *)str;

+(NSString *)timeStampConversionNSString:(NSString *)timeStamp;
// 字典转json字符串方法
+(NSString *)convertToJsonData:(NSDictionary *)dict;
// JSON字符串转化为字典
+(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
//距离处理
+(NSString *)handleDistance:(NSString*)mile;
//Decimal 价格丢失问题
+(NSString *)reviseString:(NSString*)string;
//Decimal 向下取整
+(NSString *)reviseFloorString:(NSString*)string;
//Decimal 向上取整
+(NSString *)reviseCeilString:(NSString*)string;
//Decimal 四舍五入
+(NSString *)reviseRoundString:(NSString*)string;
//电话号隐藏处理
+(NSString*)handlePhoneWith:(NSString*)mobileNum;
//图片压缩
+(NSMutableArray*)handdlePicWithPics:(NSMutableArray*)pics;
//判断有没在今天的某个时间段内
- (BOOL)isBetweenFromHour:(NSInteger)fromHour toHour:(NSInteger)toHour;

//转换时间 带时分秒
+ (NSString *)formateDate:(NSString *)dateString withFormate:(NSString *)formate;
//转换时间不带时分秒
+ (NSString *)formateNoHHMMDate:(NSString *)dateString withFormate:(NSString *) formate;
//判断某个日期是否大于本天
+ (BOOL)formatMoreThanTodayHHMMDate:(NSString *)dateString;

+ (int)getweekDayStringWithDate:(NSDate *) date;

+(NSString *)handlePicString:(NSString*)url;
//竖排文字
- (NSString *)VerticalString;
//字典转字符串
+(NSString*)jsonDicToString:(NSDictionary*)dic;
//日期比较
+(int)compareDate:(NSString*)startDate withDate:(NSString*)endDate;
//将汉字转换成拼音
+ (NSString *)convertNameToCharactor:(NSString *)name;
//截取拼音的首字母
+ (NSString *)extractFirstABCWithCharactor:(NSString *)name;

@end
