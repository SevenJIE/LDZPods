//
//  UIApplication+MDCNHelper.m
//  HuaYiHuangCheng
//
//  Created by 芦 on 2022/7/7.
//  Copyright © 2022 lixinkeji. All rights reserved.
//

#import "UIApplication+MDCNHelper.h"

@implementation UIApplication (MDCNHelper)

- (NSString *)documentsPath {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

- (NSString *)appBundleName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
}

- (NSString *)appBundleID {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
}

- (NSString *)appVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];
}

- (NSString *)appBuildVersion {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];
}


+ (BOOL)isAppExtension {
    static BOOL isAppExtension = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class cls = NSClassFromString(@"UIApplication");
        if(!cls || ![cls respondsToSelector:@selector(sharedApplication)]) isAppExtension = YES;
        if ([[[NSBundle mainBundle] bundlePath] hasSuffix:@".appex"]) isAppExtension = YES;
    });
    return isAppExtension;
}

+ (nullable UIApplication *)sharedExtensionApplication {
#pragma clang diagnostic push
#pragma clang dianostic ignored "-Wundeclared-selector"
    return [self isAppExtension] ? nil : [UIApplication performSelector:@selector(sharedApplication)]; /*MetaClass instance*/
#pragma clang diagnostic pop
}

+ (void)openURLScheme:(NSString *)URL {
    NSURL *localURL = [NSURL URLWithString:URL];
    if ([[self sharedApplication] canOpenURL:localURL]) {
        [[self sharedApplication] openURL:localURL];
    }
}

@end
