//
//  PushServer.m
//  KIMREE
//
//  Created by JIRUI on 14-4-18.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "PushServer.h"
//#import "OrderDetailViewController.h"
//#import "GoodsDetailViewController.h"
//#import "THWebViewController.h"
//#import "OrderServer.h"
//#import "GoodsServer.h"

#define PUSH_TYPE_ORDER 0
#define PUSH_TYPE_GOODS 1
#define PUSH_TYPE_INFOS 2

#define PARAMS @"params"
#define PARAMS_TYPE @"type"
#define PARAMS_VALUE @"value"

static PushServer *instance;

@interface PushServer ()<UIAlertViewDelegate>
@property(nonatomic,strong) NSDictionary *params;
@end

@implementation PushServer

+ (PushServer *)sharedInstance
{
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[PushServer alloc] init];
  });
  return instance;
}

- (void)didReceiveRemoteNotification:(NSDictionary *)userInfo
{
  [UIApplication sharedApplication].applicationIconBadgeNumber += 1;
  [[UIApplication sharedApplication] cancelAllLocalNotifications];
  NSLog(@"userInfo:%@",userInfo);
  NSDictionary *theParams = [userInfo objectForKey:PARAMS];
  if (theParams) {
    self.params = theParams;
    //程序为激活状态，弹窗提示
    if ([UIApplication sharedApplication].applicationState == UIApplicationStateActive) {
      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"新信息" message:[[userInfo objectForKey:@"aps"] objectForKey:@"alert"] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"查看", nil];
      [alert show];
    }
    else{
      [self handleNotification];
    }
  }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
  if (buttonIndex == 1) {
    [self handleNotification];
  }
  else{
    [UIApplication sharedApplication].applicationIconBadgeNumber -= 1;
  }
}

//处理推送通知
- (void)handleNotification
{
  [UIApplication sharedApplication].applicationIconBadgeNumber -= 1;
//  THViewController *targetVC = nil;
  NSInteger type = [[self.params valueForKey:PARAMS_TYPE] integerValue];
  NSString *value = [self.params valueForKey:PARAMS_VALUE];
  switch (type) {
    case PUSH_TYPE_ORDER: {
//      targetVC = [[OrderDetailViewController alloc] init];
//      OrderModel *order = [[OrderServer sharedInstance] orderWithId:value];
//      if (order == nil) {
//        order = [[OrderModel alloc] init];
//        order.orderId = value;
//        [[OrderServer sharedInstance].allOrderList insertObject:order atIndex:0];
//        [[OrderServer sharedInstance] saveOrders];
//      }
//      [(OrderDetailViewController *)targetVC setOrder:order];
    }
      break;
    case PUSH_TYPE_GOODS: {
//      targetVC = [[GoodsDetailViewController alloc] init];
//      GoodsModel *goods = [[GoodsServer sharedInstance] goodsWithGid:value];
//      if (goods == nil) {
//        goods = [[GoodsModel alloc] init];
//        goods.goodsId = value;
//        [[GoodsServer sharedInstance] insertGoods:goods];
//      }
//      [(GoodsDetailViewController *)targetVC setGoods:goods];
    }
      break;
    case PUSH_TYPE_INFOS: {
//      targetVC = [[THWebViewController alloc] init];
//      [(THWebViewController *)targetVC setUrl:value];
    }
      break;
    default:
      break;
  }
//  if (targetVC) {
//    UINavigationController *rootNavController = (UINavigationController *)[S_APPDELEGATE.tabBarController selectedViewController];
//    [rootNavController pushViewController:targetVC animated:YES];
//  }
}


@end
