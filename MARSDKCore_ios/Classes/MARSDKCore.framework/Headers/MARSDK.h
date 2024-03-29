//
//  MARSDK.h
//  MARSDKCore
//
//  Created by js wu on 2021/6/28.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "MARSDKProxy.h"
#import "MARAnalytics.h"
#import "MARUser.h"
#import "MARPay.h"


#ifdef __cplusplus
#define MARSDK_EXTERN        extern "C" __attribute__((visibility ("default")))
#else
#define MARSDK_EXTERN        extern __attribute__((visibility ("default")))
#endif
//状态码
static int const MAR_CODE_LOGIN_FAILED = 1;           //登录失败
static int const MAR_CODE_LOGIN_CANCEL = 2;           //登录取消
static int const MAR_CODE_PAY_SUCCESS = 3;            //支付成功
static int const MAR_CODE_PAY_FAILED = 4;             //支付失败
static int const MAR_CODE_PAY_CANCEL = 5;             //支付取消
static int const MAR_CODE_PAY_UNKNOWN = 6;            //支付结果未知
static int const MAR_CODE_INIT_FAILED = 7;            //初始化失败
static int const MAR_CODE_INIT_SUCCESS = 8;           //初始化成功
static int const MAR_CODE_SWITCH_ACCOUNT_FAILED = 9;  //切换账号失败





//  检查网络状态回调
typedef void  (^NetworkStatusCallback)(NSString * MARNetworkStatus);
typedef void  (^ExchangeGiftbagBlock)(NSDictionary  * returnParameterDict );
typedef void  (^CrossPushActionClickBlock)(NSString *actionName);
typedef void  (^RealNameSuccessfulBlock)(NSString *userId, NSString *realName,NSString *age );
typedef void  (^AppstoreRedemptionCodeRedemptionBlock)(NSString *productID);
typedef void  (^PayFailBlock)(NSDictionary *payDict);

// MARSDK的核心类
// 负责插件管理和事件分发
@interface MARSDK : NSObject

/// MARSDK的参数
@property (nonatomic, copy) NSDictionary* sdkParams;
/// APP支持的屏幕方向
@property UIInterfaceOrientationMask supportedOrientations;
/// 渠道号
@property (readonly) int channelId;
// 渠道名
@property (readonly) NSString* channelName;

// 委托回调对象
@property id<MARSDKDelegate> delegate;

// MARServer代理
@property (strong, nonatomic) MARProxy* proxy;

/// 默认的账号接口实现
@property (strong, nonatomic) id defaultUser;
/// 默认的支付接口实现
@property (strong, nonatomic) id defaultPay;


@property (nonatomic,strong) NetworkStatusCallback  networkStatusCallback;
@property (nonatomic,strong) ExchangeGiftbagBlock  exchangeGiftbagBlock;
@property (nonatomic,strong) RealNameSuccessfulBlock  realNameSuccessfulBlock;
@property (nonatomic,strong) CrossPushActionClickBlock  crossPushActionClickBlock;
@property (nonatomic,strong) AppstoreRedemptionCodeRedemptionBlock  appstoreRedemptionCodeRedemptionBlock;
@property (nonatomic,strong) PayFailBlock  payFailBlock;



//渠道初始化
-(void)marsdkCoreInit;

/// 获取MARSDK的单例
+(MARSDK*) sharedInstance;

/// 添加插件
-(void) registerPlugin:(NSObject*)plugin;

/**
 * @brief 查找接口对象
 * @param name 插件的名称
 * @param protocolType 接口的类型
 * @return 如果指定了protocolType，就返回对应接口的对象， 否则返回插件对象
 */
-(NSObject*) getInterfaceByName:(NSString*)name andProtocol:(Protocol *)protocolType;

-(NSArray*) plugins;

-(void) initWithParams:(NSDictionary*)params;

-(BOOL) isInitCompleted;

-(void) setupWithParams:(NSDictionary*)params;
-(void) submitExtraData:(MARUserExtraData*)data;
//    gameId：游戏兑换码   
-(void)exchangeGiftbag:(NSString *)redeemCode;
-(id) customCall:(NSString*)method withParams:(NSDictionary*)params;

#pragma mark -- 帐号登录接口 --
-(void) login;
-(void) logout;
-(void) switchAccount;
-(BOOL) hasAccountCenter;

-(void) loginCustom:(NSString*)customData;
-(void) showAccountCenter;

- (BOOL) hasRealNameQuery;
- (BOOL) hasRealNameRegister;
- (void) realNameQuery;
- (void) realNameRegister;

// 注销账号
- (void) CancellationsAccount;

-(void)payFail:(NSDictionary *)payDict;


-(void) exit;

#pragma mark -- 支付充值接口 --
-(void) pay:(MARProductInfo*) profuctInfo;
-(void) finishTransaction:(NSString*)transactionIdentifier;

//复制评论内容
-(void)copyCommentContent;
//获取复制评论内容
-(NSString *)getAndCopyCommentContent;
//获取第定义开关
- (BOOL)getCustomSwitch;


// 道具到账
-(void)propComplete:(NSString *)orderId responseHandler:(MARRequestCallback) handler;


//上报自定义事件
-(void)reportCustomEvents:(NSString *)eventsName eventsContent:(NSDictionary *)eventsContent;


//开始检测网络状态
-(void)startsCheckNetworkStatus;


//停止网络状态监听
- (void)stopCheckNetworkStatus;
//重新监听网络状态
- (void)againStartsCheckNetworkStatus;


//获取资源下载地址
- (void)getDownloadUrl:(void(^)(NSDictionary *returnDic ,NSError *error))block;

//敏感词内容审核
- (void)censorSensitiveWord:(NSString *)wordText FinishBlock:(void(^)(NSDictionary *returnDic ,NSError *error))block;

//互推游戏
-(void)PushGamesCentre;

/// 互推游戏结算页面
-(void)PushGamesCheckout;

//隐藏互推游戏结算中心
-(void)hiddenPushGamesCheckout;

//底部互推
-(void)BottomPushGames;

//隐藏底部互推
-(void)hiddenBottomPushGames;
//导出日志
-(void)exportLogFile;
//开始日志
-(void)startLogRecordWithXcodeEnable;


//打开Xcode日志 调试可以打开日志，调试完毕后记得删除此方法
-(void)openXcodeLog;

// -------------------交叉互推 ----------------------
//交叉互推方法 type 1到5 具体运营会给到
-(void)crossPushAction:(int)type;



/// 本地推送消息
/// - Parameters:
///   - fireDate: NSString   时间戳  秒 1685092531
///   - alertBody: 标题
///   - isRepeatDay: 是否每天重复
-(void)localPushMessages:(NSString *)fireDate  alertBody:(NSString *)alertBody  isRepeatDay:(BOOL)isRepeatDay;

//清空所有本地消息
-(void)cleanNotification;

//获取服务器时间戳(百度时间，没有网络返回0， 有网返回毫秒级时间戳 1684310674000)
-(NSInteger )getInternetDate;

// -------------------数数用户属性上报 ----------------------
/**
 设置用户属性

 @param properties 用户属性
 */
-(void)user_set:(NSDictionary *)properties;
/**
 设置单次用户属性

 @param properties 用户属性
 */
- (void)user_setOnce:(NSDictionary *)properties;
/**
 对数值类型用户属性进行累加操作

 @param properties 用户属性
 */
- (void)user_add:(NSDictionary *)properties;
/**
 删除用户 该操作不可逆 需慎重使用
 
 @param time 事件触发时间
 */
- (void)user_delete:(NSDate * _Nullable)time;


//获取 唯一的AdvertObjectId
- (NSString *)getAdvertObjectId:(NSString *)marAdvertObjectId;

//获取 唯一的idfv
- (NSString *)getMARSIDFV:(NSString *)getMARSIDFV;


//获取 唯一的idfa
- (NSString *)getMARSIDFA;

//清空AdvertObjectId
-(void)clearAdvertObjectId:(NSString *)marAdvertObjectId;


//引力用户属性上报
-(void)setUserProperty:(NSString *)jsonStr;

//引力用户上报  用户唯一 ID
-(void)UmLoginEvent:(NSString *)userClientId;

/// 特殊方法
/// - Parameters:
///   - funname: 方法名
///   - json: 方法参数
-(void)callSpecialFinc:(NSString *)funname json:(NSString *)json;

@end
