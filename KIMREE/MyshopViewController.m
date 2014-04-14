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


-(void)checkboxClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor=[UIColor grayColor];
    UITextField *userbox=[[UITextField alloc] initWithFrame:CGRectMake(30, 180, 260, 30)];
    UITextField  *passwordbox=[[UITextField alloc] initWithFrame:CGRectMake(30, 230, 260, 30)];
    
    [userbox setBorderStyle:UITextBorderStyleRoundedRect];
    userbox.placeholder = @"email";
    userbox.autocorrectionType = UITextAutocorrectionTypeNo;
    userbox.autocapitalizationType = UITextAutocapitalizationTypeNone;
    userbox.returnKeyType = UIReturnKeyDone;
    userbox.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
  
    [passwordbox setBorderStyle:UITextBorderStyleRoundedRect];
    passwordbox.placeholder = @"password";
    passwordbox.secureTextEntry = YES;
    passwordbox.autocorrectionType = UITextAutocorrectionTypeNo;
    passwordbox.autocapitalizationType = UITextAutocapitalizationTypeNone;
    passwordbox.returnKeyType = UIReturnKeyDone;
    passwordbox.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
    
  
    [self.view addSubview:userbox];
    [self.view addSubview:passwordbox];
    
    UIButton *checkbox = [UIButton buttonWithType:UIButtonTypeCustom];
    
    CGRect checkboxRect = CGRectMake(30, 285, 20, 20);
    [checkbox setFrame:checkboxRect];
    
    [checkbox setImage:[UIImage imageNamed:@"checkbox_out.png"] forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageNamed:@"checkbox_in.png"] forState:UIControlStateSelected];
    
    [checkbox addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:checkbox];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
