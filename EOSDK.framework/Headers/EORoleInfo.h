//
//  EORoleInfo.h
//  eoGameDemo
//
//  Created by 刘康逸 on 2020/3/28.
//  Copyright © 2020年 EOGameCompany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EORoleInfo : NSObject

#pragma mark 角色信息
@property (nonatomic, copy) NSString *roleId;
@property (nonatomic, copy) NSString *roleName;
@property (nonatomic, copy) NSNumber *roleLevel;
@property (nonatomic, copy) NSString *serverId;
@property (nonatomic, copy) NSString *serverName;

@end
