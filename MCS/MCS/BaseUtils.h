//
//  BaseUtils.h
//  MCS
//
//  Created by gener on 16/9/6.
//  Copyright © 2016年 Light. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseUtils : NSObject

+(instancetype)share;

-(void)startMonitorNet;//开始监测网络状态
+(BOOL)isReachable;//判断网络已连接




@end
