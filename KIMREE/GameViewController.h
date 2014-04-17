//
//  GameViewController.h
//  KIMREE
//
//  Created by renchunyu on 14-4-15.
//  Copyright (c) 2014年 renchunyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlaneGameViewController.h"
#import "M2ViewController.h"

@interface GameViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *list;

@end
