//
//  CipherUtil.h
//  HAITAO
//
//  Created by 詹 国豪 on 13-2-20.
//  Copyright (c) 2013年 Wang Meng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CipherUtil : NSObject
+ (void)testEncrypt;
+ (NSString *)encryptWithString:(NSString *)str;
+ (NSString *)encryptWithString:(NSString *)str ex:(NSString *)ex;
+ (NSString *)decryptWithString:(NSString *)str ex:(NSString *)ex;
@end
