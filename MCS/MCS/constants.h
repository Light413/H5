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

//颜色
#define DefaultBgColor [UIColor colorWithRed:30/255.0 green:170/255.0 blue:240/255.0 alpha:1]
#define kTableViewCellBgColorDeep   [UIColor colorWithRed:0.855 green:0.929 blue:0.965 alpha:1]
#define kTableViewCellBgColorLight  [UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1]

//告警级别
#define kAlarmLevelColor_1  [UIColor colorWithRed:0.980 green:0.349 blue:0.322 alpha:1]//最高级别
#define kAlarmLevelColor_2  [UIColor colorWithRed:0.976 green:0.651 blue:0.255 alpha:1]
#define kAlarmLevelColor_3  [UIColor colorWithRed:0.969 green:0.992 blue:0.220 alpha:1]
#define kAlarmLevelColor_4  [UIColor colorWithRed:0.816 green:0.820 blue:0.820 alpha:1]
#define kAlarmLevelColor_5  [UIColor colorWithRed:0.231 green:0.592 blue:0.914 alpha:1]



#define CURRNET_SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width
#define CURRENT_SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height

//URL
#pragma mark - URL Constant

#warning //...

//#define TEST

#ifdef TEST
#define     kTeantCode              @"CCA" //test 国航
#define     kServerBaseUrl          @"http://192.168.3.212:8088"
#else
#define     kTeantCode              @"AMU" //MCS
#define     kServerBaseUrl          @"http://tools.myfleets.com/adp-tools/"
#endif

#define     kFleetStatueInfoUrl     @"rest/fleetStatus/list"
#define     kFaultSummaryUrl        @"rest/recordSummary/faultSummary/detail"
#define     kWarnListUrl            @"rest/alarmhandle/list"
#define     kFleetPosListUrl        @"rest/fleetStatus/fleetPosList"
#define     krecommendDocUrl        @"rest/doc/recommendDoc"

//#define kdialogRecommendDocUrl @"/adp-web/ahm/doc/dialogRecommendDoc?id=402886c0598629040159863ee0ab0028"
#define     kFaultSummaryListUrl    @"rest/recordSummary/faultSummary/list"//故障分析-其他航段故障列表
#define     kOriginalReportUrl      @"rest/recordsummary/acmsreport/original-view"//故障分析-原始报文

//webview
#define kTestFleetInfoBoard     @"http://smart.imsp.cn/mcs/warnMonitor/flightInfoBorad"




#import "BaseUtils.h"
#import "UIViewExt.h"
#import "TestData.h"

#endif /* constants_h */







