//
//  constants.h
//  MCS
//
//  Created by gener on 16/9/6.
//  Copyright © 2016年 Light. All rights reserved.
//

#ifndef constants_h
#define constants_h

#define DEBUG_MODEL

#define ServerBaseUrl @"http://osm.myfleets.com/adp-osm/rest/login"


#define MY_DEBUG
#ifdef MY_DEBUG
#define test_username   @"xiaoming"
#define test_userpwd    @"123"
#define XMPP_SERVER     @"192.168.90.121"
#define XMPP_SRC        @"iPad"
#else
#define test_username   @"wangyiwen"
#define test_userpwd    @"wangyiwen"
#define XMPP_SERVER     @@"119.15.136.39"
#define XMPP_SRC        @"iPad"
#endif

//背景色
#define DefaultBgColor [UIColor colorWithRed:30/255.0 green:170/255.0 blue:240/255.0 alpha:1]
#define kTableViewCellBgColorDeep   [UIColor colorWithRed:0.855 green:0.929 blue:0.965 alpha:1]
#define kTableViewCellBgColorLight  [UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1]

//告警级别颜色
#define kAlarmLevelColor_1  [UIColor colorWithRed:0.980 green:0.349 blue:0.322 alpha:1]
#define kAlarmLevelColor_2  [UIColor colorWithRed:0.976 green:0.651 blue:0.255 alpha:1]
#define kAlarmLevelColor_3  [UIColor colorWithRed:0.969 green:0.992 blue:0.220 alpha:1]
#define kAlarmLevelColor_4  [UIColor colorWithRed:0.816 green:0.820 blue:0.820 alpha:1]
#define kAlarmLevelColor_5  [UIColor colorWithRed:0.231 green:0.592 blue:0.914 alpha:1]



#define CURRNET_SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width
#define CURRENT_SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height

#pragma mark - URL Constant

#define     kServerBaseUrl          @"http://192.168.3.212:8088"
#define     kFleetStatueInfoUrl     @"/adp-tools/rest/fleetStatus/list"
#define     kFaultSummaryUrl        @"/adp-tools/rest/recordSummary/faultSummary/detail"








#import "BaseUtils.h"
#import "UIViewExt.h"
#import "TestData.h"

#endif /* constants_h */







