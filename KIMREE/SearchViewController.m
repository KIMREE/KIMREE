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





///*搜索按钮*/
//- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
//    [self doSearch:searchBar];
//}
//
///*键盘搜索按钮*/
//- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
//    [searchBar resignFirstResponder];
//    [self doSearch:searchBar];
//}
//
///*搜索*/
//- (void)doSearch:(UISearchBar *)searchBar{
//    NSString *email = searchBar.text;
//   
//}


@end
