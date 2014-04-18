//
//  ErrorHelper.m
//  KIMREE
//
//  Created by JIRUI on 14-4-18.
//  Copyright (c) 2014年 JIRUI. All rights reserved.
//

#import "ErrorHelper.h"

@implementation ErrorHelper
+ (NSString *)messageWithCode:(NSInteger)code
{
  NSString *msg = @"未知错误";
  switch (code) {
    case ERROR_CODE_SUCCESS:
      msg = @"成功";
      break;
    case ERROR_CODE_CONNECT_FAILED:
      msg = @"目前网络连接不稳定，请稍后重试。";
      break;
    case ERROR_CODE_CONNECT_TIMEOUT:
      msg = @"目前网络连接不稳定，请稍后重试。";
      break;
    case ERROR_CODE_API_FAILED:
      msg = @"接口出错";
      break;
    case ERROR_CODE_NULL:
      msg = @"返回数据格式错误";
    default:
      break;
  }
  return msg;
}
@end
