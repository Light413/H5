//
//  NSDate+StrValueFromStamp.h
//  MCS
//
//  Created by gener on 17/1/13.
//  Copyright © 2017年 Light. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (StrValueFromStamp)


/**
 时间戳转化字符串

 @param stamp
 @param formatter 日期字符串格式（yyyy-MM-dd）
 @return
 */
+(NSString*)stringFromTimeStamp:(NSString*)stamp
                   andFormatter:(NSString*)formatter;



@end
