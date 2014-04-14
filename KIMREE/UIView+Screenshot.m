//
//  UIView+Screenshot.m
//  KIMREE
//
//  Created by JIRUI on 14-4-7.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "UIView+Screenshot.h"

@implementation UIView (Screenshot)
- (UIImage *)screenshot {
  UIGraphicsBeginImageContext(self.bounds.size);
  if([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]){
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
  }
  else{
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
  }
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  NSData *imageData = UIImageJPEGRepresentation(image, 0.75);
  image = [UIImage imageWithData:imageData];
  return image;
}
@end
