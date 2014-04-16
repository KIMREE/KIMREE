//
//  GetPasswordViewController.m
//  KIMREE
//
//  Created by renchunyu on 14-4-15.
//  Copyright (c) 2014年 renchunyu. All rights reserved.
//

#import "GetPasswordViewController.h"

@interface GetPasswordViewController ()

@end

@implementation GetPasswordViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.backgroundColor=[UIColor grayColor];
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
    
    
    emailbox=[[UITextField alloc] initWithFrame:CGRectMake(10, 150-m_compensation-m2_compensation, 300, 30)];
    [emailbox setBorderStyle:UITextBorderStyleRoundedRect];
    emailbox.placeholder = @"请输入邮箱地址";
    emailbox.autocorrectionType = UITextAutocorrectionTypeNo;
    emailbox.autocapitalizationType = UITextAutocapitalizationTypeNone;
    emailbox.returnKeyType = UIReturnKeyDone;
    emailbox.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
    
    hintlabel=[[UILabel alloc] init];
    hintlabel.text = @"密码重置链接将发送到你的注册的邮箱，如未能收取邮件，请检查垃圾邮件";
    hintlabel.lineBreakMode = NSLineBreakByWordWrapping;
    hintlabel.numberOfLines = 2;
    hintlabel.backgroundColor=[UIColor clearColor];
    hintlabel.textColor=[UIColor whiteColor];
    hintlabel.font = [UIFont systemFontOfSize:14];
    hintlabel.frame =CGRectMake(10, 180-m_compensation-m2_compensation, 300, 60);
    
    resetpsswordBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    resetpsswordBtn.frame = CGRectMake(10, 260-m_compensation-m2_compensation, 300, 40);
    [resetpsswordBtn setTitle:@"重置密码" forState:UIControlStateNormal];
    [resetpsswordBtn setBackgroundImage:[UIImage imageNamed:@"Login_button.png"] forState:UIControlStateNormal];
    [resetpsswordBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal] ;
    resetpsswordBtn.BackgroundColor=[UIColor clearColor];
    resetpsswordBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [resetpsswordBtn addTarget:self action:@selector(resetPassword:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:resetpsswordBtn];
    [self.view addSubview:hintlabel];
    [self.view addSubview:emailbox];
}


- (IBAction)resetPassword:(id)sender {
    NSLog(@"重置密码");
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
