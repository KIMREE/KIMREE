//
//  AppSettings.m
//  haitaotong
//
//  Created by 淘海科技 on 13-11-28.
//  Copyright (c) 2013年 淘海科技. All rights reserved.
//

#import "AppHelper.h"
#import "SystemHelper.h"

static AppHelper *_sharedInstance = nil;

@implementation AppHelper
@synthesize qua = _qua;
@synthesize uid = _uid;
@synthesize sid = _sid;

+ (AppHelper *)sharedInstance
{
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    _sharedInstance = [[AppHelper alloc] init];
  });
  return _sharedInstance;
}

//qua
- (NSString *)qua
{
  NSString *str = F_UD_STR(UDK_QUA);
  if (str == nil) {
    str = [self configQua];
    [S_USER_DEFAULTS setObject:str forKey:UDK_QUA];
    [S_USER_DEFAULTS synchronize];
  }
  return str;
}
//构造设备标识
- (NSString *)configQua
{
  CGRect rect_screen = [[UIScreen mainScreen]bounds];
  NSString *wh = [NSString stringWithFormat:@"%dx%d", (int)rect_screen.size.width, (int)rect_screen.size.height];
  NSString *mac = [SystemHelper macaddress];
  if ([SystemHelper systemVersion] >= 7.0 || mac == nil) {
    mac = [S_USER_DEFAULTS objectForKey:@"UUIDForMac"];
    if (mac == nil) {
      mac = [SystemHelper uuid];
      [S_USER_DEFAULTS setObject:mac forKey:@"UUIDForMac"];
    }
  }
  NSString *qua = [NSString stringWithFormat:@"1|%f|%@|%@|%@|%@|%@|%@|%@|%@|%@|%lu", [SystemHelper systemVersion], [SystemHelper appName], [SystemHelper buildVersion], [SystemHelper currentLanguage], [SystemHelper currentTimeZone], wh, [[UIDevice currentDevice] model], [SystemHelper uniqueGlobalDeviceIdentifier], mac, CONFIG_CHANNEL, time(NULL)];
  return qua;
}

//uid
- (NSString *)uid
{
  NSString *str = [S_USER_DEFAULTS stringForKey:UDK_UID];
  if (str.length == 0) {
    str = @"0";
  }
  return str;
}
- (void)setUid:(NSString *)uid
{
  if (uid.length != 0) {
    [S_USER_DEFAULTS setObject:uid forKey:UDK_UID];
    [S_USER_DEFAULTS synchronize];
  }
}

//sid
- (NSString *)sid
{
  NSString *str = [S_USER_DEFAULTS stringForKey:UDK_SID];
  if (str.length == 0) {
    str = @"0";
  }
  return str;
}
- (void)setSid:(NSString *)sid
{
  if (sid.length != 0) {
    [S_USER_DEFAULTS setObject:sid forKey:UDK_SID];
    [S_USER_DEFAULTS synchronize];
  }
}

@end















