//
//  THRequest.m
//  KIMREE
//
//  Created by JIRUI on 14-4-15.
//  Copyright (c) 2014年 JIRUI. All rights reserved.
//
#import "JRRequest.h"
#import "ASIFormDataRequest.h"
#import "CJSONDeserializer.h"
#import "ErrorHelper.h"

@interface JRRequest ()<ASIHTTPRequestDelegate>
//请求
//@property (nonatomic,strong) MKNetworkEngine *engine;
@property (nonatomic,strong) ASIHTTPRequest *httpRequest;
@end

@implementation JRRequest

/*
 * @brief 初始化
 */
- (JRRequest *)initWithMethod:(JRRequestMethod)method
                          url:(NSString *)url
                       params:(NSDictionary *)params
                     delegate:(id<JRRequestDelegate>)delegate
                          key:(NSString *)key
{
  self = [super init];
  if (self) {
    self.method = method;
    self.url = url;
    self.params = params;
    self.delegate = delegate;
    self.key = key;
  }
  return self;
}

/*
 * @brief 初始化
 */
- (JRRequest *)initWithMethod:(JRRequestMethod)method
                          url:(NSString *)url
                       params:(NSDictionary *)params
                          key:(NSString *)key
                       failed:(THRequestFailedBlock)failedBlock
                     finished:(THRequestFinishedBlock)finishedBlock
{
  self = [super init];
  if (self) {
    self.method = method;
    self.url = url;
    self.params = params;
    self.key = key;
    self.failedBlock = failedBlock;
    self.finishedBlock = finishedBlock;
  }
  return self;
}

/*
 * @brief 发送请求
 */
- (void)startRequest
{
    //取消上次请求
    if (_isLoading) {
        [self cancelRequest];
    }
    
    //GET请求
    if (self.method == JRRequestMethodGET) {
        [self startGETRequest];
    }
    //POST请求
    else if (self.method == JRRequestMethodPOST) {
        [self startPOSTRequest];
        
    }
    
    //标识正在加载数据
    _isLoading = YES;
}

/*
 * @brief GET请求
 */
- (void)startGETRequest
{
    NSURL *tempURL = [NSURL URLWithString:self.url];
    if (self.params) {
        NSString *joinStr = tempURL.query ? @"?" : @"&";
        NSMutableArray *array = [NSMutableArray array];
        for (NSString *key in self.params.allKeys) {
            [array addObject:[NSString stringWithFormat:@"%@=%@",key,[self.params valueForKey:key]]];
        }
        NSString *paramsStr = [array componentsJoinedByString:@"&"];
        NSString *tempStr = [NSString stringWithFormat:@"%@%@%@",self.url,joinStr,paramsStr];
        tempURL = [NSURL URLWithString:[tempStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    }
    self.httpRequest = [ASIHTTPRequest requestWithURL:tempURL];
    self.httpRequest.requestMethod = @"GET";
    self.httpRequest.delegate = self;
    self.httpRequest.timeOutSeconds = C_API_REQUEST_TIMEOUT_SECONDS;
    [self.httpRequest startAsynchronous];
}

/*
 * @brief POST请求
 */
- (void)startPOSTRequest
{
    self.httpRequest = [[ASIFormDataRequest alloc] initWithURL:[NSURL URLWithString:self.url]];
    for (NSString *key in self.params.allKeys) {
        [((ASIFormDataRequest *)self.httpRequest) addPostValue:[self.params valueForKey:key] forKey:key];
    }
    self.httpRequest.requestMethod = @"POST";
    self.httpRequest.delegate = self;
    self.httpRequest.timeOutSeconds = C_API_REQUEST_TIMEOUT_SECONDS;
    [self.httpRequest startAsynchronous];
}

/*
 * @brief 取消请求
 */
- (void)cancelRequest
{
    self.httpRequest.delegate = nil;
    [self.httpRequest cancel];
    self.httpRequest = nil;
    _isLoading = NO;
}

#pragma mark-
#pragma mark ASIHTTPReqeustDelegate
/*
 * @brief 请求失败
 */
- (void)requestFailed:(ASIHTTPRequest *)request
{
    //以代理方式返回信息
    if (self.delegate && [self.delegate respondsToSelector:@selector(requestFailed:error:)]) {
        [self.delegate requestFailed:self error:request.error];
    }
    
    //以块方式返回信息
    if (self.failedBlock) {
        self.failedBlock(self,request.error);
    }
    
    //标识加载结束
    _isLoading = NO;
    
    THLog(@"error code:%d,msg:%@",request.error.code,[request.error localizedDescription]);
}
/*
 * @brief 请求完成
 */
- (void)requestFinished:(ASIHTTPRequest *)request
{
    THLog(@"data json:%@",request.responseString);
    
    //解析信息
    CJSONDeserializer *deserializer = [CJSONDeserializer deserializer];
    deserializer.nullObject = @"";
    id data = [deserializer deserialize:request.responseData error:nil];
    THLog(@"data dict:%@",data);
    
    JRResponse *response = [[JRResponse alloc] initWithData:data];
    
    //以代理方式返回信息
    if (self.delegate && [self.delegate respondsToSelector:@selector(requestFinished:response:)]) {
        [self.delegate requestFinished:self response:response];
    }
    
    //以块方式返回信息
    if (self.finishedBlock) {
        self.finishedBlock(self,response);
    }
    
    //标识加载结束
    _isLoading = NO;
}



///*
// * @brief 发送请求
// */
//- (void)startRequest
//{
//  //取消上次请求
//  if (_isLoading) {
//    [self cancelRequest];
//
//  }
//  
//  //GET请求
//  if (self.method == JRRequestMethodGET) {
//    [self startGETRequest];
//  }
//  //POST请求
//  else if (self.method == JRRequestMethodPOST) {
//            NSLog(@"1111111进入了");
//    [self startPOSTRequest];
//  }
//  
//  //标识正在加载数据
//  _isLoading = YES;
//}
//
///*
// * @brief GET请求
// */
//- (void)startGETRequest
//{
//    
////    NSURL *tempURL = [NSURL URLWithString:self.url];
//    NSString *tempStr = [NSString string];
//   //配置地址
//    if (self.params) {
////      NSString *joinStr = tempURL.query ? @"?" : @"&";
//      NSString *joinStr = @"?";
//      NSMutableArray *array = [NSMutableArray array];
//      for (NSString *key in self.params.allKeys) {
//        [array addObject:[NSString stringWithFormat:@"%@=%@",key,[self.params valueForKey:key]]];
//        }
//    NSString *paramsStr = [array componentsJoinedByString:@"&"];
//    tempStr = [[NSString stringWithFormat:@"%@%@",joinStr,paramsStr] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
////      tempStr = [NSString stringWithFormat:@"%@%@%@",self.url,joinStr,paramsStr];
////      tempURL = [NSURL URLWithString:[tempStr stringByAddingPercentEscapesUsingEncoding:  NSUTF8StringEncoding]];
//    }
//    self.engine = [[MKNetworkEngine alloc] initWithHostName:self.url customHeaderFields:nil];
//    MKNetworkOperation *op = [self.engine operationWithPath:tempStr];
//    [op addCompletionHandler:^(MKNetworkOperation *operation){
//        NSLog(@"请求成功responseData: %@", [operation responseString]);
//        [self requestFinished:operation];
//    } errorHandler:^(MKNetworkOperation *errorop,NSError*err){
//        NSLog(@"MKNetwork请求错误:%@", [err localizedDescription]);
//        [self requestFailed:errorop];
//    }];
//    [self.engine enqueueOperation:op];
//}
//
///*
// * @brief POST请求
// */
//- (void)startPOSTRequest
//{
//    NSLog(@"2222222222进入了");
//    self.engine = [[MKNetworkEngine alloc] initWithHostName:self.url customHeaderFields:nil];
//    MKNetworkOperation *op = [self.engine operationWithPath:API_SERVER_PATH params:self.params httpMethod:@"POST"];
//    [op addCompletionHandler:^(MKNetworkOperation *operation){
//                NSLog(@"333333333进入了 %@\n\n", [operation responseString]);
//                       [self requestFinished:operation];
//    } errorHandler:^(MKNetworkOperation *errorop,NSError*err){
//                NSLog(@"-3-3-3-3-3-3-3进入了");
//        NSLog(@"MKNetwork请求错误:%@", [err localizedDescription]);
//        [self requestFailed:errorop];
//
//    }];
//    [self.engine enqueueOperation:op];
//}
//
///*
// * @brief 取消请求
// */
//- (void)cancelRequest
//{//取消所有请求
//  [self.engine cancelAllOperations];
//  self.engine = nil;
//  _isLoading = NO;
//}
//
//#pragma mark-
//#pragma mark ASIHTTPReqeustDelegate
///*
// * @brief 请求失败
// */
//- (void)requestFailed:(MKNetworkOperation *)operation
//{
//  //以代理方式返回信息
//  if (self.delegate && [self.delegate respondsToSelector:@selector(requestFailed:error:)]) {
//    [self.delegate requestFailed:self error:operation.error];
//  }
//  
//  //以块方式返回信息
//  if (self.failedBlock) {
//    self.failedBlock(self,operation.error);
//  }
//  
//  //标识加载结束
//  _isLoading = NO;
//  
//  THLog(@"error code:%d,msg:%@",operation.error.code,[operation.error localizedDescription]);
//}
///*
// * @brief 请求完成
// */
//- (void)requestFinished:(MKNetworkOperation *)operation
//{
//  THLog(@"data json:%@",operation.responseString);
//  
//  //解析信息
//  CJSONDeserializer *deserializer = [CJSONDeserializer deserializer];
//  deserializer.nullObject = @"";
//  id data = [deserializer deserialize:operation.responseData error:nil];
//  THLog(@"data dict:%@",data);
//  
//  JRResponse *response = [[JRResponse alloc] initWithData:data];
//  
//  //以代理方式返回信息
//  if (self.delegate && [self.delegate respondsToSelector:@selector(requestFinished:response:)]) {
//    [self.delegate requestFinished:self response:response];
//  }
//  
//  //以块方式返回信息
//  if (self.finishedBlock) {
//    self.finishedBlock(self,response);
//  }
//  
//  //标识加载结束
//  _isLoading = NO;
//}

@end













