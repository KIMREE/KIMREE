//
//  PushServer.h
//  KIMREE
//
//  Created by JIRUI on 14-4-18.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface PushServer : NSObject
+ (PushServer *)sharedInstance;
- (void)didReceiveRemoteNotification:(NSDictionary *)userInfo;
@end
