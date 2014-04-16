//
//  LogInViewController.m
//  KIMREE
//
//  Created by renchunyu on 14-4-15.
//  Copyright (c) 2014年 renchunyu. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor =[UIColor grayColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    float m_compensation;
    float m2_compensation;
    
    if (IOS7) {
        m_compensation=0;
    }
    else {
        m_compensation=65.0;
    }
    
    if (IS_INCH4) {
        m2_compensation=0;
    }
    else {
        m2_compensation=50;
    }
    
    logOutBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    logOutBtn.frame = CGRectMake(10, 260-m_compensation-m2_compensation, 300, 40);
    [logOutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
    [logOutBtn setBackgroundImage:[UIImage imageNamed:@"Login_button.png"] forState:UIControlStateNormal];
    [logOutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal] ;
    logOutBtn.BackgroundColor=[UIColor clearColor];
    logOutBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [logOutBtn addTarget:self action:@selector(logOut:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:logOutBtn];
    
}


- (IBAction)logOut:(id)sender {
    
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"退出登录");
    
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
