//
//  FleetStatusLineView.m
//  MCS
//
//  Created by gener on 16/10/13.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "FleetStatusLineView.h"

@implementation FleetStatusLineView
{
    CAShapeLayer * shapLayer;
    NSArray * _timeArr;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.backgroundColor = [UIColor whiteColor];
    [self layoutSubviews0];
}

-(void)layoutSubviews0
{
    NSArray * titleArr = @[@"CLD",@"OUT",@"OFF",@"OON",@"IIN",@"OPN"];
    float _w = (self.width - 10) / 7.0 ,cnt = 0;
    for (int i =0; i < 6; i++) {
        switch (i) {
            case 0:cnt +=0.5; break;
            case 1:
            case 2:cnt +=1.0;break;
            case 3:cnt +=2.0;break;
            case 4:
            case 5:cnt +=1.0;break;
            default:break;
        }

        UILabel * ltime = [[UILabel alloc]init];
        float tmp =0,tmp2 = 0;
        if (i<3) {
            tmp = (_w+ 2) * cnt +10 - 18;
            tmp2 = (_w+ 3) * cnt +10 - 25;
        }
        else
        {
            tmp = (_w+ 2) * cnt +10 - 18 - 12;
            tmp2 = (_w+ 2) * cnt +10 - 20 - 15;
        }
        
        ltime.frame = CGRectMake(tmp, 28 , 35, 20);
        ltime.font = [UIFont systemFontOfSize:12];
        ltime.tag = 20 + i;
        ltime.textColor = [UIColor colorWithRed:0.537 green:0.537 blue:0.537 alpha:1];
        [self addSubview:ltime];
//        ltime.backgroundColor = [UIColor lightGrayColor];
        
        UILabel * titleL = [[UILabel alloc]init];
        titleL.frame = CGRectMake(tmp2, ltime.bottom+5, 40, ltime.height);
        titleL.font = [UIFont systemFontOfSize:13];
        titleL.text = titleArr[i];
        titleL.textColor = [UIColor darkGrayColor];
        titleL.textAlignment = NSTextAlignmentCenter;
//        titleL.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:titleL];
        

    }
}

/**
 *  设置进度
 *
 *  @param fleetStatus 1-6
 *  @param time        time array
 */
-(void)setFleetStatus:(NSInteger)fleetStatus withTime :(NSArray*)time
{
    _timeArr = time;
    self.fleetStatus = fleetStatus;
}

-(void)setFleetStatus:(NSInteger)fleetStatus
{
    if (shapLayer) {
        [shapLayer removeFromSuperlayer];shapLayer = nil;
    }
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    float _ff = 30;
    float _w = (self.width - 10) / 7.0 ,cnt = 0;
    float _h = 0;
    NSInteger point_num =0;
    CGPoint point[8] = {};
    
    for (int i =1; i <= fleetStatus; i++) {
        switch (i) {
            case 1:cnt +=0.5; break;
            case 2:
            case 3:cnt +=1.0;break;
            case 4:cnt +=2.0;break;
            case 5:
            case 6:cnt +=1.0;break;
            default:break;
        }
        
        _h = 5 + _w * cnt;
        if (i <= 3) {
            point[i-1] = CGPointMake(_h, self.height - _ff);
            point_num++;
        }
        if (i==4) {
            point_num +=3;
            point[3] = CGPointMake(5 + _w * (cnt+0.3-2), 10);
            point[4] = CGPointMake(5 + _w * (cnt+1.7-2), 10);
            point[5] = CGPointMake(5 + _w * (cnt), self.height - _ff);
        }
        if (i>=5) {
            point_num++;
            point[i+1] = CGPointMake(_h, self.height - _ff);
        }
        
        UIBezierPath * tmp = [UIBezierPath bezierPath];
        [tmp addArcWithCenter:CGPointMake(_h, self.height - _ff) radius:2 startAngle:0 endAngle:360 clockwise:1];
        [path appendPath:tmp];
    }

    if (_h > 0) {
        [path moveToPoint:CGPointMake(10, self.height - _ff)];
        for (int i=0; i< point_num; i++) {
            [path addLineToPoint:CGPointMake(point[i].x, point[i].y)];
        }
    }
    
    shapLayer = [CAShapeLayer layer];
    shapLayer.strokeColor = [UIColor colorWithRed:30/255.0 green:170/255.0 blue:240/255.0 alpha:1].CGColor;
    shapLayer.fillColor = [UIColor clearColor].CGColor;
    shapLayer.fillRule = kCAFillRuleEvenOdd;
    shapLayer.lineWidth = 2.0f;
    shapLayer.path = path.CGPath;
    shapLayer.strokeEnd = 1;
    [self.layer addSublayer:shapLayer];
    
    //设置时间
    [self setTimeWithFleetStatus:fleetStatus];
}


-(void)drawRect:(CGRect)rect
{
    float _ff = 30;
    CGContextRef ctx =  UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 1.5f);
    CGContextSetRGBStrokeColor(ctx, 221/255.0, 221/255.0, 230/255.0, 1);
    CGContextSetRGBFillColor(ctx, 221/255.0, 221/255.0, 221/255.0, 1);
    
    CGPoint point[9] = {};
    point[0] = CGPointMake(10, self.height - _ff);
    
    float _w = (self.width - 10) / 7.0 ,cnt = 0;
    for (int i =0; i < 6; i++) {
        switch (i) {
            case 0:cnt +=0.5; break;
            case 1:
            case 2:cnt +=1.0;break;
            case 3:cnt +=2.0;break;
            case 4:
            case 5:cnt +=1.0;break;
            default:break;
        }
        if (i <= 2) {
          point[i+1] = CGPointMake(5 + _w * cnt, self.height - _ff);
        }
        if (i==2) {
            point[4] = CGPointMake(5 + _w * (cnt+0.3), 10);
            point[5] = CGPointMake(5 + _w * (cnt+1.7), 10);
        }
        if (i>=3) {
            point[i+3] = CGPointMake(5 + _w * cnt, self.height - _ff);
        }
        
        CGContextAddArc(ctx, 5 + _w * cnt , self.height - _ff, 3, 0, 360, 0);
        CGContextFillPath(ctx);
    }

    CGContextAddLines(ctx, point, 9);
    CGContextStrokePath(ctx);
}

//设置时间
-(void)setTimeWithFleetStatus:(NSInteger)status
{
    [self clearTime];
    for (int i =0; i < status; i++) {
        UIView *_v = [self viewWithTag:20+i ];
        if ([_v isKindOfClass:[UILabel class]]) {
            [((UILabel*)_v) setText:_timeArr[i]];
        }
    }
}
-(void)clearTime
{
    for (int i =0; i < 6; i++) {
        UIView *_v = [self viewWithTag:20+i ];
        if ([_v isKindOfClass:[UILabel class]]) {
            [((UILabel*)_v) setText:@""];
        }
    }
}


@end
