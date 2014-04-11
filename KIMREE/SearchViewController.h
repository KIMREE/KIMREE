//
//  SearchViewController.h
//  KIMREE
//
//  Created by renchunyu on 14-4-9.
//  Copyright (c) 2014年 renchunyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController

{
    UIToolbar *toolBar;
}
- (IBAction)area:(id)sender;
- (IBAction)state:(id)sender;
- (IBAction)country:(id)sender;

@property (weak, nonatomic) IBOutlet UISearchBar *searchbar;


@property (retain, nonatomic) IBOutlet UIDatePicker *pickerView;
@end
