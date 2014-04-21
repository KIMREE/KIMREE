//
//  AppDelegate.m
//  KIMREE
//
//  Created by JIRUI on 14-4-7.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//
#import "AppDelegate.h"
#import "AppHelper.h"
#import "ArchiveServer.h"
#import "AppInfoModel.h"
#import "AppServer.h"
#import "LaunchView.h"
#import "GuideView.h"
#import "PushServer.h"
@interface AppDelegate ()<LaunchViewDelegate,GuideViewDelegate,UIAlertViewDelegate>{
    /*
     1.收集是否有通知
     2.用于网络连接状态判断
     */
    NSDictionary *remoteNotificationUserInfo;
    Reachability *hostReach;
}
@end


@implementation AppDelegate
@synthesize navController = _navController;
@synthesize rootController = _rootController;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    //设置状态栏样式
    [UIApplication sharedApplication].statusBarHidden = NO;
    if ([SystemHelper systemVersion] >= 7.0f){
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }
    
    //设置状态栏通知样式
    [JDStatusBarNotification setDefaultStyle:^JDStatusBarStyle *(JDStatusBarStyle *style){
        style.barColor = [UIColor blackColor];
        style.textColor = [UIColor whiteColor];
        style.animationType = JDStatusBarAnimationTypeMove;
        style.font = [UIFont systemFontOfSize:12];
        return style;
    }];
    
    
    [self.window makeKeyAndVisible];
    
    //启动动画、渐渐消失
    LaunchView *launchView = [[LaunchView alloc] initWithDelegate:self];
    [launchView showInView:self.window delay:1.f];
    
    //配置信息
    [self config];
    
    //启动网络连接状况监听
    [self startNetStatusListener];
    
    
    return YES;
}

//获取token回调
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    //保存token
    NSString *newToken = [NSString stringWithFormat:@"%@",deviceToken];
    [S_USER_DEFAULTS setObject:newToken forKey:UDK_TOKEN];
    
    //获取用户是否接收运单推送消息，默认是打开
    NSNumber *pushOpened = [S_USER_DEFAULTS objectForKey:UDK_PUSH_OPENED];
    if (pushOpened == nil) {
        pushOpened = [NSNumber numberWithBool:YES];
        [S_USER_DEFAULTS setObject:pushOpened forKey:UDK_PUSH_OPENED];
    }
    [S_USER_DEFAULTS synchronize];
    
    //反馈给服务器
    [[AppServer sharedInstance]
     reportToken:newToken
     status:pushOpened
     failed:^(NSString *msg){
     }
     finished:^(void){
     }];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
}

//收到推送通知、推送类型包括运单、商品、信息
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [[PushServer sharedInstance] didReceiveRemoteNotification:userInfo];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma LaunchViewDelegate method
- (void)launchViewWillDisappear:(LaunchView *)launchView{
    //初始化RootViewController
    [self createRootViewController];
    
    //判断是否第一次启动2.0版本程序
    if ([GuideView isFirstLaunchApp]) {
        NSArray *array = nil;
        if ([SystemHelper isLongScreen]) {
            array = [NSArray arrayWithObjects:F_IMG(@"guide1-h.png"),F_IMG(@"guide2-h.png"),F_IMG(@"guide3-h.png"),F_IMG(@"guide4-h.png"), nil];
        }
        else{
            array = [NSArray arrayWithObjects:F_IMG(@"guide1.png"),F_IMG(@"guide2.png"),F_IMG(@"guide3.png"),F_IMG(@"guide4.png"), nil];
        }
        GuideView *guideView = [[GuideView alloc] initWithImages:array delegate:self];
        [guideView showInView:self.window];
    }
    [self.window bringSubviewToFront:launchView];
}

- (void)launchViewDidDisappear:(LaunchView *)launchView
{
    //通过推送通知启动程序，如果不是第一次启动2.0版本，那么处理推送通知
    if (![GuideView isFirstLaunchApp] && remoteNotificationUserInfo) {
        [[PushServer sharedInstance] didReceiveRemoteNotification:remoteNotificationUserInfo];
    }
}

- (void)guideViewWillDisappear:(GuideView *)guideView
{
}

- (void)guideViewDidDisappear:(GuideView *)guideView
{
    //设置第一次启动标识
    [S_USER_DEFAULTS setBool:YES forKey:@"GuideIsSecondLaunch"];
    [S_USER_DEFAULTS synchronize];
    
    //通过推送通知启动程序，处理推送通知
    if (remoteNotificationUserInfo) {
        [[PushServer sharedInstance] didReceiveRemoteNotification:remoteNotificationUserInfo];
    }
}

#pragma mark-

/*
 * @brief 配置信息
 */
- (void)config{
    //如果uid为0，则注册一个uid
    [self configUID];
    
    //配置通知
    [self configNotification];
}

/*
 * @brief 第一次安装应用，注册uid    [[AppHelper sharedInstance].uid isEqual:@"0"]
 */
- (void)configUID{
    if ([[AppHelper sharedInstance].uid isEqual:@"0"]) {
        [[AppServer sharedInstance]
         registerUidWithFailed:^(NSString *msg){
             THLog(@"register uid error msg=%@",msg);
         }
         finished:^(NSString *uid){
             [AppHelper sharedInstance].uid = uid;
             [self updateBaseInfo:NO];
             
         }];
    }
}

/*
 * @brief 注册通知
 */
- (void)configNotification
{
    //注册推送通知
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationType)(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
}

/*
 * @brief 启动网络状态监听
 */
- (void)startNetStatusListener
{
    //开启网络状况的监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    hostReach = [Reachability reachabilityWithHostname:@"www.apple.com"];
    [hostReach startNotifier];
}

/*
 * @brief 网络链接改变时会调用的方法
 */
-(void)reachabilityChanged:(NSNotification *)note
{
    THLog(@"reachabilityChanged-------------");
    Reachability *currReach = [note object];
    NetworkStatus status = [currReach currentReachabilityStatus];
    if(status == NotReachable) {
        self.isReachable = NO;
    }
    else{
        self.isReachable = YES;
    }
}

/*
 * @brief 获取基本信息
 */
- (void)updateBaseInfo:(BOOL)showed
{
    if ([[AppHelper sharedInstance].uid isEqualToString:@"0"]) {
        return;
    }
    if (showed) {
        [SVProgressHUD showWithStatus:@"正在检查..."];
    }
    [[AppServer sharedInstance]
     appInfoWithFailed:^(NSString *msg){
         if (showed) {
             [SVProgressHUD dismiss];
         }
     }
     finished:^(AppInfoModel *appInfo){
         if (showed) {
             [SVProgressHUD dismiss];
         }
         if ([appInfo.updateFlag integerValue] == 1) {
             UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"版本更新" message:appInfo.updateText delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"查看", nil];
             av.tag = 0;
             [av show];
         }
         else if ([appInfo.updateFlag integerValue] == 2) {
             UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"版本更新" message:appInfo.updateText delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
             av.tag = 1;
             [av show];
         }
         else{
             if (showed) {
                 UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"版本更新" message:@"当前是最新版本" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                 [av show];
             }
         }
     }];
}
//创建主视图
- (void)createRootViewController{
    //初始化主视图
    self.rootController = [[MainViewController alloc]initWithNibName:@"MainViewController" bundle:nil];
    self.navController = [[UINavigationController alloc]initWithRootViewController:_rootController];
    self.navController.navigationBar.hidden = YES;
    self.window.rootViewController = _navController;
}

#pragma mark-
#pragma mark UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    AppInfoModel *appInfo = [[AppServer sharedInstance] appInfo];
    if ((alertView.tag == 0 && buttonIndex == 1)||alertView.tag == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:appInfo.updateUrl]];
    }
}
@end
