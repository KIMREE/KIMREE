//
//  TBMainViewController.h
//  KIMREE
//
//  Created by JIRUI on 14-4-14.
//  Copyright (c) 2014年 JIRUI. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TBViewController;

@interface TBMainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(strong, nonatomic) TBViewController *tableviewVC;
@property (strong, nonatomic) IBOutlet UIButton *btn_fresh;
@property (strong, nonatomic) IBOutlet UIImageView *pic_fresh;

@end
