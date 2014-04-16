//
//  AppDelegate.h
//  KIMREE
//
//  Created by JIRUI on 14-4-7.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) MainViewController *rootController;
@property (strong, nonatomic) UINavigationController *navController;
@property (nonatomic,assign) BOOL isReachable;//连接状态
@end
