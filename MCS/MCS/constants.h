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


#define DefaultBgColor [UIColor colorWithRed:30/255.0 green:170/255.0 blue:240/255.0 alpha:1]
#define kTableViewCellBgColorDeep   [UIColor colorWithRed:0.855 green:0.929 blue:0.965 alpha:1]
#define kTableViewCellBgColorLight  [UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1]


#define CURRNET_SCREEN_WIDTH [[UIScreen mainScreen]bounds].size.width
#define CURRENT_SCREEN_HEIGHT [[UIScreen mainScreen]bounds].size.height

#import "BaseUtils.h"
#import "UIViewExt.h"
#import "TestData.h"

#endif /* constants_h */
