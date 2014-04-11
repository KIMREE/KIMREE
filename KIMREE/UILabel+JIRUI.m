//
//  UILabel+JIRUI.m
//  KIMREE
//
//  Created by JIRUI on 14-4-10.
//  Copyright (c) 2014年 JIRUI. All rights reserved.
//

#import "UILabel+JIRUI.h"
#import "FBGlowLabel.h"
@implementation UILabel (JIRUI)
+ (UILabel *)LabelForGlowRect:(CGRect)frame Font:(CGFloat)size{
    FBGlowLabel *v = [[FBGlowLabel alloc] initWithFrame:frame];
    v.textAlignment = NSTextAlignmentCenter;
    v.clipsToBounds = YES;
    v.backgroundColor = [UIColor clearColor];
    v.font = [UIFont fontWithName:@"Helvetica-Bold" size:size];
    v.alpha = 1.0;
    v.glowSize = 1;
    v.innerGlowSize = 1;
    v.textColor = UIColor.grayColor;
    v.glowColor = UIColorFromRGB(0x00ffff);
    v.innerGlowColor = UIColorFromRGB(0x00ffff);
    return v;
}
@end
