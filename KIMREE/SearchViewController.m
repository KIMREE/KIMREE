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

    [self.navigationController  setToolbarHidden:YES animated:YES];
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"about" style:UIBarButtonItemStylePlain target:self action:nil];
    
    UISearchBar *searchBar=[[UISearchBar alloc] initWithFrame:CGRectMake(0, 60, self.view.bounds.size.width, 50)];
    [self.view addSubview:searchBar];

}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)area:(id)sender {

}

- (IBAction)state:(id)sender {
 
}


- (IBAction)country:(id)sender {
    
}



@end
