//
//  DateTimeHelper.m
//  Smoking
//
//  Created by JIRUI on 14-4-1.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "DateTimeHelper.h"

@implementation DateTimeHelper
//（获得时间的长短）
+ (NSString *)formatStringWithDate:(NSDate *)date {
  NSString *result;
  NSTimeInterval interval = -[date timeIntervalSinceNow];
  if (interval<0 || !date) {
    result = @"";
  }else if (interval<60) {
    result = @"刚刚";
  }else if (interval/60<60) {
    //小于60分钟
    result = [NSString stringWithFormat:@"%d分钟前",(int)interval/60];
  }else if(interval/60/60<24){
    //小于24小时
    result = [NSString stringWithFormat:@"%d小时前",(int)interval/60/60];
  }else{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    result = [formatter stringFromDate:date];
  }
  
  return result;
}

//设置日期的格式
+ (NSString *)stringWithDate:(NSDate *)date format:(NSString *)format
{
  
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:format];
  NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
  [formatter setTimeZone:timeZone];
  return [formatter stringFromDate:date];
}

//中间持续天数
+ (NSInteger)daysFromDate:(NSDate *) startDate toDate:(NSDate *) endDate {
  NSTimeInterval start = [startDate timeIntervalSince1970];
  NSTimeInterval over = [endDate timeIntervalSince1970];
  NSInteger days = ceil((over - start)/(24*60*60));
  return days;
}

@end












