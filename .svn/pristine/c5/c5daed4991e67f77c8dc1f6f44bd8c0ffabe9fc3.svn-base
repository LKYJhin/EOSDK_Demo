//
//  EOMacroMethod.h
//  eoGameDemo
//
//  Created by 刘康逸 on 2020/3/27.
//  Copyright © 2020年 EOGameCompany. All rights reserved.
//


#ifndef EOMacroMethod_h
#define EOMacroMethod_h


#pragma mark - 尺寸相关

#define IsHigherIOS10 ([[[UIDevice currentDevice] systemVersion] floatValue]>= @"10.0")
#define IsHigherIOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

#define IS_PAD  ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

#define IS_lessiOS8 (NSFoundationVersionNumber < NSFoundationVersionNumber_iOS_8_0)

#define IsLand (UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation))

#define IOS7Land (IS_lessiOS8 && IsLand)

#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_WIDTH  ([[UIScreen mainScreen] bounds].size.width)

#define IS_P_IPHONE6_PLUS (SCREEN_WIDTH == 414 && SCREEN_HEIGHT == 736)
#define IS_P_IPHONE6      (SCREEN_WIDTH == 375 && SCREEN_HEIGHT == 667)
#define IS_P_IPHONE5      (SCREEN_WIDTH == 320 && SCREEN_HEIGHT == 568)
#define IS_P_IPHONE4      (SCREEN_WIDTH == 320 && SCREEN_HEIGHT == 480)

#define IS_L_IPHONE6_PLUS (SCREEN_WIDTH == 736 && SCREEN_HEIGHT == 414)
#define IS_L_IPHONE6      (SCREEN_WIDTH == 667 && SCREEN_HEIGHT == 375)
#define IS_L_IPHONE5      (SCREEN_WIDTH == 568 && SCREEN_HEIGHT == 320)
#define IS_L_IPHONE4      (SCREEN_WIDTH == 480 && SCREEN_HEIGHT == 320)

#define SCALE_SIZE(A)     ((IS_P_IPHONE6_PLUS || IS_PAD ||IS_L_IPHONE6_PLUS)? 1.294 : ((IS_P_IPHONE6 || IS_L_IPHONE6) ? 1.172 : 1)) * (A)


#define EO_LOGO_WIDTH 125
#define EO_LOGO_HEIGHT 36

#define EO_CornerRadius 8.0

#define EO_BackgroundColor       @"fffff"

#define EO_Login_Color           @"ff5717"

#define EO_Login_Buttons_Color   @"f5efec"

#define EO_Regist_Button_Color   @"ff5d1d"

#define EO_CS_Email_Color        @"626262"

#define EO_Auto_Login_User_Name_Color  @"626262"
#define EO_Auto_swith_account_Color    @"ff5a19"
#define EO_Switch_Account_Color        @"7b7879"
#define EO_Switch_Login_Color          @"d3cdcd"
#define EO_Switch_Button_Color         @"ff5312"

#define EO_User_Info_Name_Color        @"929292"
#define EO_User_Info_Bind_Color        @"626262"
#define EO_User_Info_CS_Btn_Color      @"ff5210"
#define EO_User_Info_Bottom_Color      @"d3cccc"

#define EO_btnBgColor                  @"ff9a32"
#define EO_disableColor                @"ffcc99"


#define EO_lineColor            @"c8cbd4"

#define EO_Web_Pay_TopColor     @"1296db"

#define EO_btnHighlightColor    @"995c1f"


#define EO_redColor             @"ff5234"
#define EO_blackColor           @"565657"
#define EO_grayColor            @"84888f"
#define EO_orangeColor          @"FC533D"

#define EO_accountBgColor       @"E9EBEE"

#define DownViewFrame CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)
#define CurrentViewFrame CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)

#endif /* EOMacroMethod_h */


#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool {} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif


#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool {} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool {} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif



#ifdef DEBUG

//#define DLog(fmt, ...) NSLog((@"<%s : %d> %s  " fmt), [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__,  ##__VA_ARGS__);
//#define DLog(...) printf("<%s : %d>  %s  %s\n", [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String] ,__LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String]);

#define DLog(...) printf("<%s : %d>  %s\n", [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String] ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String]);

#else
#define DLog(...)
#endif
