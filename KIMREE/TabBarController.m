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
    
    //加入一个数组
    NSArray* controllerArray = [[NSArray alloc]initWithObjects:nearbyVC,searchVC,myshopVC,nil];
    
   
    
    //设置UITabBarController控制器的viewControllers属性为我们之前生成的数组controllerArray
    self.viewControllers = controllerArray;
    //默认选择第1个视图选项卡（索引从0开始的）
    self.selectedIndex = 0;
    //设置TabBarItem的标题与图片
    
    [(UITabBarItem *)[self.tabBar.items objectAtIndex:0] setTitle:@"附近"];
    [(UITabBarItem *)[self.tabBar.items objectAtIndex:0] setImage:[UIImage imageNamed:@"pin.png"]];
    [(UITabBarItem *)[self.tabBar.items objectAtIndex:1] setTitle:@"商户列表"];
    [(UITabBarItem *)[self.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"pin.png"]];
    [(UITabBarItem *)[self.tabBar.items objectAtIndex:2] setTitle:@"我的商户"];
    [(UITabBarItem *)[self.tabBar.items objectAtIndex:2] setImage:[UIImage imageNamed:@"pin.png"]];
    
    
    //读取
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
