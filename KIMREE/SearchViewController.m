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
}


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

@end
