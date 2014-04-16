//
//  DisplayViewController.m
//  KIMREE
//
//  Created by cool on 14-4-17.
//  Copyright (c) 2014年 cool. All rights reserved.
//

#import "DisplayViewController.h"
#import "TabBarController.h"


@interface DisplayViewController ()

@end

@implementation DisplayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        
        
        self.view.backgroundColor = [UIColor grayColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *getbackBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    getbackBtn.frame =CGRectMake(50, 80, 60, 60);
    getbackBtn.backgroundColor =[UIColor whiteColor];
    [getbackBtn addTarget:self action:@selector(getback:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:getbackBtn];
    
}


-(void)getback:(UIButton *)btn
{
    self.navigationController.navigationBar.hidden = NO;
    TabBarController *firstView=[[TabBarController alloc] init];
    [self presentModalViewController:firstView animated:YES];
  //  [self.navigationController  popToRootViewControllerAnimated:YES];
    //[self.navigationController pushViewController:firstView animated:YES];
 
    
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
