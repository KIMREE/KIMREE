//
//  NearbyViewController.h
//  KIMREE
//
//  Created by cool on 14-4-8.
//  Copyright (c) 2014年 cool. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DisplayViewController.h"
#import "TestMapCell.h"


@interface NearbyViewController : UIViewController <TestMapCellDelegate>
{
  
    UITabBarController *tabBarController;
}

@end
