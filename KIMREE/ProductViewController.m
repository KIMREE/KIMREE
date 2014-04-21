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
<<<<<<< HEAD
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
    
     self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc] initWithTitle:@"LogIn" style:UIBarButtonItemStylePlain target:self action:@selector(signIn:)];
=======
     webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
  
      NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://baidu.com"]];
    [self.view addSubview: webView];
    [webView loadRequest:request];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
>>>>>>> gouwenqi
}



-(IBAction)signIn:(id)sender{
    
    self.navigationController.navigationBar.hidden = NO;
    MemberViewController *secVC = [[MemberViewController alloc] init];
    [self.navigationController pushViewController:secVC animated:YES];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
