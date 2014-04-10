//
//  UILabel+JIRUI.h
//  KIMREE
//
//  Created by JIRUI on 14-4-10.
//  Copyright (c) 2014年 JIRUI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (JIRUI)
//将label转换为多彩label
+ (UILabel *)LabelForGlowRect:(CGRect)frame Font:(CGFloat)Isize;
@end
