//
//  MARAdSwith.h
//  MARSDKCore
//
//  Created by 火星人 on 2022/3/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MARAdSwith : NSObject


// 悬浮icon 广告开关
@property (strong, nonatomic) NSString *floatSwitch;

//banner 开关
@property (strong, nonatomic) NSString *bannerSwitch;
//插屏开关
@property (strong, nonatomic) NSString *intersSwitch;
//开屏开关
@property (strong, nonatomic) NSString *splashSwitch;
//激励视频开关
@property (strong, nonatomic) NSString *videoSwitch;
//插屏视频开关
@property (strong, nonatomic) NSString *intersVideoSwitch;
//原生横屏开关
@property (strong, nonatomic) NSString *nativeBannerSwitch;
//原生插屏开关
@property (strong, nonatomic) NSString *nativeIntersSwitch;
//原生大图开关（原生贴片）
@property (strong, nonatomic) NSString *nativeBigSwitch;


//-----------

 // banner
//加载间隔时间(秒)
@property (assign, nonatomic) int loadIntervalTime;
//刷新频率(秒)
@property (assign, nonatomic) int refreshRate;
//优先级  原生 非原生
@property (strong, nonatomic) NSString *priority;


// 插屏控制
//间隔次数
@property (assign, nonatomic) int intervalNum;
//间隔时间(秒)
@property (assign, nonatomic) int intervalTime;
//开始次数
@property (assign, nonatomic) int startNum;

//插屏多合一控制

//是否启用
@property (assign, nonatomic) int enableSwitch;
//插屏比例(%)
@property (assign, nonatomic) int intersRatio;
//原生插屏比例(%)
@property (assign, nonatomic) int nativeIntersRatio;
//插屏视频比例(%)
@property (assign, nonatomic) int intersVideoRatio;
//激励视频比例(%)
@property (assign, nonatomic) int incentiveVideoRatio;

//开屏广告比例(%)
@property (assign, nonatomic) int splashAdvertRatio;

// 延时控制
//延时开关
@property (assign, nonatomic) int delayedSwitch;
//弹出时间区间(毫秒) 开始
@property (assign, nonatomic) int ejectionTime;

//弹出时间区间(毫秒) 结束
@property (assign, nonatomic) int ejectionEndTime;

//弹出间隔次数
@property (assign, nonatomic) int ejectionInterval;


// 激励控制
//间隔时间(秒)
@property (assign, nonatomic) int IncentiveIntervalTime;
//限制次数
@property (assign, nonatomic) int IncentiveLimitNum;
//是否启用
@property (assign, nonatomic) int IncentiveEnableSwitch;
//开始次数
@property (assign, nonatomic) int IncentiveStartNum;


//动态控制



//插屏开关（误触原生插屏）
@property (assign, nonatomic) int touchMistakeNativeIntersSwitch;
//原生贴片开关（误触原生贴片）
@property (assign, nonatomic) int nativePasterSwitch;
//原生贴片蒙层可视开关
@property (assign, nonatomic) int nativePasterMaskSwitch;
//插屏开始次数
@property (assign, nonatomic) int nativeIntersStartNumber;
//误触最大次数
@property (assign, nonatomic) int nativeIntersMaxNumber;
//误触间隔时间(秒)
@property (assign, nonatomic) int nativeIntersIntervalTime;
//误触间隔次数(展示)
@property (assign, nonatomic) int nativeIntersIntervalNumber;

////原生插屏瞬机样式开关
//@property (assign, nonatomic) int DynamicnativeIntersSwitch;
//原生插屏瞬机样式开关
@property (assign, nonatomic) int nativeIntersRandomStyleSwitch;
//原生贴片开始次数
@property (assign, nonatomic) int nativePasterStartNumber;
//贴片最大误触次数
@property (assign, nonatomic) int nativePasterMostNumber;
//原生贴片误触间隔时间(秒)
@property (assign, nonatomic) int nativePasterIntervalTime;
//原生贴片误触间隔次数(展示)
@property (assign, nonatomic) int  nativePasterIntervalNumber;
//原生贴片高度比例(%)
@property (assign, nonatomic) int nativePasterHeightRatio;

//原生贴片大图样式
@property (strong, nonatomic) NSString * nativePasterBigPicStyle;




//切入切出

//是否启用
@property (assign, nonatomic) int InoutControlEnableSwitch;

//弹出类型

@property (strong, nonatomic) NSString * popupType;

//间隔时间(秒)
@property (assign, nonatomic) int InoutControlIntervalTime;

//间隔次数
@property (assign, nonatomic) int InoutControlIntervalNum;




// 安卓用的 互推管理  虚拟键触发    广告插屏控制（有页面的）







+(MARAdSwith*) sharedInstance;

@end

NS_ASSUME_NONNULL_END
