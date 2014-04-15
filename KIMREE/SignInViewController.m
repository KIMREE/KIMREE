//
//  SignInViewController.m
//  KIMREE
//
//  Created by renchunyu on 14-4-15.
//  Copyright (c) 2014年 renchunyu. All rights reserved.
//

#import "SignInViewController.h"

@interface SignInViewController ()

@end

@implementation SignInViewController

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
    
    
    
    submitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [submitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [submitBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal] ;
    submitBtn.BackgroundColor=[UIColor clearColor];
    submitBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    // [submitBtn addTarget:self action:@selector(logIn:) forControlEvents:UIControlEventTouchUpInside];
    submitBtn.frame = CGRectMake(120, 420-m_compensation-m2_compensation, 80, 30);
    
    logInBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [logInBtn setTitle:@"马上登陆" forState:UIControlStateNormal];
    [logInBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal] ;
    logInBtn.BackgroundColor=[UIColor clearColor];
    logInBtn.titleLabel.font = [UIFont systemFontOfSize: 14.0];
    [logInBtn addTarget:self action:@selector(logIn:) forControlEvents:UIControlEventTouchUpInside];
    logInBtn.frame=CGRectMake(120, 500-m_compensation-m2_compensation, 80, 30);
    
    
  
    HintLabel = [[UILabel alloc] init];
    HintLabel.frame = CGRectMake(15, 105-m_compensation-m2_compensation, 250, 60);
    HintLabel.text = @"欢迎注册被分享你的吉瑞时刻，温馨提示，注册会员将拥有更多的优惠和权利";
    HintLabel.lineBreakMode = NSLineBreakByWordWrapping;
    HintLabel.numberOfLines = 3;
    HintLabel.backgroundColor=[UIColor clearColor];
    HintLabel.textColor=[UIColor whiteColor];
    HintLabel.font = [UIFont systemFontOfSize:14];
    
    
    
    agreeInLabel = [[UILabel alloc] init];
    agreeInLabel.text = @"同意吉瑞网络服务使用协议";
    agreeInLabel.backgroundColor=[UIColor clearColor];
    agreeInLabel.textColor=[UIColor whiteColor];
    agreeInLabel.font = [UIFont systemFontOfSize:14];
    agreeInLabel.frame = CGRectMake(50, 350-m_compensation-m2_compensation, 290, 15);
    
    acountHintLabl = [[UILabel alloc] init];
    acountHintLabl.text=@"已有账号？";
    acountHintLabl.backgroundColor=[UIColor clearColor];
    acountHintLabl.textColor=[UIColor whiteColor];
    acountHintLabl.font = [UIFont systemFontOfSize:14];
    acountHintLabl.frame = CGRectMake(15, 510-m_compensation-m2_compensation, 290, 15);

    
    
  
    nickname=[[UITextField alloc] initWithFrame:CGRectMake(10, 170-m_compensation-m2_compensation, 300, 30)];
    userbox=[[UITextField alloc] initWithFrame:CGRectMake(10, 210-m_compensation-m2_compensation, 300, 30)];
    passwordbox=[[UITextField alloc] initWithFrame:CGRectMake(10, 250-m_compensation-m2_compensation, 300, 30)];
    comfirmpasswordbox=[[UITextField alloc] initWithFrame:CGRectMake(10, 290-m_compensation-m2_compensation, 300, 30)];
    
    
    [nickname setBorderStyle:UITextBorderStyleRoundedRect];
    nickname.placeholder = @"user";
    nickname.autocorrectionType = UITextAutocorrectionTypeNo;
    nickname.autocapitalizationType = UITextAutocapitalizationTypeNone;
    nickname.returnKeyType = UIReturnKeyDone;
    nickname.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
    
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
    
    [comfirmpasswordbox setBorderStyle:UITextBorderStyleRoundedRect];
    comfirmpasswordbox.placeholder = @"password";
    comfirmpasswordbox.autocorrectionType = UITextAutocorrectionTypeNo;
    comfirmpasswordbox.autocapitalizationType = UITextAutocapitalizationTypeNone;
    comfirmpasswordbox.returnKeyType = UIReturnKeyDone;
    comfirmpasswordbox.clearButtonMode = UITextFieldViewModeWhileEditing; //编辑时会出现个修改X
    
    UIButton *checkbox = [UIButton buttonWithType:UIButtonTypeCustom];
    
    CGRect checkboxRect = CGRectMake(14, 350-m_compensation-m2_compensation, 17, 17);
    [checkbox setFrame:checkboxRect];
    
    [checkbox setImage:[UIImage imageNamed:@"checkbox_in.png"] forState:UIControlStateNormal];
    [checkbox setImage:[UIImage imageNamed:@"checkbox_out.png"] forState:UIControlStateSelected];
    
    [checkbox addTarget:self action:@selector(checkboxClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.view addSubview:checkbox];
    [self.view addSubview:nickname];
    [self.view addSubview:userbox];
    [self.view addSubview:passwordbox];
    [self.view addSubview:comfirmpasswordbox];
    [self.view addSubview:logInBtn];
    [self.view addSubview:submitBtn];
    [self.view addSubview:HintLabel];
    [self.view addSubview:agreeInLabel];
    [self.view addSubview:acountHintLabl];
    
    
}


-(void)checkboxClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
}


-(void)logIn:(UIButton *)btn
{
    
  self.navigationController.navigationBar.hidden = NO;
 [self.navigationController popViewControllerAnimated:YES];
    
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
