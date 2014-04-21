//
//  UserModel.m
//  KIMREE
//
//  Created by JIRUI on 14-4-16.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
@synthesize userId,userSid,userVid,userName,userEmail,userPicUrl,isNewUser;

/*
 *@brief 将Dictionary数据转换到模型字段
 */
- (void)loadData:(NSDictionary *)dict
{
  self.userId = [dict valueForKey:@"uid"];
  self.userSid = [dict valueForKey:@"sid"];
  self.userVid = [dict valueForKey:@"vid"];
  self.userName = [dict valueForKey:@"name"];
  self.userEmail = [dict valueForKey:@"email"];
  self.userPicUrl = [dict valueForKey:@"pic"];
  self.isNewUser = [[dict valueForKey:@"isnewuser"] boolValue];
  self.platform = [dict valueForKey:@"media_type"];
}
@end
