//
//  MainViewController.h
//  KIMREE
//
//  Created by JIRUI on 14-4-7.
//  Copyright (c) 2014年 JIRUI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EScrollerView.h"
//#import "Header.h"
#import "ProductViewController.h"
#import "KIMREEViewController.h"
#import "PostBarViewController.h"
#import "TabBarController.h"
#import "GameViewController.h"
#import "sizeconstant.h"


@interface MainViewController : UIViewController <EScrollerViewDelegate>

{
    UITabBarController *tabBarController;
    UIButton *productBtn;
    UIButton *gameBtn;
    UIButton *postbarBtn;
    UIButton *kimreeBtn;
    UIButton *nearbyBtn;
    UIButton *memberBtn;
    UILabel *productlabel;
    UILabel  *gamelabel;
    UILabel  *postbarlabel;
    UILabel  *kimreelabel;
    UILabel  *nearbylabel;
    UILabel  *memberlabel;
}

@end
