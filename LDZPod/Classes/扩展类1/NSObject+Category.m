//
//  NSObject+Category.m
//  LXScreenShot
//
//  Created by Leexin on 16/4/8.
//  Copyright © 2016年 Garden.Lee. All rights reserved.
//

#import "NSObject+Category.h"

@implementation NSObject (Category)

- (BOOL)isNotEmptyNSString {
    if (self != nil) {
        if ([self isKindOfClass:[NSString class]]) {
            if ([(NSString *)self length] > 0) {
                if ([(NSString *)self isEqualToString:@""]) {
                    return NO;
                }
                return YES;
            }
        }else{
            NSString *tempStr = [NSString stringWithFormat:@"%@",self];
            if (tempStr > 0) {
                if ([tempStr isEqualToString:@""]) {
                    return NO;
                }
                return YES;
            }
        }
    }
    return NO;
}

- (BOOL)isNotEmptyArray {
    
    if (self != nil && [self isKindOfClass:[NSArray class]] && [(NSArray *)self count] > 0) {
        return YES;
    }
    return NO;
}

- (BOOL)isNotEmptyDictionary {
    
    if (self != nil && [self isKindOfClass:[NSDictionary class]] && [(NSDictionary *)self count] > 0) {
        return YES;
    }
    return NO;
}

- (BOOL)isNotEmptyNSNumberOrNSString {
    
    if (self != nil && [self isKindOfClass:[NSNumber class]]) {
        return YES;
    }
    else if (self != nil && [self isNotEmptyNSString]) {
        return YES;
    }
    return NO;
}



@end

