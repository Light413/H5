//
//  HttpManager.m
//  MCS
//
//  Created by gener on 16/9/6.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "HttpManager.h"
#import "AFNetworkActivityIndicatorManager.h"
@implementation RequestTaskHandle

+(RequestTaskHandle *)taskWith:(NSString *)url parms:(NSDictionary*)parms andSuccess:(requestSucessBlock)success failure:(requestFailureBlock)faile
{
    RequestTaskHandle *_task = [[self alloc]init];
    _task.url = url;
    _task.params = parms;
    _task.success = success;
    _task.failure = faile;
    
    return _task;
}

@end


@implementation HttpManager
{
    AFHTTPSessionManager * _httpSessionManager;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
        
        NSString * _baseUrl = [self baseUrl];
        _httpSessionManager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString: _baseUrl]];
        _httpSessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        _httpSessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
        
    }
    return self;
}

+(instancetype)share
{
    static HttpManager * _httpManager = nil;
    static dispatch_once_t dispatch_one;
    dispatch_once(&dispatch_one, ^{
        _httpManager  = [[self alloc]init];
    });
    
    return _httpManager;
}

-(NSString *)baseUrl
{
    return kServerBaseUrl;
}


#pragma mark - methods
-(NSURLSessionDataTask*)doPostWithTask:(RequestTaskHandle *)taskHandle
{
    NSParameterAssert(taskHandle.url);
    
    [[AFNetworkActivityIndicatorManager sharedManager] incrementActivityCount];
    return [_httpSessionManager POST:taskHandle.url parameters:taskHandle.params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (taskHandle.success) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [[AFNetworkActivityIndicatorManager sharedManager]decrementActivityCount];
                taskHandle.success(task,responseObject);
            });
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (taskHandle.failure) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [[AFNetworkActivityIndicatorManager sharedManager]decrementActivityCount];
                taskHandle.failure(task,error);
            });
        }
    }];
}

+(NSURLSessionTask*)doPostWithTask:(RequestTaskHandle *)taskHandle
{
    return [[self share] doPostWithTask:taskHandle];
}

//...
-(NSURLSessionDataTask*)doGetWithTask:(RequestTaskHandle *)taskHandle
{
    NSParameterAssert(taskHandle.url);
    
    [[AFNetworkActivityIndicatorManager sharedManager] incrementActivityCount];
    return [_httpSessionManager GET:taskHandle.url parameters:taskHandle.params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (taskHandle.success) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [[AFNetworkActivityIndicatorManager sharedManager]decrementActivityCount];
                taskHandle.success(task,responseObject);
            });
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (taskHandle.failure) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [[AFNetworkActivityIndicatorManager sharedManager]decrementActivityCount];
                taskHandle.failure(task,error);
            });
        }

    }];
}

+(NSURLSessionTask*)doGetWithTask:(RequestTaskHandle *)taskHandle
{
    return [[self share] doGetWithTask:taskHandle];
}






@end
