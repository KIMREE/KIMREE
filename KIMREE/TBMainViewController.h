//
//  TBMainViewController.h
//  baiduTieba
//
//  Created by Kevin Lee on 13-5-14.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TBViewController;

@interface TBMainViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property(strong, nonatomic) TBViewController *tableviewVC;
@property (strong, nonatomic) IBOutlet UIButton *btn_fresh;
@property (strong, nonatomic) IBOutlet UIImageView *pic_fresh;

@end
