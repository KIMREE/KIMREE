//
//  ProductViewController.h
//  KIMREE
//
//  Created by renchunyu on 14-4-15.
//  Copyright (c) 2014年 renchunyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HotSaleViewController.h"
#import "RankViewController.h"
#import "FavoriteViewController.h"
#import "MemberViewController.h"

@protocol ProductViewControllerDelegate <NSObject>

- (IBAction)member:(id)sender;

@end

@interface ProductViewController : UITabBarController


@end
