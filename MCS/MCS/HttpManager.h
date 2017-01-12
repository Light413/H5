//
//  HttpManager.h
//  MCS
//
//  Created by gener on 16/9/6.
//  Copyright © 2016年 Light. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AFNetworking.h"

typedef void(^requestSucessBlock)(NSURLSessionDataTask *task, id responseObject);
typedef void(^requestFailureBlock)(NSURLSessionDataTask *task, NSError *error);

@interface RequestTaskHandle : NSObject
@property(nonatomic,copy)NSString * url;

@property(nonatomic,strong)NSDictionary * params;

@property(nonatomic,copy)requestSucessBlock success;

@property(nonatomic,copy)requestFailureBlock failure;

/**
 *
 *  @param url    url
 *  @param parms  params
 *  @param sucess success
 *  @param faile  fail
 *
 *  @return RequestTaskHandle
 */
+(RequestTaskHandle *)taskWith:(NSString *)url parms:(NSDictionary*)parms andSuccess:(requestSucessBlock)success failure:(requestFailureBlock)faile;

@end

@interface HttpManager : NSObject

+(NSURLSessionTask*)doPostWithTask:(RequestTaskHandle *)taskHandle;


+(NSURLSessionTask*)doGetWithTask:(RequestTaskHandle *)taskHandle;




@end
