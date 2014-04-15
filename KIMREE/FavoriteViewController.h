//
//  FavoriteViewController.h
//  KIMREE
//
//  Created by renchunyu on 14-4-15.
//  Copyright (c) 2014年 renchunyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoriteViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *list;


@end
