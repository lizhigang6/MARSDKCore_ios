//
//  MARStoreKit.h
//  MARSDKCore
//
//  Created by 李志刚 on 2022/5/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MARStoreKit : NSObject
/// 获取MARStoreKit的单例
+ (instancetype)sharedInstance;

// 显示评分
// 苹果官方说不能骚扰用户，因此使用此API有非常严格的限制：苹果规定，每台设备、每个App、每年只能弹出3次该提示窗口。
// 游戏自行把控
- (void)showRating;

// 跳到appStore 页面评分;
- (void)showRating:(NSString *)APPID;

@end

NS_ASSUME_NONNULL_END
