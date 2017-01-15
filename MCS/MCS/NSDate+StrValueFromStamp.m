//
//  NSDate+StrValueFromStamp.m
//  MCS
//
//  Created by gener on 17/1/13.
//  Copyright © 2017年 Light. All rights reserved.
//

#import "NSDate+StrValueFromStamp.h"

@implementation NSDate (StrValueFromStamp)


+(NSString*)stringFromTimeStamp:(NSString*)stamp
                   andFormatter:(NSString*)formatter
{
    if ([stamp isKindOfClass:[NSNull class]]) {
        return @"";
    }
    
    NSString * str= [NSString stringWithFormat:@"%@",stamp];
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:[str doubleValue]/1000];
    NSDateFormatter * _formatter = [[NSDateFormatter alloc]init];
    [_formatter setDateFormat:formatter];
    return [_formatter stringFromDate:date];
}



@end
