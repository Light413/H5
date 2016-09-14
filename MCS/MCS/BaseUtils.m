//
//  BaseUtils.m
//  MCS
//
//  Created by gener on 16/9/6.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "BaseUtils.h"
#import "Reachability.h"

@implementation BaseUtils
{
    Reachability * _reachability;
    
}

-(instancetype)init
{
    if (self = [super init]) {
        _reachability = [Reachability reachabilityWithHostName:@"www.baidu.com"];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(netStateChanged:) name:kReachabilityChangedNotification object:nil];
    }
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];

}

+(instancetype)share
{
    static dispatch_once_t one;
    static BaseUtils * _baseutils = nil;
    dispatch_once(&one, ^{
        _baseutils = [[self alloc]init];
    });
    
    return _baseutils;
}


#pragma mark - 网络监测
-(void)startMonitorNet
{
    [_reachability startNotifier];
}

-(BOOL)isReachable
{
    return NotReachable != [_reachability currentReachabilityStatus];
}

+(BOOL)isReachable
{
    return [[self share]isReachable];
}

-(void)netStateChanged:(NSNotification*)notification
{
    Reachability *_r = notification.object;
    switch (_r.currentReachabilityStatus) {
        case NotReachable:
            NSLog(@"now not net");
            break;
        case ReachableViaWiFi:
            NSLog(@"now is wifi");
            break;
        case ReachableViaWWAN:
            NSLog(@"now is WWAN");break;
        default: break;
    }
}

#pragma mark -


@end







