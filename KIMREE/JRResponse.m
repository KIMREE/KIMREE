//
//  JRResponse.m
//  KIMREE
//
//  Created by JIRUI on 14-4-15.
//  Copyright (c) 2014年 JIRUI. All rights reserved.
//

#import "JRResponse.h"
#import "ErrorHelper.h"
@implementation JRResponse
/*
 * @brief 根据字典来初始化
 */
- (JRResponse *)initWithData:(id)data
{
  self = [super init];
  if (self) {
    if (data) {
//      if ([data valueForKey:@"ret"]) {
//        self.code = [[data valueForKey:@"ret"] integerValue];
//      }
      if ([data valueForKey:@"code"]) {
        self.code = [[data valueForKey:@"code"] integerValue];
      }
      self.cmd = [data valueForKey:@"cmd"];
      self.timeInterval = [[data valueForKey:@"time"] integerValue];
      self.data = [data valueForKey:@"data"];
    }
    else{
      self.code = -1;
    }
    self.msg = [ErrorHelper messageWithCode:self.code];
  }
  return self;
}
@end
