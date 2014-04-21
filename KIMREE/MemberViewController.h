//
//  MemberViewController.h
//  KIMREE
//
//  Created by renchunyu on 14-4-14.
//  Copyright (c) 2014年 renchunyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewConstanTDef.h"
#import "SignInViewController.h"
#import "LogInViewController.h"
#import "GetPasswordViewController.h"

@interface MemberViewController : UIViewController

{
    UIButton *forgotpsswordBtn;
    UIButton *logInBtn;
    UIButton *signInBTn;
    
    UILabel *firstHintLabel;
    UILabel  *sencondHintLabel;
    UILabel  *autoLonInLabel;
    UILabel  *acountHintLabl;;
    
    UITextField *userbox;
    UITextField *passwordbox;
  
}

@end
