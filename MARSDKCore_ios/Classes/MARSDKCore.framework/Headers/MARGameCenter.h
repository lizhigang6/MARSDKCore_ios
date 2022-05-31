//
//  MARGameCenter.h
//  MARSDKCore
//
//  Created by 李志刚 on 2022/5/17.
//

#import <Foundation/Foundation.h>


typedef void (^AuthPlayerCallback)(int authPlayerState, NSError* _Nonnull connectionError);

NS_ASSUME_NONNULL_BEGIN

@interface MARGameCenter : NSObject

/// 获取MARStoreKit的单例
+(instancetype) sharedInstance;

//验证授权(登录)
-(void)authPlayer:(AuthPlayerCallback)handler;

// 上传成就
- (void)uploadAchievment:(NSString *)achievementId rating:(float)rating;

//显示排行榜
-(void)showLeaderBoard;

//隐藏排行榜
-(void)hiddenLeaderBoard;

@end

NS_ASSUME_NONNULL_END
