//
//  EOInitConfig.h
//  eoGameDemo
//
//  Created by 刘康逸 on 2020/3/28.
//  Copyright © 2020年 EOGameCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark -- 初始化配置
@interface EOInitConfig : NSObject

@property (nonatomic, assign)   BOOL debugMode;
@property (nonatomic, copy)     NSString *gameCode;
@property (nonatomic, copy)     NSString *gameKey;
@property (nonatomic, copy)     NSString *gameName;
@property (nonatomic, copy)     NSString *gameLanguage;

- (void)checkParameterHandler:(void(^)(void))handler;

@end
