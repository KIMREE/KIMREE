//
//  AppSettings.h
//  haitaotong
//
//  Created by 淘海科技 on 13-11-28.
//  Copyright (c) 2013年 淘海科技. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppHelper : NSObject

@property (nonatomic,readonly) NSString *qua; // 客户端标识
@property (nonatomic,strong) NSString *uid; // 用户ID,第一次用户ID填0
@property (nonatomic,strong) NSString *sid; // 用户会话，用于登录同步

+ (AppHelper *) sharedInstance;

@end
