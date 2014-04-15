//
//  CipherUtil.m
//  HAITAO
//
//  Created by 詹 国豪 on 13-2-20.
//  Copyright (c) 2013年 Wang Meng. All rights reserved.
//

#import "CipherUtil.h"
#import "GTMBase64.h"
#import <CommonCrypto/CommonCryptor.h>

#define KEY_EX @"tong"
#define KEY_NO @"taohai.com"

//static NSString* desKey;

@implementation CipherUtil

+ (NSString *)initKey:(NSString *)key
{
  NSString* realkey = [NSString stringWithFormat:@"%@$", key];
  NSData *realKeydata = [realkey dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
  NSData *nsData = [GTMBase64 encodeData:realKeydata];
  NSString *newKey = [[NSString alloc] initWithData:nsData encoding:NSUTF8StringEncoding];
  return   [newKey substringWithRange:NSMakeRange(0, 8)];
}

+ (void)testEncrypt
{
  NSString *str = @"hmkd";//@"vYn1b59HBKg=";
  str = [CipherUtil encryptWithString:str ex:@"HM001747801"];
  str = [CipherUtil decryptWithString:str ex:@"HM001747801"];
}

+ (NSString *)encryptWithString:(NSString *)str
{
  return  [self encrypt:str encryptOrDecrypt:kCCEncrypt key:[CipherUtil initKey:KEY_NO]];
}

+ (NSString *)encryptWithString:(NSString *)str ex:(NSString *)ex
{
  return [self encrypt:str encryptOrDecrypt:kCCEncrypt key:[CipherUtil initKey:KEY_EX] ex:ex];
}


+ (NSString *)decryptWithString:(NSString *)str ex:(NSString *)ex
{
  return [self encrypt:str encryptOrDecrypt:kCCDecrypt key:[CipherUtil initKey:KEY_EX]  ex:ex];
}

+ (NSString *)encrypt:(NSString *)sText encryptOrDecrypt:(CCOperation)encryptOperation key:(NSString *)key ex:(NSString *)exnum
{
  const void *vplainText;
  size_t plainTextBufferSize;
  
  if (encryptOperation == kCCDecrypt) {
    NSData *decryptData = [GTMBase64 decodeData:[sText dataUsingEncoding:NSUTF8StringEncoding]];
    plainTextBufferSize = [decryptData length];
    vplainText = [decryptData bytes];
  }
  else {
    // add random seed
    int sum = 0;
		for(int i=0; i<[exnum length]; i++){
			sum += [exnum characterAtIndex:i];//exnum.charAt(i);
		}
		sum = sum%13;
    sText = [NSString stringWithFormat:@"%d%@",sum,sText];
    // add random seed end
    
    NSData* encryptData = [sText dataUsingEncoding:NSUTF8StringEncoding];
    plainTextBufferSize = [encryptData length];
    vplainText = [encryptData bytes];
  }
  
  CCCryptorStatus ccStatus;
  uint8_t *bufferPtr = NULL;
  size_t bufferPtrSize = 0;
  size_t movedBytes = 0;
  
  bufferPtrSize = plainTextBufferSize * 2;
  bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
  memset((void *)bufferPtr, 0x0, bufferPtrSize);
  
  
  const void *vkey = (const void *) [key UTF8String];
  const void *vinitVec = "12345678";//[data bytes];
  
  ccStatus = CCCrypt(encryptOperation,
                     kCCAlgorithmDES,
                     kCCOptionPKCS7Padding,
                     vkey,
                     kCCKeySizeDES,
                     vinitVec,
                     vplainText,
                     plainTextBufferSize,
                     (void *)bufferPtr,
                     bufferPtrSize,
                     &movedBytes);
  
  NSMutableString *result = nil;
  
  if (encryptOperation == kCCDecrypt) {
    result = [[NSMutableString alloc] initWithData:[NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes] encoding:NSUTF8StringEncoding];
    
    // fliter random seed;
    int sum = 0;
		for(int i=0; i<[exnum length]; i++) {
			sum += [exnum characterAtIndex:i];//exnum.charAt(i);
    }
		sum = sum%13;

    NSRange range = [result rangeOfString:[NSString stringWithFormat:@"%d",sum]];
    [result replaceCharactersInRange:range withString:@""];
    // fliter random seed end
    return result;
  }
  else {
    NSData *data = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes];
    result = [GTMBase64 stringByEncodingData:data];
  }
  
  free(bufferPtr);
  
  return result;
}


+ (NSString *)encrypt:(NSString *)sText encryptOrDecrypt:(CCOperation)encryptOperation key:(NSString *)key
{
  const void *vplainText;
  size_t plainTextBufferSize;
  
  if (encryptOperation == kCCDecrypt) {
    NSData *decryptData = [GTMBase64 decodeData:[sText dataUsingEncoding:NSUTF8StringEncoding]];
    plainTextBufferSize = [decryptData length];
    vplainText = [decryptData bytes];
  }
  else {
    NSData* encryptData = [sText dataUsingEncoding:NSUTF8StringEncoding];
    plainTextBufferSize = [encryptData length];
    vplainText = (const void *)[encryptData bytes];
  }
  
  CCCryptorStatus ccStatus;
  uint8_t *bufferPtr = NULL;
  size_t bufferPtrSize = 0;
  size_t movedBytes = 0;
  
  bufferPtrSize = plainTextBufferSize * 2;
  bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
  memset((void *)bufferPtr, 0x0, bufferPtrSize);
  
  
  const void *vkey = (const void *) [key UTF8String];
  const void *vinitVec = "haitaomm";//[data bytes];
  
  ccStatus = CCCrypt(encryptOperation,
                     kCCAlgorithmDES,
                     kCCOptionPKCS7Padding,
                     vkey,
                     kCCKeySizeDES,
                     vinitVec,
                     vplainText,
                     plainTextBufferSize,
                     (void *)bufferPtr,
                     bufferPtrSize,
                     &movedBytes);
  
  NSString *result = nil;
  
  if (encryptOperation == kCCDecrypt) {
    result = [[NSMutableString alloc] initWithData:[NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes] encoding:NSUTF8StringEncoding];
  }
  else {
    NSData *data = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes];
    result = [GTMBase64 stringByEncodingData:data];
  }
  
  free(bufferPtr);
  
  return result;
}


@end
