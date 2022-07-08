//
//  UIApplication+MDCNHelper.h
//  HuaYiHuangCheng
//
//  Created by 芦 on 2022/7/7.
//  Copyright © 2022 lixinkeji. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (MDCNHelper)


/// Application's Documents path.
@property (nonatomic, readonly) NSString *documentsPath;

/// Application's Bundle Name.
@property (nonnull, nonatomic, readonly) NSString *appBundleName;

/// Application's Bundle ID. e.g. "com.idea-link.app.abc"
@property (nonnull, nonatomic, readonly) NSString *appBundleID;

/// Application's Version. e.g. "1.1.0"
@property (nonnull, nonatomic, readonly) NSString *appVersion;

/// Application's Bundle Version. e.g. "123"
@property (nonnull, nonatomic, readonly) NSString *appBuildVersion;

/// Returns YES in App Extension.
+ (BOOL)isAppExtension;

/// Same as sharedApplication, but returns nil in App Extension.
+ (nullable UIApplication *)sharedExtensionApplication;

/// Opens URL scheme. e.g. Open WI-FI (prefs:root=WIFI)
+ (void)openURLScheme:(NSString *)URL;

@end

NS_ASSUME_NONNULL_END
