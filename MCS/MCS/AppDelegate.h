//
//  AppDelegate.h
//  MCS
//
//  Created by gener on 16/9/5.
//  Copyright © 2016年 Light. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

 -(void)xmppStreamdidReceiveMessage;

@end

