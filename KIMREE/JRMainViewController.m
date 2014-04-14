//
//  TBMainViewController.m
//  KIMREE
//
//  Created by JIRUI on 14-4-9.
//  Copyright (c) 2014年 JIRUI. All rights reserved.
//  、

#import "JRMainViewController.h"
#import "JRViewController.h"
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
@interface JRMainViewController ()

@end

@implementation JRMainViewController

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
    
    // Do any additional setup after loading the view from its nib.
    self.tableviewVC = [[JRViewController alloc] initWithNibName:@"TBViewController" bundle:nil];
    
    self.tableviewVC.tableView.delegate = self.tableviewVC;
    self.tableviewVC.tableView.dataSource = self.tableviewVC;
    [self.view addSubview:self.tableviewVC.view];
    
    [self.btn_fresh setCenter:CGPointMake(285, 510)];

    [self.btn_fresh addSubview:self.pic_fresh];
    
    NSLog(@"%@",NSStringFromCGRect(self.btn_fresh.frame));
    
    [self.view addSubview:self.btn_fresh];
    
//    TBAppDelegate *appDelegate = (TBAppDelegate *)[[UIApplication sharedApplication] delegate];
//    [appDelegate.window addSubview:self.btn_fresh];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btnClick:(id)sender {
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 1.0;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = 1;//HUGE_VALF;
    [self.pic_fresh.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    [self.tableviewVC.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionTop animated:YES];

    [self.tableviewVC resetViewedCells];
}

@end
