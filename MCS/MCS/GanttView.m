//
//  GanttView.m
//  MCS
//
//  Created by gener on 16/9/20.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "GanttView.h"

@implementation GanttView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor colorWithRed:25/255.0 green:155/255.0 blue:212/255.0 alpha:1];
    btn.frame = CGRectMake(50, 55, 80, 20);
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btn];
}

-(void)btnClick :(UIButton *)btn
{
    if (self.clickActionBlock) {
        _clickActionBlock(btn.tag);
    }
}


- (void)drawRect:(CGRect)rect {
    float origin_x = CGRectGetMinX(rect);
    float origin_y = CGRectGetMinY(rect);
    float width = CGRectGetWidth(rect);
    float height = CGRectGetHeight(rect);

    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 1.0);
    CGContextSetRGBStrokeColor(ctx, 206/255.0, 206/255.0, 206/255.0, 1);
    
    for (int i=1; i < self.rows; i++) {
        CGContextMoveToPoint(ctx, origin_x, 50*i);//origin_y + rowHeight * i +1
        CGContextAddLineToPoint(ctx, width, 50*i);
    }
    
    for (int i=0; i < self.columns; i++) {
        CGContextMoveToPoint(ctx, origin_x + 50 * i +0, origin_y);
        CGContextAddLineToPoint(ctx, origin_x + 50 * i +0, height);
    }
    
    CGContextStrokePath(ctx);
}


@end
