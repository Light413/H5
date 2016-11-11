//
//  MBHUD.m
//  MCS
//
//  Created by gener on 16/9/6.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "MBHUD.h"

#import <MBProgressHUD/MBProgressHUD.h>
#define kDelayTime 0.8

@implementation MBHUD
{
    MBProgressHUD * hud;
}


+(instancetype)sington
{
    static dispatch_once_t once;
    static MBHUD * _sington = nil;
    
    dispatch_once(&once, ^{
        _sington = [[MBHUD alloc]init];
    });
    
    return _sington;
}

-(void)showInView:(UIView *)view WithMsg:(NSString *)msg
{
    hud = [[MBProgressHUD alloc]initWithView:view];
    hud.removeFromSuperViewOnHide = YES;
    [view addSubview:hud];
    hud.labelText = msg;

    [hud show:YES];
}

-(void)showInView:(UIView *)view WithMsg:(NSString *)msg withType:(BOOL)_b
{
    hud = [[MBProgressHUD alloc]initWithView:view];
    hud.removeFromSuperViewOnHide = YES;
    [view addSubview:hud];
    hud.labelText = msg;
    
    UIImage *image = [UIImage imageNamed:_b ? @"success" : @"error"];
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.mode = MBProgressHUDModeCustomView;
    
    [hud show:YES];
    [hud hide:YES afterDelay:kDelayTime];
}

-(void)showTextInView:(UIView *)view WithMsg:(NSString *)msg
{
    hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = msg;
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hide:YES afterDelay:kDelayTime];
}

-(void)dismiss
{
    [hud hide:YES];
}


#pragma mark
+(void)showStatueInView:(UIView *)view WithMsg:(NSString *)msg
{
    [[self sington] showInView:view WithMsg:msg];
}

+(void)showSuccessInView:(UIView *)view WithMsg:(NSString *)msg
{
    [[self sington] showInView:view WithMsg:msg withType:YES];
}

+(void)showErrorInView:(UIView *)view WithMsg:(NSString *)msg
{
    [[self sington] showInView:view WithMsg:msg withType:NO];
}

+(void)showTextInView:(UIView *)view WithMsg:(NSString *)msg
{
    [[self sington] showTextInView:view WithMsg:msg];
}

+(void)dismiss
{
    [[self sington]dismiss];
}

@end
