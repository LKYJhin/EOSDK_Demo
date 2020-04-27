//
//  SandClass.h
//  eoGameDemo
//
//  Created by apple on 2020/4/1.
//  Copyright © 2020年 EOGameCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EOManager.h"
#import "EOInitConfig.h"
#import "EORoleInfo.h"
#import "EOPayInfo.h"

@class UIApplication;

@interface SandClass : NSObject

/*
  debugMode = YES 时，该方法才有用
 */
+ (void)debugDeleteUnCompleteOrder;

/*
 字符串转字典
 */
+ (NSDictionary *)dictionaryFromString:(NSString *)string;

/*
 字典转 JSON, 针对 Unity-3D 接入提供
 */
+ (NSString *)jsonFromDictionary:(NSDictionary *)dic;

/*
 获取UDID
 */
+ (NSString *)getUdid;

/*
 游戏中心
 */
+ (void)gameCenterAuth;

/*
 积分报表
 */
+ (void)reportScore:(int64_t)score forCategory:(NSString *)category;

/*
 成就报表
 */
+ (void)reportAchievement:(NSString *)chievementID percentComplete:(CGFloat)percent;

/*
 游戏中心排行榜
 */
+ (void)gameCenterLeaderboard:(NSString *)ID;

+ (BOOL) eo_application:(UIApplication *) application
didFinishLaunchingWithOptions:(NSDictionary *) lunchOptions;

/*
 应用上线
 */
+ (void) eo_applicationDidBecomeActive:(UIApplication*)application;

+ (BOOL)facebookApplication:(UIApplication *)application
                    openURL:(NSURL *)url
          sourceApplication:(NSString *)sourceApplication
                 annotation:(id)annotation;

+ (BOOL)facebookApplication:(UIApplication *)application
                    openURL:(NSURL *)url
                    options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options;

+ (void)EOFacebookShare:(UIViewController *)viewController;

+ (void)EOGetFacebookFriend:(UIView*)view;

+ (void)EOCreateRole:(EORoleInfo*) roleInfo;

+ (void)EOEntryGame:(EORoleInfo*) roleInfo;

+ (void)EOQuitGame;

/**
 *  初始化方法
 * @param config ;
 */
+ (void)initWithConfig:(EOInitConfig *)config;

+ (void)gameLanguage:(NSString *)language;

/**
 *  登录
 */
+ (void)login;

/**
 *  登出
 */
+ (void)logOut;

/**
 *  用户中心
 */
+ (void)userCenter;

/**
 *  客服中心
 */
+ (void)serviceCenter;

/**
 *  设置悬浮窗显示状态 1：左， 2：右，3：隐藏
 */
+ (void)setFloatStatus:(int)status;

/**
 *  发起支付
 @param roleInfo 第一个参数
 @param payInfo 第二个参数
 */
+ (void)payWithRoleInfo:(EORoleInfo *)roleInfo payInfo:(EOPayInfo *)payInfo;



/**
 *  SDK 版本
 */
+ (NSString *)sdkVersion;
+ (NSString *)packageVersion;
+ (NSString *)osVersion;
+ (NSString *)guid;
+ (NSString *)device;
+ (NSString *)netWorkType;

@end
