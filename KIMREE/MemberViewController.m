

//
//  MemberViewController.m
//  KIMREE
//
//  Created by renchunyu on 14-4-14.
//  Copyright (c) 2014年 renchunyu. All rights reserved.
//

#import "MemberViewController.h"

@interface MemberViewController ()

@end

@implementation MemberViewController

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
    
    forgotpsswordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    logInBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    signInBTn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    firstHintLabel = [[UILabel alloc] init];
    sencondHintLabel = [[UILabel alloc] init];
    autoLonInLabel = [[UILabel alloc] init];
    acountHintLabl = [[UILabel alloc] init];
    
    
    forgotpsswordBtn.frame = CGRectMake(kScreen_Width-INCH4_CUSTOM_BTN_W-INCH4_LEFT_X, 320-m_compensation-m2_compensation, INCH4_CUSTOM_BTN_W, INCH4_CUSTOM_BTN_H);
    logInBtn.frame=CGRectMake(5, 400-m_compensation-m2_compensation, kScreen_Width-10, INCH4_CUSTOM_BTN_H);
    signInBTn.frame=CGRectMake(INCH4_CUSTOM_BTN_W+50, 490-m_compensation-m2_compensation-20, INCH4_CUSTOM_BTN_W, INCH4_CUSTOM_BTN_H);
    
    
    firstHintLabel.frame=CGRectMake(INCH4_LEFT_X, STATUS_BAR+NAVIGATION_BAR+10-m_compensation, kScreen_Width, LABEL_H);
    sencondHintLabel.frame=CGRectMake(INCH4_LEFT_X, STATUS_BAR+NAVIGATION_BAR+LABEL_H+20-m_compensation, kScreen_Width-INCH4_LEFT_X, 2*LABEL_H+10);
    autoLonInLabel.frame=CGRectMake(INCH4_LEFT_X+INCH4_SELECTED_SIDE, 300-m_compensation-m2_compensation, kScreen_Width, LABEL_H);
    acountHintLabl.frame=CGRectMake(INCH4_LEFT_X, 500-m_compensation-m2_compensation-20, kScreen_Width, LABEL_H);
    
    
    [forgotpsswordBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [forgotpsswordBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal] ;
    forgotpsswordBtn.BackgroundColor=[UIColor clearColor];
    forgotpsswordBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [forgotpsswordBtn addTarget:self action:@selector(getPassword:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [logInBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [logInBtn setImage:[UIImage imageNamed:@"Login_button.png"] forState:UIControlStateNormal];
    [logInBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal] ;
    logInBtn.BackgroundColor=[UIColor clearColor];
    logInBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];    [logInBtn addTarget:self action:@selector(logIn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [signInBTn setTitle:@"马上注册" forState:UIControlStateNormal];
    [signInBTn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal] ;
    signInBTn.BackgroundColor=[UIColor clearColor];
    signInBTn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [signInBTn addTarget:self action:@selector(signIn:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    firstHintLabel.text = @"请输入用户名、密码进行登陆";
    firstHintLabel.backgroundColor =[UIColor clearColor];
    firstHintLabel.textColor=[UIColor whiteColor];
    firstHintLabel.font = [UIFont systemFontOfSize:14];
    
    sencondHintLabel.text = @"温馨提示：尊贵会员拥有更多专属权利，进入查看更多优惠";
    sencondHintLabel.lineBreakMode = NSLineBreakByWordWrapping;
    sencondHintLabel.numberOfLines = 2;
    sencondHintLabel.backgroundColor=[UIColor clearColor];
    sencondHintLabel.textColor=[UIColor whiteColor];
    sencondHintLabel.font = [UIFont systemFontOfSize:14];
    
    autoLonInLabel.text = @"下次自动登陆";
    autoLonInLabel.backgroundColor=[UIColor clearColor];
    autoLonInLabel.textColor=[UIColor whiteColor];
    autoLonInLabel.font = [UIFont systemFontOfSize:14];
    
    acountHintLabl.text=@"还没有账号";
    acountHintLabl.backgroundColor=[UIColor clearColor];
    acountHintLabl.textColor=[UIColor whiteColor];
    acountHintLabl.font = [UIFont systemFontOfSize:14];
    
    
    [self.view addSubview:forgotpsswordBtn];
    [self.view addSubview:logInBtn];
    [self.view addSubview:signInBTn];
    [self.view addSubview:firstHintLabel];
    [self.view addSubview:sencondHintLabel];
    [self.view addSubview:autoLonInLabel];
    [self.view addSubview:acountHintLabl];
    
    
    UIImage*img =[UIImage imageNamed:@"bg-body.jpg"];
    self.view.backgroundColor=[UIColor colorWithPatternImage:img];
    
    userbox=[[UITextField alloc] initWithFrame:CGRectMake(10, 200-m_compensation-m2_compensation, 300, 30)];
    passwordbox=[[UITextField alloc] initWithFrame:CGRectMake(10, 250-m_compensation-m2_compensation, 300, 30)];
    
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
    
    CGRect checkboxRect = CGRectMake(30, 300-m_compensation-m2_compensation, 17, 17);
    [checkbox setFrame:checkboxRect];
    
    [checkbox setImage:[UIImage imageNamed:@"checkbox_in.png"] forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageNamed:@"checkbox_out.png"] forState:UIControlStateSelected];
    
    [checkbox addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:checkbox];
    
}


-(void)logIn:(UIButton *)btn
{
    
    
    self.navigationController.navigationBar.hidden = NO;
    LogInViewController *logINVC = [[LogInViewController alloc]init];
    [self.navigationController pushViewController:logINVC animated:NO];
    
}



-(void)getPassword:(UIButton *)btn
{
    self.navigationController.navigationBar.hidden = NO;
    GetPasswordViewController *getPasswordView =[[GetPasswordViewController alloc] init];
    [self.navigationController pushViewController:getPasswordView animated:NO];
    
}



-(void)signIn:(UIButton *)btn
{
    self.navigationController.navigationBar.hidden = NO;
    SignInViewController *signInVC = [[SignInViewController alloc]init];
    [self.navigationController pushViewController:signInVC animated:YES];
    
}



-(void)checkboxClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
