//
//  TBMainViewController.m
//  KIMREE
//
//  Created by JIRUI on 14-4-14.
//  Copyright (c) 2014年 JIRUI. All rights reserved.
//

#import "TBMainViewController.h"
#import "TBViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface TBMainViewController ()

@end

@implementation TBMainViewController

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
    self.tableviewVC = [[TBViewController alloc] initWithNibName:@"TBViewController" bundle:nil];
    
    self.tableviewVC.tableView.delegate = self.tableviewVC;
    self.tableviewVC.tableView.dataSource = self.tableviewVC;
    [self.view addSubview:self.tableviewVC.view];
    
    [self.btn_fresh setCenter:CGPointMake(self.view.bounds.size.width*6.5/8.0, self.view.bounds.size.height*7.5/10.0)];
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
    
    [self.tableviewVC.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] atScrollPosition:UITableViewScrollPositionMiddle animated:YES];

    [self.tableviewVC resetViewedCells];
}

@end
