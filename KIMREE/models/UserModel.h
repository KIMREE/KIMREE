//
//  UserModel.h
//  KIMREE
//
//  Created by JIRUI on 14-4-16.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "JRModel.h"

@interface UserModel : JRModel
@property(nonatomic,strong) NSString *userId; //用户uid
@property(nonatomic,strong) NSString *userSid; //用户会话id
@property(nonatomic,strong) NSString *userVid; //用户收藏id
@property(nonatomic,strong) NSString *userName; //用户名称
@property(nonatomic,strong) NSString *userEmail; //用户邮箱地址
@property(nonatomic,strong) NSString *userPicUrl; //用户头像URL
@property(nonatomic,assign) BOOL isNewUser; //是否是新用户
@property(nonatomic,strong) NSString *platform;
@end
