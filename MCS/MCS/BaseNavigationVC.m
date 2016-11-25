//
//  BaseNavigationVC.m
//  MCS
//
//  Created by gener on 16/9/6.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "BaseNavigationVC.h"

@interface BaseNavigationVC ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation BaseNavigationVC

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationBar.translucent = NO;
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:0.212 green:0.188 blue:0.427 alpha:1]];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
    
    self.interactivePopGestureRecognizer.delegate = self;
    self.delegate  =self;
}



-(void)viewControllerBackAction:(UIButton *)btn{
    [self popViewControllerAnimated:YES];
}

-(UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)] && animated) {
        self.interactivePopGestureRecognizer.delegate = nil;
    }
    return [super popViewControllerAnimated:animated];
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)] && animated) {
        self.interactivePopGestureRecognizer.delegate = nil;
    }

    if (self.viewControllers.count > 0) {
        UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
        [button setBackgroundColor:[UIColor clearColor]];
        [button setFrame:CGRectMake(0, 0, 25, 25)] ;
        [button setImage:[UIImage imageNamed:@"back_arrow"] forState:UIControlStateNormal] ;
        [button setImage:[UIImage imageNamed:@"back_arrow"] forState:UIControlStateSelected] ;
        [button addTarget:self action:@selector(viewControllerBackAction:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem* item=[[UIBarButtonItem alloc]initWithCustomView:button];
        [viewController.navigationItem setLeftBarButtonItem:item];
        [button setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 0)] ;
    }

    [super pushViewController:viewController animated:animated];
}

#pragma mark - UINavigationControllerDelegate
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)]){
        self.interactivePopGestureRecognizer.delegate = self;
    }
}

#pragma mark - UIGestureRecognizerDelegate
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if (gestureRecognizer == self.interactivePopGestureRecognizer) {
        if (self.viewControllers.count<2||self.visibleViewController==[self.viewControllers objectAtIndex:0]) {
            return NO;
        }
    }
    
    return YES;
}

@end



