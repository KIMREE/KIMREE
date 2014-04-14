//
//  SWTableViewCell.h
//  KIMREE
//
//  Created by JIRUI on 14-4-7.
//  Copyright (c) 2014年 JIRUI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIGestureRecognizerSubclass.h>
#import "UILabel+JIRUI.h"
@class JRTableViewCell;

typedef enum {
    kCellStateCenter,
    kCellStateLeft,
    kCellStateRight
} SWCellState;

@protocol SWTableViewCellDelegate <NSObject>

@optional
- (void)swippableTableViewCell:(JRTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index;
- (void)swippableTableViewCell:(JRTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index;
- (void)swippableTableViewCell:(JRTableViewCell *)cell scrollingToState:(SWCellState)state;

@end

@interface JRTableViewCell : UITableViewCell

@property (nonatomic, strong) NSArray *leftUtilityButtons;
@property (nonatomic, strong) NSArray *rightUtilityButtons;
@property (nonatomic) id <SWTableViewCellDelegate> delegate;
//note+post
@property (nonatomic, strong) UILabel *notePost;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier containingTableView:(UITableView *)containingTableView leftUtilityButtons:(NSArray *)leftUtilityButtons rightUtilityButtons:(NSArray *)rightUtilityButtons;

- (void)setBackgroundColor:(UIColor *)backgroundColor;
- (void)hideUtilityButtonsAnimated:(BOOL)animated;

@end

@interface NSMutableArray (SWUtilityButtons)

- (void)addUtilityButtonWithColor:(UIColor *)color title:(NSString *)title;
- (void)addUtilityButtonWithColor:(UIColor *)color icon:(UIImage *)icon;

@end
