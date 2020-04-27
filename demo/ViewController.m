//
//  ViewController.m
//  demo
//
//  Created by apple on 2020/4/8.
//  Copyright © 2020年 apple. All rights reserved.
//

#import "ViewController.h"
#import <EOSDK/SandClass.h>
#import <CommonCrypto/CommonCrypto.h>

@interface ViewController ()
{
    NSString *userId;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor darkGrayColor]];
    
    UIButton *userCenterBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 50)];
    [userCenterBtn setTitle:@"用户中心" forState:UIControlStateNormal];
    [userCenterBtn addTarget:self action:@selector(userCenter) forControlEvents:UIControlEventTouchUpInside];
    userCenterBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:userCenterBtn];
    
    UIButton *facebookShare = [[UIButton alloc] initWithFrame:CGRectMake(200, 50, 150, 50)];
    [facebookShare setTitle:@"facebook分享" forState:UIControlStateNormal];
    [facebookShare addTarget:self action:@selector(facebookShare) forControlEvents:UIControlEventTouchUpInside];
    facebookShare.backgroundColor = [UIColor redColor];
    [self.view addSubview:facebookShare];
    
    UIButton *facebookFriends = [[UIButton alloc] initWithFrame:CGRectMake(400, 50, 150, 50)];
    [facebookFriends setTitle:@"facebook好友" forState:UIControlStateNormal];
    [facebookFriends addTarget:self action:@selector(getFacebookFriend) forControlEvents:UIControlEventTouchUpInside];
    facebookFriends.backgroundColor = [UIColor redColor];
    [self.view addSubview:facebookFriends];
    
    
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(350, 150, 100, 50)];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(userLogin) forControlEvents:UIControlEventTouchUpInside];
    loginBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:loginBtn];
    
    UIButton *initBtn = [[UIButton alloc] initWithFrame:CGRectMake(470, 150, 100, 50)];
    [initBtn setTitle:@"init" forState:UIControlStateNormal];
    [initBtn addTarget:self action:@selector(EOInitSDK) forControlEvents:UIControlEventTouchUpInside];
    initBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:initBtn];
    
    UIButton *payBtn = [[UIButton alloc] initWithFrame:CGRectMake(200, 150, 100, 50)];
    [payBtn setTitle:@"支付" forState:UIControlStateNormal];
    [payBtn addTarget:self action:@selector(EOPayment) forControlEvents:UIControlEventTouchUpInside];
    payBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:payBtn];
    
    UIButton *languageBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 150, 100, 50)];
    [languageBtn setTitle:@"中文" forState:UIControlStateNormal];
    [languageBtn addTarget:self action:@selector(EOLanguage) forControlEvents:UIControlEventTouchUpInside];
    languageBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:languageBtn];
    
    UIButton *quitBtn = [[UIButton alloc] initWithFrame:CGRectMake(350, 250, 100, 50)];
    [quitBtn setTitle:@"退出" forState:UIControlStateNormal];
    [quitBtn addTarget:self action:@selector(quitGame) forControlEvents:UIControlEventTouchUpInside];
    quitBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:quitBtn];
    
    UIButton *createRoleBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 250, 100, 50)];
    [createRoleBtn setTitle:@"创建角色" forState:UIControlStateNormal];
    [createRoleBtn addTarget:self action:@selector(createRoleInGame) forControlEvents:UIControlEventTouchUpInside];
    createRoleBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:createRoleBtn];
    
    UIButton *entryGameBtn = [[UIButton alloc] initWithFrame:CGRectMake(200, 250, 100, 50)];
    [entryGameBtn setTitle:@"进入游戏" forState:UIControlStateNormal];
    [entryGameBtn addTarget:self action:@selector(entryGame) forControlEvents:UIControlEventTouchUpInside];
    entryGameBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:entryGameBtn];
    
    
    [self addObserver];
   
    
    
}

#pragma mark -- 添加观察者
- (void)addObserver
{
    //初始化完成相关通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EOInitCompletion) name:kEOInitCompletionNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EOUnInit) name:kEOUnInitNotification object:nil];
    
    //登录相关通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EOLoginFail:) name:kEOLoginErrorNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EOLoginSuccess:) name:kEOLoginSuccessNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EOUnLogin) name:kEOUnLoginNotification object:nil];
    //
    //    //登出相关通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EOLogOutSuccess) name:kEOLogoutSuccessNotification object:nil];
    //
    //支付相关通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EOOrderFail:) name:kEOOrderErrorNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EOOrderCompletion:) name:kEOOrderSuccessNotification object:nil];
    
    //facebook分享相关通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EOFacebookShareSuccess) name:kEOFacebookShareSuccessNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EOFacebookShareFail) name:kEOFacebookShareFailNotification object:nil];
    //facebook好友相关通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EOFacebookFriendSuccess:) name:kEOGetFacebookFriendsSuccessNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(EOFacebookFriendFail:) name:kEOGetFacebookFriendsFailNotification object:nil];
}

//***/

- (void)userCenter
{
    [SandClass userCenter];
}

- (void)userLogin
{
    [SandClass login];
    //    [[EOManager sharedInstance] login];
    
}

- (void)facebookShare
{
    
    [SandClass EOFacebookShare:self];
}

- (void)getFacebookFriend
{
    [SandClass EOGetFacebookFriend:self.view];
}

#pragma mark -- 初始化配置
- (void)EOInitSDK
{
    
    
    //--------- Debug -------------//
    //            EOInitConfig *config = [EOInitConfig new];
    //            config.gameCode         = @"EMDXC";
    //            config.gameKey          = @"xG5D357P";
    //            config.gameName         = @"测试专用";//游戏名
    //            config.gameLanguage     = @"en-us";
    //            config.debugMode        = YES;    //正式环境时请填NO
    //            [SandClass initWithConfig:config];
    // -------------------------------  //
    
    
    
    //-------------  Relese-----------------------
    
    EOInitConfig *config = [EOInitConfig new];
    
    config.gameCode         = @"EMDXC";
    config.gameKey          = @"ybpmd73B8j13"; // ybpmd73B8j13
    //    config.gameName         = @"Endless War"; //游戏名
    config.gameName = @"萌斗魏蜀吴";
    config.gameLanguage     = @"en-us";
    config.debugMode        = NO;    //正式环境时请填NO
    
    [SandClass initWithConfig:config];
}

- (void)EOPayment
{
    
    //#pragma mark JSON字符串转NSDictionary
    NSDictionary *demoDic = [SandClass dictionaryFromString:@"{\"url\":\"http://www.baidu.com\"}"];
    
#warning C字符串转NSString的按照下面这种方式,否则会出现乱码
    const char *cString = "这是一个C字符串,c string";
    NSString *nsstring2 = [NSString stringWithCString:cString encoding:NSUTF8StringEncoding];
    
    NSString* seed        = [NSString stringWithFormat:@"%.0f", [[NSDate date] timeIntervalSince1970]];
    NSString* gameOrderNO = [NSString stringWithFormat:@"sdkDemo13%@", seed];
    
    NSString *role        = [NSString stringWithFormat:@"%.0f",([[NSDate date] timeIntervalSince1970])/1000];
    NSString *roleName    = [NSString stringWithFormat:@"sdkDemo%@",role];
    EORoleInfo* roleInfo  = [EORoleInfo new];
    roleInfo.roleId       = @"1";
    roleInfo.roleName     = roleName;
    roleInfo.roleLevel    = @99;
    roleInfo.serverId     = @"emdxctest";
    
    EOPayInfo *payInfo    = [EOPayInfo new];
    payInfo.gameOrderNO   = gameOrderNO;                   //游戏支付订单号，数字字母或下划线组成，不要包含特殊字符，空格，或传输需编码的字符
    payInfo.productId     = @"com.zwzj.pay8";       //商品id，苹果支付支付需要用到.
    payInfo.productName   = @"6元";                  //商品名称，某些渠道下会显示给用户
    payInfo.price         = @4999;
    
    //    payInfo.productId    = @"com.iOS.yuanbao1000";
    //    payInfo.productName    = @"com.iOS.yuanbao1000";
    //    payInfo.price         = @1000;                         //商品价格,单位是分(整数) 例如:6元的道具 传入@600
    
    UInt64 recordTime     = [[NSDate date] timeIntervalSince1970] * 1000;
    NSString *time        = [NSString stringWithFormat:@"%llu",recordTime];
    payInfo.productExt    = [NSString stringWithFormat:@"{test: %@}",time];//扩展字段，建议使用json字符串
    
    [SandClass payWithRoleInfo:roleInfo payInfo:payInfo];
    
}

//设置SDK运行时语言。
- (void) EOLanguage
{
    [SandClass gameLanguage:@"zh-cn"];
    
}

//发送进入游戏日志。
- (void) entryGame
{
    EORoleInfo* roleInfo = [EORoleInfo new];
    roleInfo.roleId = @"game_id_000001";
    roleInfo.roleName = @"roleName";
    roleInfo.roleLevel = @16;
    roleInfo.serverId = @"001";
    roleInfo.serverName = @"测试服01";
    [SandClass EOEntryGame:roleInfo];
}

//发送创角日志。
- (void) createRoleInGame
{
    EORoleInfo* roleInfo = [EORoleInfo new];
    roleInfo.roleId = @"game_id_000002";
    roleInfo.roleName = @"roleName2";
    roleInfo.roleLevel = @1;
    roleInfo.serverId = @"001";
    roleInfo.serverName = @"测试服01";
    [SandClass EOCreateRole:roleInfo];
}

//退出游戏。
- (void) quitGame
{
    [SandClass EOQuitGame];
}

#pragma mark 处理"初始化完成通知"
- (void)EOInitCompletion {
#pragma mark 在接收到"初始化完成通知"后调用login接口
    NSLog(@"初始化完成");
}

- (void)EOUnInit {
    //无返回数据
    NSLog(@"未初始化");
}

#pragma mark -- 实现处理登陆通知的方法
- (void)EOLoginSuccess:(NSNotification *)notify {
    /*
     返回数据类型为NSDictionary包含以下字段:
     tk 登录token
     */
    
    NSDictionary *resultDic = notify.object;
    NSString *token = [resultDic valueForKey:@"tk"];
    
    NSLog(@"token = %@",token);
    
    //    //TODO: 模拟去服务端验证登录的token是否正确
    //    [self checkToken:token];
    
    //如果测试阶段支付过程中提示"当前支付未完成,请重新进入游戏或联系客服"
    //在登录完成后调用下面的方法
    [SandClass debugDeleteUnCompleteOrder];
    
}

- (void)EOLoginFail:(NSNotification *)notify
{
    //返回具体的登录失败原因,NSString类型
    NSString *errorMsg = notify.object;
    NSLog(@"%@",[NSString stringWithFormat:@"登录失败 失败原因:%@",errorMsg]);
}

- (void)EOUnLogin
{
    //无返回数据
    NSLog(@"未登录");
}

#pragma mark -- 实现处理登出通知的方法
- (void)EOLogOutSuccess
{
    //无返回数据
    NSLog(@"登出成功");
    
    //    [SandGlass login];
}


#pragma mark -- 实现处理订单相关通知的方法
- (void)EOOrderFail:(NSNotification *)notify {
    
    //返回订单失败原因，NSString类型
    NSString *errorMsg = notify.object;
    NSLog(@"订单失败 失败原因notify.object = %@",errorMsg);
    if(notify.userInfo)
    {
        NSLog(@"订单失败 失败原因userInfo = %@",notify.userInfo);
    }
}

- (void)EOOrderCompletion:(NSNotification *)notify {
    
    /*
     返回SGPayInfo类型数据，和发起支付接口传入的payInfo数据一致
     以下为SGPayInfo包含的字段
     */
    
    EOPayInfo *payInfo = (EOPayInfo *)notify.object;
    
    NSLog(@"订单成功 userInfo = %@",notify.userInfo);
    
    NSString *gameOrderNO = payInfo.gameOrderNO;        //CP订单号
    NSString *productId = payInfo.productId;            //内购商品ID
    NSString *productName = payInfo.productName;        //内购商品名
    NSString *productDesc = payInfo.productDesc;        //内购商品描述
    NSString *productExt = payInfo.productExt;          //扩展字段
    NSString *sdkExt = payInfo.sdkExt;                  //SDK扩展字段
    NSUInteger price = [payInfo.price integerValue];    //订单价格，单位为分
}

#pragma mark  facebook
- (void) EOFacebookShareFail
{
    NSLog(@"facebook分享失败");
}

- (void) EOFacebookShareSuccess
{
    NSLog(@"facebook分享成功");
}

- (void) EOFacebookFriendFail:(NSNotification *)notify
{
    NSLog(@"获取facebook好友失败");
    NSLog(@"msg = %@",notify.object);
}

- (void) EOFacebookFriendSuccess:(NSNotification *)notify
{
    NSLog(@"获取facebook好友成功");
    NSLog(@"friends = %@",notify.object);  // 返回一个用户数组,包括了当前玩家的信息，格式：  ({ln = "xxx";picture="https://xxx";uid = xx},{...},...)  ln为用户昵称，uid为用户userID，picture为头像地址。
    NSArray* friends = (NSArray*)notify.object;
    NSDictionary* friendInfo = (NSDictionary*)friends[0];
    NSLog(@"uid = %@ , ln = %@, img = %@",[friendInfo valueForKey:@"uid"],[friendInfo valueForKey:@"ln"],[friendInfo valueForKey:@"picture"]);
    
}

#pragma mark 设置横竖屏
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;//横屏
    //        return UIInterfaceOrientationMaskPortrait;//竖屏
}

#pragma mark -- 移除观察者
- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kEOInitCompletionNotification  object:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kEOUnInitNotification object:self];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kEOLoginSuccessNotification object:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kEOLoginErrorNotification   object:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kEOUnLoginNotification object:self];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kEOLogoutSuccessNotification   object:self];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kEOOrderSuccessNotification   object:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kEOOrderErrorNotification     object:self];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kEOFacebookShareFailNotification   object:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kEOFacebookShareSuccessNotification     object:self];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kEOGetFacebookFriendsSuccessNotification   object:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kEOGetFacebookFriendsFailNotification     object:self];
}

#pragma make  模仿游戏服务端验证获取userid的过程,(此处操作请放到服务端)
- (void) checkToken:(NSString* )token
{
    NSString *checkUrl = @"http://testapps.sgplayer.com/apps/getUidByToken.do";
    NSMutableURLRequest *resuest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:checkUrl]];
    [resuest setHTTPMethod:@"post"];
    NSString *time = @"987654321";
    NSString * sign = [self md5:[NSString stringWithFormat:@"%@%@%@%@",@"tszy",@"3TdCksuoEst",time,token]];
    NSString * postData =  [NSString stringWithFormat:@"gc=tszy&tk=%@&t=%@&sk=%@",token,time,sign];
    
    NSData *tempData = [postData dataUsingEncoding:NSUTF8StringEncoding];
    [resuest setHTTPBody:tempData];
    NSURLResponse *response = nil;
    
    NSError *error;
    NSData *data = [NSURLConnection sendSynchronousRequest:resuest returningResponse:&response error:&error];
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    NSLog(@"check token data = %@",dict);
    if([[dict valueForKey:@"code"] intValue] == 10000)
    {
        userId = [[dict valueForKey:@"data"] valueForKey:@"uid"];
    }
    else
    {
        NSLog(@"check token fial, msg = %@",[data valueForKey:@"msg"]);
    }
}

- (NSString *)md5:(NSString *)string
{
    const char *cStr = [string UTF8String];
    unsigned char result[16];
    
    CC_MD5(cStr,(int)strlen(cStr),result);
    
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]];
}

@end

