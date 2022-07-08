//
//  NSString+LXEmptyString.m
//  GoodLuck
//
//  Created by 冠东 陈 on 15/9/8.
//  Copyright (c) 2015年 郑州立信科技. All rights reserved.
//

#import "NSString+LXEmptyString.h"

#import <CommonCrypto/CommonDigest.h>

@implementation NSString (LXEmptyString)


- (NSString *)lowercaseFirstCharacter {
    NSRange range = NSMakeRange(0, 1);
    NSString *lowerFirstCharacter = [[self substringToIndex:1] lowercaseString];
    return [self stringByReplacingCharactersInRange:range withString:lowerFirstCharacter];
}

- (NSString *)uppercaseFirstCharacter {
    NSRange range = NSMakeRange(0, 1);
    NSString *upperFirstCharacter = [[self substringToIndex:1] uppercaseString];
    return [self stringByReplacingCharactersInRange:range withString:upperFirstCharacter];
}

- (NSString *)trim {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)trimTheExtraSpaces {
    NSCharacterSet *whitespaces = [NSCharacterSet whitespaceCharacterSet];
    NSPredicate *noEmptyStrings = [NSPredicate predicateWithFormat:@"SELF != ''"];
    NSArray *parts = [self componentsSeparatedByCharactersInSet:whitespaces];
    NSArray *filteredArray = [parts filteredArrayUsingPredicate:noEmptyStrings];
    return [filteredArray componentsJoinedByString:@" "];
}

- (BOOL)isValidMobileNumber {
    NSString *Regex = @"(1[346578])\\d{9}";
    NSPredicate *mobileTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", Regex];
    return [mobileTest evaluateWithObject:self];
}


-(BOOL)isValidEmail {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@",emailRegex];
    return [emailTest evaluateWithObject:self];
}
#pragma mark 判断输入的密码
-(BOOL)checkPassword
{
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:self];
}


- (NSURL *)toUrl {
    return [NSURL URLWithString:self];
}



- (NSString *)trimWhitespace {
    NSMutableString *str = [self mutableCopy];
    CFStringTrimWhitespace((__bridge CFMutableStringRef) str);
    return str;
}

- (BOOL)isEmpty {
    return [[self trimWhitespace] isEqualToString:@""];
}


- (CGFloat)heightForSizeWithFont:(UIFont *)fontSize andWidth:(float)width {
    NSDictionary *attribute = @{NSFontAttributeName : fontSize};
    CGSize textSize = [self boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return textSize.height;
}

- (CGFloat)widthForSizeFont:(UIFont *)fontSize andHeight:(float)height {
    NSDictionary *attribute = @{NSFontAttributeName : fontSize};
    CGSize textSize = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
    return textSize.width;
}

- (NSDictionary *)jsonValue {
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:nil];
    return dic;
}

/**
 根据传入字体大小，行间距返回CGSize
 */
+ (CGSize)dc_sizeWithText:(NSString *)text WithTextFont:(UIFont *)textFont WithMaxW:(CGFloat)maxW WithLineSpacing:(CGFloat)lineSpacing {
    if (![text isNotEmptyNSString] ) {
        return  CGSizeZero;
    }
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentJustified;
    [paragraphStyle setLineSpacing:lineSpacing];
    //    [paragraphStyle setLineBreakMode:NSLineBreakByCharWrapping];
    CGSize size = [text boundingRectWithSize:CGSizeMake(maxW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:textFont, NSParagraphStyleAttributeName:paragraphStyle} context:nil].size;
    
    return size;
    
}


/**
 根据传入字体大小，行间距返回NSMutableAttributedString
 */
+ (NSMutableAttributedString *)dc_attributedStringWithText:(NSString *)text WithTextFont:(UIFont *)textFont WithLineSpacing:(CGFloat)lineSpacing {
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentJustified;
    //paragraphStyle.firstLineHeadIndent = 28;
    [paragraphStyle setLineSpacing:lineSpacing];
    
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    return attributedString;
    
}

+ (NSDate *)dateFromString:(NSString *)str {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    NSDate *destDate= [dateFormatter dateFromString:str];
    return destDate;
}

+ (NSString *)stringFromDate:(NSDate *)date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息。
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *destDateString = [dateFormatter stringFromDate:date];
    return destDateString;
}

- (BOOL)isNotBlank {
    NSCharacterSet *blank = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    for (NSInteger i = 0; i < self.length; ++i) {
        unichar c = [self characterAtIndex:i];
        if (![blank characterIsMember:c]) {
            return YES;
        }
    }
    return NO;
}
/**
 *  动态计算文字的宽高（单行）
 *  @param font 文字的字体
 *  @return 计算的宽高
 */
- (CGSize)mh_sizeWithFont:(UIFont *)font
{
    CGSize theSize;
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    theSize = [self sizeWithAttributes:attributes];
    // 向上取整
    theSize.width = ceil(theSize.width);
    theSize.height = ceil(theSize.height);
    return theSize;
}


- (CGSize)mh_sizeWithFont:(UIFont *)font limitSize:(CGSize)limitSize
{
    CGSize theSize;
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    CGRect rect = [self boundingRectWithSize:limitSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil];
    theSize.width = ceil(rect.size.width);
    theSize.height = ceil(rect.size.height);
    return theSize;
}


- (CGSize)mh_sizeWithFont:(UIFont *)font limitWidth:(CGFloat)limitWidth
{
    return [self mh_sizeWithFont:font limitSize:CGSizeMake(limitWidth, MAXFLOAT)];
}


- (NSString *)encodedURLParameterString
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                             (CFStringRef)self,
                                                                                             NULL,
                                                                                             CFSTR(":/=,!$&'()*+;[]@#?"),
                                                                                             kCFStringEncodingUTF8));
    
    
    
    return result;
}

- (NSString*)decodeURLString
{
    //处理空格
    NSString *result_plus = [self stringByReplacingOccurrencesOfString:@"+" withString:@"%20"];
    
    NSString* result = (NSString *)CFBridgingRelease(CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (CFStringRef)result_plus, CFSTR(""), kCFStringEncodingUTF8));
    //[NSString stringByAddingPercentEncodingWithAllowedCharacters:]
    //self stringByAddingPercentEncodingWithAllowedCharacters:
    return result;
}

- (NSString *)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

#pragma mark - 32位 小写
-(NSString *)MD5ForUpper32Bate:(NSString *)str{
    
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    
    return digest;
}

#pragma mark - 16位 小写
-(NSString *)MD5ForUpper16Bate:(NSString *)str{
    
    NSString *md5Str = [self MD5ForUpper32Bate:str];
    
    NSString *string;
    for (int i=0; i<24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
    }
    return string;
}
+(NSString *)timeStampConversionNSString:(NSString *)timeStamp
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStamp longLongValue]/1000];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateStr = [formatter stringFromDate:date];
    return dateStr;
}
// 字典转json字符串方法
+(NSString *)convertToJsonData:(NSDictionary *)dict

{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}
// JSON字符串转化为字典
+(NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

//距离处理
+(NSString *)handleDistance:(NSString*)mile{
    if ([mile floatValue]<1000) {
        return  [NSString stringWithFormat:@"%@m",mile];
    }
    return [NSString stringWithFormat:@"%.1fkm",[mile floatValue]/1000];
}

//Decimal 价格丢失问题
+(NSString *)reviseString:(NSString*)string{
    /* 直接传入精度丢失有问题的Double类型*/
    double conversionValue        = (double)[string floatValue];//可去掉小数点后多余的0
    NSString *doubleString        = [NSString stringWithFormat:@"%.2lf", conversionValue];
    NSDecimalNumber *decNumber    = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber stringValue];
}


//Decimal 向下取整
+(NSString *)reviseFloorString:(NSString*)string{
    /* 直接传入精度丢失有问题的Double类型*/
    double conversionValue        = (double)[string floatValue];//可去掉小数点后多余的0
    double floorValue =  floor(conversionValue*100)/100;
    NSString *doubleString        = [NSString stringWithFormat:@"%.2lf", floorValue];
    NSDecimalNumber *decNumber    = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber stringValue];
}
//Decimal 向上取整
+(NSString *)reviseCeilString:(NSString*)string{
    /* 直接传入精度丢失有问题的Double类型*/
    double conversionValue        = (double)[string floatValue];//可去掉小数点后多余的0
    double floorValue =  ceil(conversionValue*100)/100;
    NSString *doubleString        = [NSString stringWithFormat:@"%.2lf", floorValue];
    NSDecimalNumber *decNumber    = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber stringValue];
}
//Decimal 四舍五入
+(NSString *)reviseRoundString:(NSString*)string{
    /* 直接传入精度丢失有问题的Double类型*/
    double conversionValue        = (double)[string floatValue];//可去掉小数点后多余的0
    double floorValue =  round(conversionValue*100)/100;
    NSString *doubleString        = [NSString stringWithFormat:@"%.2lf", floorValue];
    NSDecimalNumber *decNumber    = [NSDecimalNumber decimalNumberWithString:doubleString];
    return [decNumber stringValue];
}


//电话号隐藏处理
+(NSString*)handlePhoneWith:(NSString*)mobileNum{
    NSString * handleResult = [mobileNum stringByReplacingOccurrencesOfString:[mobileNum substringWithRange:NSMakeRange(3,4)]withString:@"****"];
    return handleResult;
}
//图片压缩
+(NSMutableArray*)handdlePicWithPics:(NSMutableArray*)pics{
    NSMutableArray * picsData = @[].mutableCopy;
    for (UIImage * image in pics) {
        NSData *imageData = UIImageJPEGRepresentation(image, 0.1f);
        [picsData addObject:imageData];
    }
    return picsData;
}


- (BOOL)isBetweenFromHour:(NSInteger)fromHour toHour:(NSInteger)toHour
{
    NSDate *dateFrom = [self getCustomDateWithHour:fromHour];
    NSDate *dateTo = [self getCustomDateWithHour:toHour];
    NSDate *currentDate = [NSDate date];
    if ([currentDate compare:dateFrom]==NSOrderedDescending && [currentDate compare:dateTo]==NSOrderedAscending)
    {
        showAlert(@"在时间段内！");
        return YES;
    }
    else
    {
        showAlert(@"不在时间段内！");
        return NO;
    }
}

- (NSDate *)getCustomDateWithHour:(NSInteger)hour
{
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
    //设置当天的某个点
    NSDateComponents *resultComps = [[NSDateComponents alloc] init];
    [resultComps setYear:[currentComps year]];
    [resultComps setMonth:[currentComps month]];
    [resultComps setDay:[currentComps day]];
    [resultComps setHour:hour];
    NSCalendar *resultCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    return [resultCalendar dateFromComponents:resultComps];
}


//转换时间 带时分秒
+ (NSString *)formateDate:(NSString *)dateString withFormate:(NSString *)formate
{
    @try {
        
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:formate];
        
        NSDate * nowDate = [NSDate date];
        
        //  将需要转换的时间转换成 NSDate 对象
        NSDate * needFormatDate = [dateFormatter dateFromString:dateString];
        //  取当前时间和转换时间两个日期对象的时间间隔
        //  这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:  typedef double NSTimeInterval;
        NSTimeInterval time = [nowDate timeIntervalSinceDate:needFormatDate];
        // 再然后，把间隔的秒数折算成天数和小时数：
        NSString *dateStr = @"";
        if (time < 0) {
            if (time >= -60*60*24) {
                dateStr = @"明天";
                [dateFormatter setDateFormat:@"YYYY/MM/dd"];
                NSString * need_yMd = [dateFormatter stringFromDate:needFormatDate];
                NSString *now_yMd = [dateFormatter stringFromDate:nowDate];
                
                [dateFormatter setDateFormat:@"HH:mm"];
                if ([need_yMd isEqualToString:now_yMd]) {
                    //在同一天
                    dateStr = [NSString stringWithFormat:@"今天 %@",[dateFormatter stringFromDate:needFormatDate]];
                }else{
                    //明天天
                    dateStr = [NSString stringWithFormat:@"明天 %@",[dateFormatter stringFromDate:needFormatDate]];
                }
            }else{
                [dateFormatter setDateFormat:@"yyyy"];
                NSString * yearStr = [dateFormatter stringFromDate:needFormatDate];
                NSString *nowYear = [dateFormatter stringFromDate:nowDate];
                
                if ([yearStr isEqualToString:nowYear]) {
                    ////  在同一年
                    [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
                    dateStr = [dateFormatter stringFromDate:needFormatDate];
                }else{
                    [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
                    dateStr = [dateFormatter stringFromDate:needFormatDate];
                }
            }
        }
        else if (time<=60) {  //// 1分钟以内的
            dateStr = @"刚刚";
        }else if(time<=60*60){  ////  一个小时以内的
            
            int mins = time/60;
            dateStr = [NSString stringWithFormat:@"%d分钟前",mins];
            
        }else if(time<=60*60*24){   //// 在两天内的
            
            [dateFormatter setDateFormat:@"YYYY/MM/dd"];
            NSString * need_yMd = [dateFormatter stringFromDate:needFormatDate];
            NSString *now_yMd = [dateFormatter stringFromDate:nowDate];
            
            [dateFormatter setDateFormat:@"HH:mm"];
            if ([need_yMd isEqualToString:now_yMd]) {
                //// 在同一天
                dateStr = [NSString stringWithFormat:@"今天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }else{
                ////  昨天
                dateStr = [NSString stringWithFormat:@"昨天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }
        }else {
            
            [dateFormatter setDateFormat:@"yyyy"];
            NSString * yearStr = [dateFormatter stringFromDate:needFormatDate];
            NSString *nowYear = [dateFormatter stringFromDate:nowDate];
            
            if ([yearStr isEqualToString:nowYear]) {
                ////  在同一年
                [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }else{
                [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }
        }
        
        return dateStr;
        
        
    } @catch (NSException *exception) {
        return @"";
    }
}

//转换时间不带时分秒
+ (NSString *)formateNoHHMMDate:(NSString *)dateString withFormate:(NSString *) formate{
    @try {
        
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:formate];
        
        NSDate * nowDate = [NSDate date];
        
        //  将需要转换的时间转换成 NSDate 对象
        NSDate * needFormatDate = [dateFormatter dateFromString:dateString];
        //  取当前时间和转换时间两个日期对象的时间间隔
        //  这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:  typedef double NSTimeInterval;
        NSTimeInterval time = [nowDate timeIntervalSinceDate:needFormatDate];
        // 再然后，把间隔的秒数折算成天数和小时数：
        NSString *dateStr = @"";
        if (time < 0) {
            if (time >= -60*60*24) {
                dateStr = @"明天";
                [dateFormatter setDateFormat:@"YYYY/MM/dd"];
                NSString * need_yMd = [dateFormatter stringFromDate:needFormatDate];
                NSString *now_yMd = [dateFormatter stringFromDate:nowDate];
                
                [dateFormatter setDateFormat:@"HH:mm"];
                if ([need_yMd isEqualToString:now_yMd]) {
                    //在同一天
                    dateStr = [NSString stringWithFormat:@"今天 %@",[dateFormatter stringFromDate:needFormatDate]];
                }else{
                    //明天天
                    dateStr = [NSString stringWithFormat:@"明天 %@",[dateFormatter stringFromDate:needFormatDate]];
                }
            }else{
                [dateFormatter setDateFormat:@"yyyy"];
                NSString * yearStr = [dateFormatter stringFromDate:needFormatDate];
                NSString *nowYear = [dateFormatter stringFromDate:nowDate];
                
                if ([yearStr isEqualToString:nowYear]) {
                    ////  在同一年
                    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
                    dateStr = [dateFormatter stringFromDate:needFormatDate];
                }else{
                    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
                    dateStr = [dateFormatter stringFromDate:needFormatDate];
                }
            }
        }
        else if (time<=60) {  //// 1分钟以内的
            dateStr = @"刚刚";
        }else if(time<=60*60){  ////  一个小时以内的
            
            int mins = time/60;
            dateStr = [NSString stringWithFormat:@"%d分钟前",mins];
            
        }else if(time<=60*60*24){   //// 在两天内的
            
            [dateFormatter setDateFormat:@"YYYY/MM/dd"];
            NSString * need_yMd = [dateFormatter stringFromDate:needFormatDate];
            NSString *now_yMd = [dateFormatter stringFromDate:nowDate];
            
            [dateFormatter setDateFormat:@"HH:mm"];
            if ([need_yMd isEqualToString:now_yMd]) {
                //// 在同一天
                dateStr = [NSString stringWithFormat:@"今天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }else{
                ////  昨天
                dateStr = [NSString stringWithFormat:@"昨天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }
        }else {
            
            [dateFormatter setDateFormat:@"yyyy"];
            NSString * yearStr = [dateFormatter stringFromDate:needFormatDate];
            NSString *nowYear = [dateFormatter stringFromDate:nowDate];
            
            if ([yearStr isEqualToString:nowYear]) {
                ////  在同一年
                [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }else{
                [dateFormatter setDateFormat:@"yyyy年MM月dd日"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }
        }
        
        return dateStr;
        
        
    } @catch (NSException *exception) {
        return @"";
    }
}

//判断某个日期是否大于本天
+ (BOOL)formatMoreThanTodayHHMMDate:(NSString *)dateString{
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd"];
    NSDate * nowDate = [NSDate date];
    //  将需要转换的时间转换成 NSDate 对象
    NSDate * needFormatDate = [dateFormatter dateFromString:dateString];
    //  取当前时间和转换时间两个日期对象的时间间隔
    //  这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:  typedef double NSTimeInterval;
    NSTimeInterval time = [nowDate timeIntervalSinceDate:needFormatDate];
    if (time < 0) {
        return YES;
    }
    return NO;
}


+ (int)getweekDayStringWithDate:(NSDate *) date{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    // 指定日历的算法
    NSDateComponents *comps = [calendar components:NSWeekdayCalendarUnit fromDate:date];
    // 1 是周日，2是周一 3.以此类推
    NSNumber * weekNumber = @([comps weekday]);
    NSInteger weekInt = [weekNumber integerValue];
    int weekDayString = 1;
    switch (weekInt)
    {
        case 1:{weekDayString = 7;}
        break;
        case 2:{weekDayString = 1;}
        break;
        case 3:{weekDayString = 2;}
        break;
        case 4:{weekDayString = 3;}
        break;
        case 5:{weekDayString = 4;}
        break;
        case 6:{weekDayString = 5;}
        break;
        case 7:{weekDayString = 6;}
        break;
        default:break;
    }
    return weekDayString;
    
}


+(NSString *)handlePicString:(NSString*)url{
    if ([url hasPrefix:@"http"]) {
        return url;
    }
    return [[NSString stringWithFormat:@"%@%@",kIMgBaseUrl,url] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)VerticalString{
    NSMutableString * str = [[NSMutableString alloc] initWithString:self];
    NSInteger count = str.length;
    for (int i = 1; i < count; i ++) {
        [str insertString:@"\n" atIndex:i*2 - 1];
    }
    return str;
}


+(NSString*)jsonDicToString:(NSDictionary*)dic{
    
    //convert object to data
    
    NSError *error;
    
    NSData* jsonData =[NSJSONSerialization dataWithJSONObject:dic
                                                      options:NSJSONWritingPrettyPrinted error:&error];
    
    //print out the data contents
    return [[NSString alloc] initWithData:jsonData
                                 encoding:NSUTF8StringEncoding];
}

//日期比较
+(int)compareDate:(NSString*)startDate withDate:(NSString*)endDate{
    int ci;
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *dt1 = [[NSDate alloc] init];
    NSDate *dt2 = [[NSDate alloc] init];
    dt1 = [df dateFromString:startDate];
    dt2 = [df dateFromString:endDate];
    NSComparisonResult result = [dt1 compare:dt2];
    switch (result)
    {
            //date02比date01大
        case NSOrderedAscending: ci=1; break;
            //date02比date01小
        case NSOrderedDescending: ci=-1; break;
            //date02=date01
        case NSOrderedSame: ci=0; break;
        default: NSLog(@"erorr dates %@, %@", dt2, dt1); break;
    }
    return ci;
}

//将汉字转换成拼音
+ (NSString *)convertNameToCharactor:(NSString *)name
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:name];
    //先转换为带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);
    //转化为大写拼音
    NSString *pinYin = [str capitalizedString];
    //获取并返回首字母
    return pinYin;
}

//截取拼音的首字母
+ (NSString *)extractFirstABCWithCharactor:(NSString *)name{
    NSString * pinyin = [self convertNameToCharactor:name];
    if(pinyin.length > 0){
        return [pinyin substringWithRange:NSMakeRange(0, 1)];
    }
    return nil;
}

@end
