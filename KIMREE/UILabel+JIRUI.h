//
//  UILabel+JIRUI.h
//  KIMREE
//
//  Created by JIRUI on 14-4-10.
//  Copyright (c) 2014年 JIRUI. All rights reserved.
//

#import <UIKit/UIKit.h>
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)(((rgbValue) & 0xFF0000) >> 16))/255.0 green:((float)(((rgbValue) & 0xFF00) >> 8))/255.0 blue:((float)((rgbValue) & 0xFF))/255.0 alpha:1.0]
@interface UILabel (JIRUI)
//将label转换为多彩label
+ (UILabel *)LabelForGlowRect:(CGRect)frame Font:(CGFloat)Isize;
@end
