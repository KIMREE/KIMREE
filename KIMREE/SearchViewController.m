//
//  SearchViewController.m
//  KIMREE
//
//  Created by renchunyu on 14-4-9.
//  Copyright (c) 2014年 renchunyu. All rights reserved.
//

#import "SearchViewController.h"


@interface SearchViewController ()

@end

@implementation SearchViewController
@synthesize pickerView;


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
    
    //增加工具栏按钮
    [self.navigationController  setToolbarHidden:YES animated:YES];
    
    //为导航栏添加右侧按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"about" style:UIBarButtonItemStylePlain target:self action:nil];
    
    //为工具栏添加按钮
    UIBarButtonItem *location = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:@selector(location)];
    
    
    UIBarButtonItem *search = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:nil action:@selector(search)];
    UIBarButtonItem *myshop = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:nil action:@selector(myshop)];
    
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    
    toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0, self.view.frame.size.height - toolBar.frame.size.height - 44.0, self.view.frame.size.width, 44.0)];
    [toolBar setBarStyle:UIBarStyleDefault];
    toolBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    
    [toolBar setItems:[NSArray arrayWithObjects:flexItem, location, flexItem, search, flexItem, myshop, flexItem, nil] animated:YES];
    
    [self.view addSubview:toolBar];
   
    //先隐藏,未起作用，待解决
    self.pickerView.frame = CGRectMake(0, 480, 320, 260);}


//跳转地图

- (void)location
{
    
    [self.navigationController popViewControllerAnimated:YES];
   
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)area:(id)sender {
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.6];//动画时间长度，单位秒，浮点数
    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    self.pickerView.frame = CGRectMake(0, 245, 320, 260);
    
    [UIView setAnimationDelegate:self];
    // 动画完毕后调用animationFinished
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView commitAnimations];
    //    [self ViewAnimation:self.pickerView willHidden:NO];
}

- (IBAction)state:(id)sender {
    //    [self ViewAnimation:self.pickerView willHidden:YES];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:nil context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:0.6];//动画时间长度，单位秒，浮点数
    self.pickerView.frame = CGRectMake(0, 480, 320, 260);
    
    [UIView setAnimationDelegate:self];
    // 动画完毕后调用animationFinished
    [UIView setAnimationDidStopSelector:@selector(animationFinished)];
    [UIView commitAnimations];
}


- (IBAction)country:(id)sender {
}

-(void)animationFinished{
    NSLog(@"动画结束!");
}


@end
