//
//  ProductViewController.m
//  KIMREE
//
//  Created by renchunyu on 14-4-15.
//  Copyright (c) 2014年 renchunyu. All rights reserved.
//

#import "ProductViewController.h"

@interface ProductViewController ()

@end

@implementation ProductViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    HotSaleViewController *hotVC=[[HotSaleViewController alloc] init];
    RankViewController *rankVC=[[RankViewController alloc] init];
    FavoriteViewController *favoriteVC=[[FavoriteViewController alloc] init];
    NSArray* controllerArray = [[NSArray alloc]initWithObjects:hotVC,rankVC,favoriteVC,nil];
    self.viewControllers = controllerArray;
    self.selectedIndex = 0;
    [(UITabBarItem *)[self.tabBar.items objectAtIndex:0] setTitle:@"商品"];
    [(UITabBarItem *)[self.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"pin.png"]];
    [(UITabBarItem *)[self.tabBar.items objectAtIndex:1] setTitle:@"排行"];
    [(UITabBarItem *)[self.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"pin.png"]];
    [(UITabBarItem *)[self.tabBar.items objectAtIndex:2] setTitle:@"收藏"];
    [(UITabBarItem *)[self.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"pin.png"]];
    UIViewController* activeController = self.selectedViewController;
    if(activeController == favoriteVC){
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
