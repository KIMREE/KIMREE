//
//  TabBarController.m
//  KIMREE
//
//  Created by renchunyu on 14-4-11.
//  Copyright (c) 2014年 renchunyu. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController

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
   
    
    SearchViewController *searchVC=[[SearchViewController alloc] init];
    MyshopViewController *myshopVC=[[MyshopViewController alloc] init];
    NearbyViewController *nearbyVC=[[NearbyViewController alloc] init];
    NSArray* controllerArray = [[NSArray alloc]initWithObjects:nearbyVC,searchVC,myshopVC,nil];
    self.viewControllers = controllerArray;
    self.selectedIndex = 0;
    [(UITabBarItem *)[self.tabBar.items objectAtIndex:0] setTitle:@"附近"];
    [(UITabBarItem *)[self.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"pin.png"]];
    [(UITabBarItem *)[self.tabBar.items objectAtIndex:1] setTitle:@"商户列表"];
    [(UITabBarItem *)[self.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"pin.png"]];
    [(UITabBarItem *)[self.tabBar.items objectAtIndex:2] setTitle:@"我的商户"];
    [(UITabBarItem *)[self.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"pin.png"]];
    UIViewController* activeController = self.selectedViewController;
    if(activeController == searchVC){
        //
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
