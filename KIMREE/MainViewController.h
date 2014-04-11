//
//  MainViewController.h
//  KIMREE
//
//  Created by JIRUI on 14-4-7.
//  Copyright (c) 2014年 JIRUI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EScrollerView.h"
//#import "Header.h"
#import "ProductViewController.h"
#import "KIMREEViewController.h"
#import "PostBarViewController.h"
#import "TabBarController.h"
#import "GameViewController.h"


@interface MainViewController : UIViewController <EScrollerViewDelegate>

{
  UITabBarController *tabBarController;
}


- (IBAction)product:(id)sender;
- (IBAction)nearby:(id)sender;
- (IBAction)game:(id)sender;
- (IBAction)KIMREE:(id)sender;
- (IBAction)member:(id)sender;
- (IBAction)PostBar:(id)sender;


@end
