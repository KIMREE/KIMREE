

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
    
    float compensation;
    if (IOS7) {
        compensation=0;
    }
    else {
        compensation=65.0;
    }
    
    forgotpsswordBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    logInBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    signInBTn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    firstHintLabel = [[UILabel alloc] init];
    sencondHintLabel = [[UILabel alloc] init];
    autoLonInLabel = [[UILabel alloc] init];
    amountHintLabl = [[UILabel alloc] init];
    
    
 
        
        forgotpsswordBtn.frame = CGRectMake(kScreen_Width-3*INCH4_LEFT_X, 290-compensation, INCH4_CUSTOM_BTN_W, INCH4_CUSTOM_BTN_H);
        logInBtn.frame=CGRectMake(0, 400-compensation, kScreen_Width, INCH4_CUSTOM_BTN_H);
        signInBTn.frame=CGRectMake(INCH4_CUSTOM_BTN_W+50, 500-compensation, INCH4_CUSTOM_BTN_W, INCH4_CUSTOM_BTN_H);
        
        firstHintLabel.frame=CGRectMake(INCH4_LEFT_X, STATUS_BAR+NAVIGATION_BAR+10-compensation, kScreen_Width, LABEL_H);
        sencondHintLabel.frame=CGRectMake(INCH4_LEFT_X, STATUS_BAR+NAVIGATION_BAR+LABEL_H+20-compensation, kScreen_Width, LABEL_H);
        autoLonInLabel.frame=CGRectMake(INCH4_LEFT_X+2*INCH4_SELECTED_SIDE, 290-compensation, kScreen_Width, LABEL_H);
        amountHintLabl.frame=CGRectMake(INCH4_LEFT_X, 510-compensation, kScreen_Width, LABEL_H);
        
        
        [forgotpsswordBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        [logInBtn setTitle:@"登陆" forState:UIControlStateNormal];
        [signInBTn setTitle:@"马上注册" forState:UIControlStateNormal];
        

    [forgotpsswordBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
    [logInBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [signInBTn setTitle:@"马上注册" forState:UIControlStateNormal];
    
     firstHintLabel.text = @"请输入用户名、密码进行登陆";
    firstHintLabel.backgroundColor =[UIColor clearColor];
    
     sencondHintLabel.text = @"温馨提示：尊贵会员拥有更多专属权利，进入查看更多优惠";
    sencondHintLabel.backgroundColor=[UIColor clearColor];
     autoLonInLabel.text = @"下次自动登陆";
    autoLonInLabel.backgroundColor=[UIColor clearColor];
     amountHintLabl.text=@"还没有账号";
    amountHintLabl.backgroundColor=[UIColor clearColor];
    
    
    
    [self.view addSubview:forgotpsswordBtn];
    [self.view addSubview:logInBtn];
    [self.view addSubview:signInBTn];
    [self.view addSubview:firstHintLabel];
    [self.view addSubview:sencondHintLabel];
    [self.view addSubview:autoLonInLabel];
    [self.view addSubview:amountHintLabl];
    
    
    
    
    self.view.backgroundColor=[UIColor grayColor];
    userbox=[[UITextField alloc] initWithFrame:CGRectMake(30, 180-compensation, 260, 30)];
    passwordbox=[[UITextField alloc] initWithFrame:CGRectMake(30, 230-compensation, 260, 30)];
    
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
    
    CGRect checkboxRect = CGRectMake(30, 285-compensation, 20, 20);
    [checkbox setFrame:checkboxRect];
    
    [checkbox setImage:[UIImage imageNamed:@"checkbox_out.png"] forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageNamed:@"checkbox_in.png"] forState:UIControlStateSelected];
    
    [checkbox addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:checkbox];
    
    
    
  
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
