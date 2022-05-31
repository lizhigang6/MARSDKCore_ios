//
//  HXRViewController.m
//  MARSDKCore_ios
//
//  Created by izhigang6@163.com on 04/28/2022.
//  Copyright (c) 2022 izhigang6@163.com. All rights reserved.
//

#import "HXRViewController.h"

#import <MARSDKCore/MARSDK.h>
#import <MARSDKCore/MARSDKCore.h>


#import <MARSDKCore/MARiCloudHandle.h>
#import <MARSDKCore/MARDocument.h>


@interface HXRViewController ()<MARSDKDelegate,MARAdBannerDelegate,MARAdRewardedDelegate,MARAdPopupDelegate>

@end

@implementation HXRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *loginBut =[[UIButton alloc] initWithFrame:CGRectMake(20, 100, 200, 50)];
    [loginBut setTitle:@"登录" forState:UIControlStateNormal];
    [loginBut addTarget:self action:@selector(onLoginClick:) forControlEvents:UIControlEventTouchUpInside];
    [loginBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:loginBut];
    
    UIButton *logoutBut =[[UIButton alloc] initWithFrame:CGRectMake(20, 200, 200, 50)];
    [logoutBut setTitle:@"登出" forState:UIControlStateNormal];
    [logoutBut addTarget:self action:@selector(logoutBut:) forControlEvents:UIControlEventTouchUpInside];
    [logoutBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:logoutBut];
    
    
    UIButton *payBtn =[[UIButton alloc] initWithFrame:CGRectMake(20, 300, 200, 50)];
    [payBtn setTitle:@"充值" forState:UIControlStateNormal];
    [payBtn addTarget:self action:@selector(payBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [payBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:payBtn];

    
    
    UIButton *bannerBut =[[UIButton alloc] initWithFrame:CGRectMake(20, 400, 200, 50)];
    [bannerBut setTitle:@"banner" forState:UIControlStateNormal];
    [bannerBut addTarget:self action:@selector(showBanner) forControlEvents:UIControlEventTouchUpInside];
    [bannerBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:bannerBut];
    
    
    UIButton *hideBannerBut =[[UIButton alloc] initWithFrame:CGRectMake(20, 400, 200, 50)];
    [hideBannerBut setTitle:@"banner" forState:UIControlStateNormal];
    [hideBannerBut addTarget:self action:@selector(hideBanner) forControlEvents:UIControlEventTouchUpInside];
    [hideBannerBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:hideBannerBut];


    UIButton *incentiveBut =[[UIButton alloc] initWithFrame:CGRectMake(20, 500, 200, 50)];
    [incentiveBut setTitle:@"激励视频" forState:UIControlStateNormal];
    [incentiveBut addTarget:self action:@selector(showReward) forControlEvents:UIControlEventTouchUpInside];
    [incentiveBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:incentiveBut];
    
    
//    UIButton *incentiveBut =[[UIButton alloc] initWithFrame:CGRectMake(20, 500, 200, 50)];
//    [incentiveBut setTitle:@"插屏视频" forState:UIControlStateNormal];
//    [incentiveBut addTarget:self action:@selector(incentiveBut) forControlEvents:UIControlEventTouchUpInside];
//    [incentiveBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [self.view addSubview:incentiveBut];
    
    
    UIButton *PopupBut =[[UIButton alloc] initWithFrame:CGRectMake(20, 600, 200, 50)];
    [PopupBut setTitle:@"原生视频" forState:UIControlStateNormal];
    [PopupBut addTarget:self action:@selector(showPopupAd) forControlEvents:UIControlEventTouchUpInside];
    [PopupBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:PopupBut];
}

// 显示baner
-(void)showBanner
{
    [[MARAd sharedInstance] showBannerAd:self delegate:self];
}


// 隐藏banner
-(void)hideBanner
{
    [[MARAd sharedInstance] hideBanner];

}


//显示激励视频
-(void)showReward
{
    

    [[MARAd sharedInstance] showRewardVideoAd:self itemName:@"" itemNum:0 delegate:self];
}
// 显示插屏
-(void)showPopupAd
{
    [[MARAd sharedInstance] showPopupAd:self delegate:self];

}


//提交数据
-(void)submitExtraData
{
    MARUserExtraData* extraData = [[MARUserExtraData alloc] init];
    extraData.dataType = TYPE_CREATE_ROLE;
    extraData.roleID = @"100";
    extraData.roleName = @"小兵";
    extraData.serverID = 1000;
    extraData.serverName = @"初来乍到";
    extraData.roleLevel = @"22";
    extraData.vip = @"101";
  
    
    [[MARSDK sharedInstance] submitExtraData:extraData];
}
//登录
- (void)onLoginClick:(UIButton *)sender {
   [[MARSDK sharedInstance] login];
//    [[HXRViewController shareInstance] onLoginClick];
}
//登出
-(void)logoutBut:(UIButton *)sender
{
   [[MARSDK sharedInstance] logout];
//    [[HXRViewController shareInstance] logoutBut];


}
//切换账号
-(void)switchAccount
{
    [[MARSDK sharedInstance] switchAccount];
}

//支付
- (void)payBtnClick:(id)sender {

    
    MARProductInfo* productInfo = [[MARProductInfo alloc] init];
    productInfo.productName = @"一元充值";
    productInfo.productDesc = @"礼包1";
//    productInfo.productId = @"1";
    productInfo.productId = @"com.sx.MHJY.08";
    productInfo.price = [NSNumber numberWithInt:1];
    productInfo.buyNum = 1;
    productInfo.coinNum = 900;
    productInfo.roleId = @"1";
    productInfo.roleName = @"角色名称";
    productInfo.roleLevel = @"66";
    productInfo.serverId = @"1";
    productInfo.serverName = @"桃源";
    productInfo.vip = @"1";
    productInfo.extension = @"";
    productInfo.notifyUrl = @"http://110.54.33.45/game/pay/notify";
    
    [[MARSDK sharedInstance].defaultPay pay:productInfo];
    
    

}



//支付成功回调
-(void) OnPlatformInit:(NSDictionary*)param
{
    
    NSLog(@"OnPlatformInit====%@",param);
}



- (UIView *)GetView {
    return [self GetViewController].view;
}


- (UIViewController *)GetViewController {
    return self;
}







//跳转到App Store评分
// 游戏的 Apple ID 是指appsttore 市场的 Apple ID
-(void) showRating:(NSString *)APPID
{
    
   // [[MARStoreKit sharedInstance] showRating:@"1599649390"];
    [[MARStoreKit sharedInstance] showRating:APPID];

}

//App 内评分
//苹果官方说不能骚扰用户，因此使用此API有非常严格的限制：苹果规定，每台设备、每个App、每年只能弹出3次该提示窗口

-(void) showRating
{
    
    [[MARStoreKit sharedInstance] showRating];

}
//保存数据 key——value
-(void)setUpKeyValueICloudStoreWithKey:(NSString *)key value:(NSString *)value
{
    [MARiCloudHandle setUpKeyValueICloudStoreWithKey:@"要保存的key" value:@"要保存的velue"];

}

//根据 key 获取value
-(NSString *)getKeyValueICloudStoreWithKey:(NSString *)key
{
    return  [MARiCloudHandle getKeyValueICloudStoreWithKey:@"要查询的key"];

}


//创建文档
-(void)createDocumentWithFileName:(NSString *)fileName content:(NSString *)content
{
    [MARiCloudHandle createDocumentWithFileName:@"自定义文件名称.txt" content:@"测试文件内容"];

}

//修改文档 实际上是overwrite重写
-(void)overwriteDocumentWithFileName:(NSString *)fileName content:(NSString *)content
{
    [MARiCloudHandle overwriteDocumentWithFileName:@"自定义文件名称.txt" content:@"测试文件内容"];

}
//删除文档
-(void)removeDocumentWithFileName:(NSString *)fileName
{
    [MARiCloudHandle removeDocumentWithFileName:@"自定义文件名称.txt" ];

}

//读取文档
-(void)readDocument
{
    MARDocument *doc = [[MARDocument alloc] initWithFileURL:[MARiCloudHandle getUbiquityContauneURLWithFileName:@"自定义文件名称.txt"]];
      [doc openWithCompletionHandler:^(BOOL success) {

          if(success)
          {
              NSLog(@"读取数据成功。");

              NSString *docConten = [[NSString alloc] initWithData:doc.myData encoding:NSUTF8StringEncoding];
              NSLog(@"%@",docConten);

          }
          else
          {
              NSLog(@"读取数据失败。");

          }
      }];


}

//   MARK: --  开屏广告 回调方法   --

///
/// @param code SA_ERROR_AD_LOAD_FAILED = 1, SA_ERROR_AD_ERROR
/// @param message 错误信息
- (void) MARAdSplashDidFailed: (MARAdErrorCode)code withMessage: (NSString *)message
{
  NSLog(@"开屏广告失败code:%ld message:%@",(long)code,message);
}

/// 开屏广告加载完
- (void) MARAdSplashDidLoaded
{
  NSLog(@"开屏广告加载完");
}

/// 开屏广告显示
- (void) MARAdSplashDidShow
{
  NSLog(@"开屏广告显示");
}

/// 开屏广告点击详情
- (void) MARAdSplashDidClicked
{
  NSLog(@"开屏广告点击详情");
}

/// 开屏广告关闭
- (void) MARAdSplashDidClosed
{
  NSLog(@"开屏广告关闭");
}

/// 开屏广告点击跳过
- (void) MARAdSplashDidSkipped
{
  NSLog(@"开屏广告点击跳过");
}

//   MARK: --  插屏、全屏广告 回调方法   --

- (void) MARAdPopupDidFailed: (MARAdErrorCode)code withMessage: (NSString *)message
{
  NSLog(@"插屏/全屏广告加载失败: %ld错误信息：%@",code,message);

}
- (void) MARAdPopupDidLoaded
{
  NSLog(@"插屏/全屏广告加载");

}
- (void) MARAdPopupDidShow
{
  NSLog(@"插屏/全屏广告显示");

}
- (void) MARAdPopupDidClicked
{
  NSLog(@"插屏/全屏广告点击");

}
- (void) MARAdPopupDidClosed
{
  NSLog(@"插屏/全屏广告关闭");

}
- (void) MARAdPopupDidSkipped
{
  NSLog(@"插屏/全屏广告跳过");

}


//   MARK: --  Banner视频 回调方法   --

- (void) MARAdBannerDidFailed: (MARAdErrorCode)code withMessage: (NSString *)message
{
  NSLog(@"Banner广告失败%ld----%@",code,message);

}
- (void) MARAdBannerDidLoaded
{
  NSLog(@"Banner广告加载");

}
- (void) MARAdBannerDidShow
{
  NSLog(@"Banner广告显示");

}
- (void) MARAdBannerDidClicked
{
  NSLog(@"Banner广告点击");

}
- (void) MARAdBannerDidClosed
{
  NSLog(@"Banner广告关闭");

}
- (void) MARAdBannerDidSkipped
{
  NSLog(@"Banner广告跳过");

}




//   MARK: --  激励视频 回调方法   --
//激励视频
- (void) MARAdRewardedDidFinished: (NSString *)itemName itemNum:(int)itemNum;
{
  NSLog(@"激励视频播放完成下发奖励 ----%@ ------%d",itemName,itemNum);
   
}

- (void) MARAdRewardedDidFailed: (MARAdErrorCode)code withMessage: (NSString *)message
{
  NSLog(@"激励视频失败%ld----%@",(long)code,message);

}
- (void) MARAdRewardedDidLoaded
{
  NSLog(@"激励视频加载完成");

}
- (void) MARAdRewardedDidShow
{
  NSLog(@"激励视频显示");

}
- (void) MARAdRewardedDidClicked
{
  NSLog(@"激励视频点击");

}
- (void) MARAdRewardedDidClosed
{
  NSLog(@"激励视频关闭");

}
- (void) MARAdRewardedDidSkipped
{
  NSLog(@"激励视频跳过");
}
@end
