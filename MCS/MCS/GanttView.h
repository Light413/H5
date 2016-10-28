//
//  GanttView.h
//  MCS
//
//  Created by gener on 16/9/20.
//  Copyright © 2016年 Light. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GanttView : UIView

@property(nonatomic,copy)void (^clickActionBlock)(NSInteger);

@property(nonatomic,assign)NSInteger rows;//行数

@property(nonatomic,assign)NSInteger columns;//时间段

@end
