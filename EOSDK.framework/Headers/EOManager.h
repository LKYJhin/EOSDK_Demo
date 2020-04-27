//
//  EOManager.h
//  eoGameDemo
//
//  Created by 刘康逸 on 2020/3/28.
//  Copyright © 2020年 EOGameCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "EOInitConfig.h"
#import "EORoleInfo.h"
#import "EOPayInfo.h"

static NSString * const kEOGameCenterAuthCompletionNotification     = @"kEOGameCenterAuthCompletionNotification";  /*GameCenter验证完成*/

static NSString * const kEOReportAchieveSucNotification     = @"kEOReportAchieveSucNotification";  /*GameCenter提交成就成功*/
static NSString * const kEOReportAchieveFailNotification     = @"kEOReportAchieveFailNotification";  /*GameCenter提交成就失败*/

static NSString * const kEOReportScoreSucNotification     = @"kEOReportScoreSucNotification";  /*GameCenter提交分数成功*/
static NSString * const kEOReportScoreFailNotification     = @"kEOReportScoreFailNotification";  /*GameCenter提交分数失败*/

static NSString * const kEOShowLeadboardSucNotification     = @"kEOShowLeadboardSucNotification";  /*GameCenter显示排行榜成功*/
static NSString * const kEOShowLeadboardFailNotification     = @"kEOShowLeadboardFailNotification"; /*GameCenter显示失败*/
static NSString * const kEOShowLeadboardFinishNotification     = @"kEOShowLeadboardFinishNotification";  /*GameCenter显示排行榜结束*/

static NSString * const kEOInitCompletionNotification     = @"kEOInitCompletionNotification";  /*初始化完成*/
static NSString * const kEOUnInitNotification             = @"kEOUnInitNotification";       /*未初始化通知*/
static NSString * const kEOLoginSuccessNotification       = @"kEOLoginSuccessNotification"; /*登录成功*/
static NSString * const kEOLoginErrorNotification         = @"kEOLoginErrorNotification";   /*登录错误*/
static NSString * const kEOUnLoginNotification            = @"kEOUnLoginNotification";      /*未登陆*/
static NSString * const kEOLogoutSuccessNotification      = @"kEOLogoutSuccessNotification"; /*登出成功*/
static NSString * const kEOOrderSuccessNotification       = @"kEOOrderSuccessNotification";    /*购买完成*/
static NSString * const kEOOrderErrorNotification         = @"kEOOrderErrorNotification";       /*购买失败*/

static NSString * const kEOFacebookShareSuccessNotification = @"kEOFacebookShareSuccessNotification";
static NSString * const kEOFacebookShareFailNotification    = @"kEOFacebookShareFailNotification";

static NSString * const kEOGetFacebookFriendsSuccessNotification   = @"kEOGetFacebookFriendsSuccessNotification";
static NSString * const kEOGetFacebookFriendsFailNotification      = @"kEOGetFacebookFriendsFailNotification";

@interface EOManager : NSObject

@property (nonatomic, strong) UIView *rootView;
@property (nonatomic, strong) EOPayInfo *payInfo;
@property (nonatomic, strong) EORoleInfo *roleInfo;
@property (nonatomic, strong) NSMutableDictionary *loginDic;
@property (nonatomic, assign) BOOL userInitiativeBuy;
@property (nonatomic, assign) BOOL isTouristPayOpen;
@property (nonatomic, assign) BOOL isOtherPayOpen;


+ (EOManager *)sharedInstance;

- (void)initWithConfig:(EOInitConfig *)config;
- (void)gameLanguage:(NSString*) language;
- (void)login;
- (void)logOut;
- (void)userCenter;
- (void)serviceCenter;
- (void)inSDKServiceCenter;
- (void)payWithRoleInfo:(EORoleInfo *)roleInfo payInfo:(EOPayInfo *)payInfo;

//post notification
- (void)postInitComplete;
- (void)postUnInit;
- (void)postUnLogin;
- (void)postLoginSuccess:(NSDictionary *)resultDic;
- (void)postLoginErrorMessage:(NSString *)errorMsg;
- (void)postOrderError:(NSString *)errorMsg;
- (void)postOrderError:(NSString *)errorMsg result:(NSDictionary *)dic;
- (void)postOrderSuccess:(id)payInfo result:(NSDictionary *)dic;

- (NSDictionary *)payResult:(EOPayInfo *)payInfo state:(NSNumber *)state;

//控制悬浮窗
- (void)EOHideFloatWindow;
- (void)EOShowFloatWindow;
- (void)EOUserCenterSwitchAccount;
- (void)EOUserCenterBindPhoneNo:(NSString *)username;
- (void)EOUserCenterChangePwd:(NSString *)username;
- (void)EOShowWelcome:(NSDictionary *)resultDic;
- (void)EORootViewDidRemoveFromSuperViewHandler:(void (^)(void))handler;

//- (BOOL)SGFacebookApplication:(UIApplication *) application
//didFinishLaunchingWithOptions:(NSDictionary *) lunchOptions;

- (BOOL)EOApplication:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)lunchOptions;

- (void)EOApplicationDidBecomeActive:(UIApplication *)application;



- (BOOL)EOFacebookApplication:(UIApplication *)application
                      openURL:(NSURL *)url
            sourceApplication:(NSString *)sourceApplication
                   annotation:(id)annotation;

- (BOOL)EOFacebookApplication:(UIApplication *)application
                      openURL:(NSURL *)url
                      options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options;

- (void)EOFacebookShare:(UIViewController *)viewController;
- (void)EOFacebookFriends:(UIView *)view;

/// AppFlyer统计
- (void) AppflyerTrackEvent:(NSString*)eventName withValues:(NSDictionary*) values;

/// 进入游戏
- (void)EOEntryGame:(EORoleInfo *) roleInfo;

/// 创建角色
- (void)EOCreateRole:(EORoleInfo *) roleInfo;

/// 退出游戏
- (void)EOQuitGame;


- (void)debugDeleteUnCompleteOrder;

@end
