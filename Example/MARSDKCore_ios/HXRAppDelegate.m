//
//  HXRAppDelegate.m
//  MARSDKCore_ios
//
//  Created by izhigang6@163.com on 04/28/2022.
//  Copyright (c) 2022 izhigang6@163.com. All rights reserved.
//

#import "HXRAppDelegate.h"
#import <MARSDKCore/MARAnalytics.h>
#import <MARSDKCore/MARSDK+AppDelegate.h>

@interface HXRAppDelegate () <MARSDKDelegate>

@end
@implementation HXRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 初始化
    NSDictionary *sdkconfig = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"MARSDK"];
    [[MARSDK sharedInstance] initWithParams:sdkconfig];
    [[MARSDK sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    [[MARAnalytics sharedInstance] startLevel:@"1"];
    [[MARSDK sharedInstance] setDelegate:self];

    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [[MARSDK sharedInstance] application:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo
{
    [[MARSDK sharedInstance] application:application didReceiveRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)application
    didReceiveRemoteNotification:(NSDictionary *)userInfo
          fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    [[MARSDK sharedInstance] application:application didReceiveRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    [[MARSDK sharedInstance] application:application didReceiveLocalNotification:notification];
}

- (void)applicationWillResignActive:(UIApplication *)application
{

    /* Sent when the application is about to move from active to inactive state.
     * This can occur for certain types of temporary interruptions (such as an
     * incoming phone call or SMS message) or when the user quits the
     * application and it begins the transition to the background state.
     */
    // Use this method to pause ongoing tasks, disable timers, and throttle down
    // OpenGL ES frame rates. Games should use this method to pause the game.
    [[MARSDK sharedInstance] applicationWillResignActive:application];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate
    // timers, and store enough application state information to restore your
    // application to its current state in case it is terminated later. If your
    // application supports background execution, this method is called instead
    // of applicationWillTerminate: when the user quits.
    [[MARSDK sharedInstance] applicationDidEnterBackground:application];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive
    // state; here you can undo many of the changes made on entering the
    // background.
    NSLog(@"application will enter foreground...");
    [[MARSDK sharedInstance] applicationWillEnterForeground:application];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the
    // application was inactive. If the application was previously in the
    // background, optionally refresh the user interface.
    [[MARSDK sharedInstance] applicationDidBecomeActive:application];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if
    // appropriate. See also applicationDidEnterBackground:.
    [[MARSDK sharedInstance] applicationWillTerminate:application];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{

    return [[MARSDK sharedInstance] application:application handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application
              openURL:(NSURL *)url
    sourceApplication:(NSString *)sourceApplication
           annotation:(id)annotation
{

    return [[MARSDK sharedInstance] application:application
                                        openURL:url
                              sourceApplication:sourceApplication
                                     annotation:annotation];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *, id> *)options
{
    return [[MARSDK sharedInstance] application:app openURL:url options:options];
}

// 获取当前视图
- (UIView *)GetView
{

    return [self GetViewController].view;
}
// 获取当前ViewController
- (UIViewController *)GetViewController
{

    return self.window.rootViewController;
}

// 登录成功回调
- (void)OnUserLogin:(NSDictionary *)param
{
    NSLog(@"OnUserLogin = %@", param);
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:[param objectForKey:@"token"] forKey:@"token"];
    [userDefaults setObject:[param objectForKey:@"userId"] forKey:@"userId"];
}

// 登出成功回调
- (void)OnUserLogout:(NSDictionary *)param
{
    NSLog(@"OnUserLogout====%@", param);
}
// 支付成功回调
- (void)OnPayPaid:(NSDictionary *)param
{
    NSLog(@"OnPayPaid====%@", param);
}

// 支付成功回调
- (void)OnPlatformInit:(NSDictionary *)param
{

    NSLog(@"OnPlatformInit====%@", param);
}

@end
