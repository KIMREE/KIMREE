//
//  MyshopViewController.m
//  KIMREE
//
//  Created by renchunyu on 14-4-9.
//  Copyright (c) 2014年 renchunyu. All rights reserved.
//

#import "MyshopViewController.h"

@interface MyshopViewController ()

@end

@implementation MyshopViewController

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
    
    self.view.backgroundColor=[UIColor grayColor];
    UITextField *userbox=[[UITextField alloc] initWithFrame:CGRectMake(30, 170, 260, 30)];
    UITextField  *passwordbox=[[UITextField alloc] initWithFrame:CGRectMake(30, 210, 260, 30)];
    
    [userbox setBorderStyle:UITextBorderStyleRoundedRect]; //外框类型
    userbox.placeholder = @"email"; //默认显示的字
    userbox.autocorrectionType = UITextAutocorrectionTypeNo;
    userbox.autocapitalizationType = UITextAutocapitalizationTypeNone;
    userbox.returnKeyType = UIReturnKeyDone;
    userbox.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
  
    [passwordbox setBorderStyle:UITextBorderStyleRoundedRect]; //外框类型
    passwordbox.placeholder = @"password"; //默认显示的字
    passwordbox.secureTextEntry = YES; //密码
    passwordbox.autocorrectionType = UITextAutocorrectionTypeNo;
    passwordbox.autocapitalizationType = UITextAutocapitalizationTypeNone;
    passwordbox.returnKeyType = UIReturnKeyDone;
    passwordbox.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
    
  
    [self.view addSubview:userbox];
     [self.view addSubview:passwordbox];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
