//
//  MARGameCenter.h
//  MARSDKCore
//
//  Created by 李志刚 on 2022/5/17.
//

#import <Foundation/Foundation.h>

typedef void (^AuthPlayerCallback)(int authPlayerState, NSError *_Nonnull connectionError);

NS_ASSUME_NONNULL_BEGIN

@interface MARGameCenter : NSObject

/// 获取MARStoreKit的单例
+ (instancetype)sharedInstance;

// 验证授权(登录)
- (void)authPlayer:(AuthPlayerCallback)handler;

// 上传成就 achievementId 成就id 需要和苹果后台保持一致  rating 评分 0.00
// 到 1.00
- (void)uploadAchievment:(NSString *)achievementId rating:(float)rating;

- (void)uploadAchievement:(NSString *)achievementId rating:(float)rating;

// 显示成就列表
- (void)showLeaderBoard;

// 隐藏显示成就列表
- (void)hiddenLeaderBoard;

// 显示成就列表
- (void)showAchievement;

// 隐藏显示成就列表
- (void)hiddenAchievement;

// 更新排行榜    achievementId 成就id 需要和苹果后台保持一致   rating 设置 分值
// 不可以超出App Store 后台设置范围
- (void)uploadLeaderboards:(NSString *)achievementId rating:(float)rating;
// 显示排行榜
- (void)showLeaderboards;
// 隐藏排行榜
- (void)hiddenLeaderboards;

@end

NS_ASSUME_NONNULL_END
