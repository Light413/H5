//
//  UIButton+ExternValue.m
//  MCS
//
//  Created by gener on 17/1/17.
//  Copyright © 2017年 Light. All rights reserved.
//

#import "UIButton+ExternValue.h"
#import <objc/runtime.h>

@implementation UIButton (ExternValue)

-(void)setID:(NSString *)ID
{
    objc_setAssociatedObject(self, @selector(ID), ID, OBJC_ASSOCIATION_COPY);
}


-(NSString *)ID
{
    return objc_getAssociatedObject(self, @selector(ID));
}


@end
