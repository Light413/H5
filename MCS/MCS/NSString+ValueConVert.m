//
//  NSString+ValueConVert.m
//  MCS
//
//  Created by gener on 17/1/13.
//  Copyright © 2017年 Light. All rights reserved.
//

#import "NSString+ValueConVert.h"

@implementation NSString (ValueConVert)

+(NSString *)stringFromObj:(id)value
{
    if (!value) {
        value = @"";
    }
    
    return [NSString stringWithFormat:@"%@",value];
}

@end
