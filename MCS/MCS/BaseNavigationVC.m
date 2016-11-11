//
//  BaseNavigationVC.m
//  MCS
//
//  Created by gener on 16/9/6.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "BaseNavigationVC.h"

@interface BaseNavigationVC ()

@end

@implementation BaseNavigationVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationBar.translucent = NO;
    
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:0.212 green:0.188 blue:0.427 alpha:1]];
    [self.navigationBar setTintColor:[UIColor whiteColor]];

    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
    
}


@end
