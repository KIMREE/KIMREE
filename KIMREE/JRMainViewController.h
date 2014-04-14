//
//  TBMainViewController.h
//  KIMREE
//
//  Created by JIRUI on 14-4-9.
//  Copyright (c) 2014年 JIRUI. All rights reserved.
//  、

#import <UIKit/UIKit.h>
@class JRViewController;

@interface JRMainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(strong, nonatomic) JRViewController *tableviewVC;
@property (strong, nonatomic) IBOutlet UIButton *btn_fresh;
@property (strong, nonatomic) IBOutlet UIImageView *pic_fresh;

@end
