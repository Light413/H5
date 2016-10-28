//
//  MBHUD.h
//  MCS
//
//  Created by gener on 16/9/6.
//  Copyright © 2016年 Light. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MBHUD : NSObject

//progerss
+(void)showStatueInView:(UIView *)view WithMsg:(NSString *)msg;

//success
+(void)showSuccessInView:(UIView *)view WithMsg:(NSString *)msg;

//error
+(void)showErrorInView:(UIView *)view WithMsg:(NSString *)msg;

//只显示文本
+(void)showTextInView:(UIView *)view WithMsg:(NSString *)msg;

+(void)dismiss;


@end
