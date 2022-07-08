//
//  MDTimeObject.m
//  MDCNCocoaPods
//
//  Created by Apple on 2018/11/30.
//  Copyright © 2018年 MDCN. All rights reserved.
//

#import "MDTimeObject.h"

static NSString *defaultDateFormatter = @"yyyy-MM-dd HH:mm:ss";

@implementation MDTimeObject

#pragma mark -------------------- 获取当前时间戳
+ (NSString *)getCurrentTimeTimestampIsMillisecond:(BOOL)millisecond{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone systemTimeZone];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    NSString *timeSp = @"";
    if (millisecond) {
       timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]*1000];
    }else{
        timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    }
    return timeSp;
}

#pragma mark -------------------- 获取当前时间
+ (NSString *)getCurrentTime{
    return [MDTimeObject getCurrentTimeWithDateFormatter:defaultDateFormatter];
}
+ (NSString *)getCurrentTimeWithDateFormatter:(NSString *)dateFormat{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    NSLog(@"currentTimeString =  %@",currentTimeString);
    return currentTimeString;
}
#pragma mark -------------------- 获取距离现在过去了多久
+ (NSString *)getPastTimeWithTimeStr:(NSString *)timeStr{
    return [MDTimeObject getPastTimeWithTimeStr:timeStr WithDateFormatter:defaultDateFormatter];
}
+ (NSString *)getPastTimeWithTimeStr:(NSString *)timeStr WithDateFormatter:(NSString *)dateFormat{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    
    NSDate *newsDateFormatted = [dateFormatter dateFromString:timeStr];
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    [dateFormatter setTimeZone:timeZone];
    
    NSDate* current_date = [[NSDate alloc] init];
    NSInteger tempTime = (NSInteger)[current_date timeIntervalSinceDate:newsDateFormatted];
    NSInteger year = tempTime / (3600 * 24 * 30 * 12);
    NSInteger month = tempTime / (3600 * 24 * 30);
    NSInteger days = tempTime / (3600 * 24);
    NSInteger hours = tempTime % (3600 *24 ) / 3600;
    NSInteger minute = tempTime % (3600*24) / 60;
    NSInteger second = tempTime % 60;
    NSString *dateContent;
    if ( year !=0 ){
        dateContent = [NSString stringWithFormat:@"%ld年前",year];
    } else if ( month !=0 ){
        dateContent = [NSString stringWithFormat:@"%ld个月前",month];
    }else if ( days != 0 ){
        dateContent = [NSString stringWithFormat:@"%ld天前",days];
    }else if ( hours != 0 ){
        dateContent = [NSString stringWithFormat:@"%ld小时前",hours];
    }else if ( minute != 0 ){
        dateContent = [NSString stringWithFormat:@"%ld分钟前",minute];
    }else{
        dateContent = [NSString stringWithFormat:@"%ld秒前",second];
    }
    return dateContent;
}
+ (NSString *)getPastTimeWithTimeTimestamp:(NSString *)timestamp{
    NSTimeInterval pastTimeStamp = [timestamp doubleValue];
    NSTimeInterval currentTimeStamp = [[MDTimeObject getCurrentTimeTimestampIsMillisecond:NO] doubleValue];
    NSInteger tempTime = currentTimeStamp - pastTimeStamp;
    NSInteger year = tempTime / (3600 * 24 * 30 * 12);
    NSInteger month = tempTime / (3600 * 24 * 30);
    NSInteger days = tempTime / (3600 * 24);
    NSInteger hours = tempTime % (3600 *24 ) / 3600;
    NSInteger minute = tempTime % (3600*24) / 60;
    NSInteger second = tempTime % 60;
    NSString *dateContent;
    if ( year !=0 ){
        dateContent = [NSString stringWithFormat:@"%ld年前",year];
    } else if ( month !=0 ){
        dateContent = [NSString stringWithFormat:@"%ld个月前",month];
    }else if ( days != 0 ){
        dateContent = [NSString stringWithFormat:@"%ld天前",days];
    }else if ( hours != 0 ){
        dateContent = [NSString stringWithFormat:@"%ld小时前",hours];
    }else if ( minute != 0 ){
        dateContent = [NSString stringWithFormat:@"%ld分钟前",minute];
    }else{
        dateContent = [NSString stringWithFormat:@"%ld秒前",second];
    }
    return dateContent;
    
    
}
#pragma mark -------------------- 时间转换
//Date转换成字符串
+ (NSString *)changeDateToTimeStrWithDate:(NSDate *)timeDate{
    return [MDTimeObject changeDateToTimeStrWithDate:timeDate WithDateFormatter:defaultDateFormatter];
}
+ (NSString *)changeDateToTimeStrWithDate:(NSDate *)timeDate WithDateFormatter:(NSString *)dateFormat{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    [dateFormatter setDateFormat:dateFormat];
    
    NSString *timeStr = [dateFormatter stringFromDate:timeDate];
    
    return timeStr;
}
//字符串转换成Date
+ (NSDate *)changeTimeStrToDateWithTimeStr:(NSString *)timeStr{
    return [MDTimeObject changeTimeStrToDateWithTimeStr:timeStr WithDateFormatter:defaultDateFormatter];
}
+ (NSDate *)changeTimeStrToDateWithTimeStr:(NSString *)timeStr WithDateFormatter:(NSString *)dateFormat{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
    [dateFormatter setDateFormat:dateFormat];
    return [dateFormatter dateFromString:timeStr];
}
#pragma mark -------------------- 日期比较
+ (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay{
    NSString *dateFormat = defaultDateFormatter;
    return [MDTimeObject compareOneDay:oneDay withAnotherDay:anotherDay WithDateFormat:dateFormat];
}
+ (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay WithDateFormat:(nonnull NSString *)dateFormat{
    if ([dateFormat isEmptyString]) {
        dateFormat = defaultDateFormatter;
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateFormat];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    if (result == NSOrderedDescending) {
        //前者时间比后者时间长
        return 1;
    }else if (result == NSOrderedAscending){
        //前者时间比后者时间短
        return -1;
    }else{
        //两个时间相等.
        return 0;
    }
}
+ (int)compareOneDayStr:(NSString *)oneDayStr withAnotherDayStr:(NSString *)anotherDayStr{
    NSDate *dateA = [MDTimeObject changeTimeStrToDateWithTimeStr:oneDayStr];
    NSDate *dateB = [MDTimeObject changeTimeStrToDateWithTimeStr:anotherDayStr];
    return [MDTimeObject compareOneDay:dateA withAnotherDay:dateB];
    return [MDTimeObject compareOneDayStr:oneDayStr withAnotherDayStr:anotherDayStr WithDateFormat:defaultDateFormatter];
}
+ (int)compareOneDayStr:(NSString *)oneDayStr withAnotherDayStr:(NSString *)anotherDayStr WithDateFormat:(NSString *)dateFormat{
    if ([dateFormat isEmptyString]) {
        dateFormat = defaultDateFormatter;
    }
    NSDate *dateA = [MDTimeObject changeTimeStrToDateWithTimeStr:oneDayStr WithDateFormatter:dateFormat];
    NSDate *dateB = [MDTimeObject changeTimeStrToDateWithTimeStr:anotherDayStr WithDateFormatter:dateFormat];
    return [MDTimeObject compareOneDay:dateA withAnotherDay:dateB WithDateFormat:dateFormat];
}
+ (NSComparisonResult)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay WithUnitGranularity:(NSCalendarUnit)unit{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return [calendar compareDate:oneDay toDate:anotherDay toUnitGranularity:unit];
}
@end
