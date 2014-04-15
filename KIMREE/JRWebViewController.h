//
//  HZWebViewController.h
//  KIMREE
//
//  Created by JIRUI on 14-4-14.
//  Copyright (c) 2014年 JIRUI. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef enum {
	HZWebBrowserModeNavigation,
	HZWebBrowserModeModal,
} HZWebBrowserMode;

@interface XToolBar : UIToolbar {}@end

@interface JRWebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) NSURL *URL;
@property (nonatomic, assign) HZWebBrowserMode mode;



- (void)load;
- (void)clear;

@end
