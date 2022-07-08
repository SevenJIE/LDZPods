//
//  NSNull+MDCNHelper.m
//  MDCNProject
//
//  Created by apple on 2018/4/14.
//  Copyright © 2018年 com.ruanmengapp. All rights reserved.
//

#import "NSNull+MDCNHelper.h"

@implementation NSNull (MDCNHelper)
-(double)doubleValue{
    return 0.0;
}
-(int )intValue{
    return 0;
}
-(float)floatValue{
    return 0.0;
}
-(NSInteger)integerValue{
    return 0;
}
-(NSString *)nullStrimgValue{
    return @"";
}
@end
