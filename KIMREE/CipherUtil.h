//
//  CipherUtil.h
//  KIMREE
//
//  Created by JIRUI on 14-4-18.
//  Copyright (c) 2014年 JIRUI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CipherUtil : NSObject
+ (void)testEncrypt;
+ (NSString *)encryptWithString:(NSString *)str;
+ (NSString *)encryptWithString:(NSString *)str ex:(NSString *)ex;
+ (NSString *)decryptWithString:(NSString *)str ex:(NSString *)ex;
@end
