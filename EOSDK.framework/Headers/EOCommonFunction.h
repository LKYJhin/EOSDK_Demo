//
//  EOCommonFunction.h
//  eoGameDemo
//
//  Created by 刘康逸 on 2020/3/27.
//  Copyright © 2020年 EOGameCompany. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZKUDID.h"
#import "EODES.h"
#import "EOMacroMethod.h"
#import "EOKey.h"

@interface EOCommonFunction : NSObject

#pragma mark -- NSUserDefault获取值
+ (NSString *)valueInUserDefault:(NSString *)key;
+ (void)setUserDefaultValue:(NSString *)value forKey:(NSString *)key;
+ (void)userDefaultRemoveKey:(NSString *)key;

#pragma mark -- 判断越狱设备
+ (BOOL)jailBrokenDevice;

#pragma mark -- 时间戳
+ (NSString *)currentTime;

#pragma mark -- 颜色
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString;
+ (UIColor *)colorFromHexRGB:(NSString *)inColorString alpha:(CGFloat)alpha;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

#pragma mark -- 文本尺寸
+ (CGSize)sizeOfString:(NSString *)string maxWidth:(CGFloat)maxWidth maxHeight:(CGFloat)maxHeight withFontSize:(CGFloat)fontSize;

#pragma mark -- 参数
+ (NSString *)packageVersion;
+ (NSString *)sdkExt;

#pragma mark -- 公共参数
+ (NSString *)osVersion;
+ (NSString *)device;
+ (NSString *)memory;
+ (NSString *)netWorkType;
+ (NSString *)bundleID;
+ (NSString *)getScreenSize;
+ (NSString *)getLanguage;

#pragma mark keychain
+ (NSString *)guid;
+ (BOOL)existInfoAtKeyChain:(NSString *)userID;
+ (void)updateKeyChain:(NSString *)recipetData userID:(NSString *)userID;
+ (void)saveToKeyChain:(NSString *)recipetData userID:(NSString *)userID;
+ (void)deleteKeyChainWithUserID:(NSString *)userID;
+ (NSString *)readKeyChainDataWith:(NSString *)userID;

#pragma mark 字符串 字典互转
+ (NSDictionary *)stringToNSDictionary:(NSString *)string;
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;
+ (NSString*)arrayToJson:(NSArray *)arr;

#pragma mark 加密
+ (NSString *)md5:(NSString *)string;

#pragma mark -- 提示绑定帐号/手机号
+ (BOOL)popBindAccountAlert;
+ (BOOL)popBindPhoneAlert;

#pragma mark 正则
+ (BOOL)checkTelNumber:(NSString *)telNumber;
+ (BOOL)checkUserName:(NSString *)userName;
+ (BOOL)checkEmail:(NSString *)email;
+ (BOOL)checkAccount:(NSString *)account;
+ (BOOL)checkAuthCode:(NSString *)codeNumber;
+ (BOOL)checkPassword:(NSString *)password;

#pragma mark 根据view查找到ViewController
+ (UIViewController*) findViewControllerByView:(UIView *)view;

@end
