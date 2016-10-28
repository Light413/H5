//
//  FleetIInfoCell.m
//  MCS
//
//  Created by gener on 16/10/12.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "FleetIInfoCell.h"

#define kLine_Point_X 50

@implementation FleetIInfoCell
{
    CAShapeLayer * shapLayer;
    NSArray * timeArr;
}


- (void)awakeFromNib {
    [super awakeFromNib];

//    _lineView.layer.borderColor = [UIColor greenColor].CGColor;
//    _lineView.layer.borderWidth = 1.0;
    
    _iconImg.layer.masksToBounds = YES;
    _iconImg.layer.cornerRadius = 32.5;
}


-(void)setFleetStatus:(NSInteger)fleetStatus
{
    timeArr = @[@"09:50",@"09:55",@"10:15",@"10:55",@"11:10",@"12:05"];

    [_lineView setFleetStatus:fleetStatus withTime:timeArr];

}
















/*
-(void)layoutSubviews0
{
    NSArray * titleArr = @[@"CLD",@"OUT",@"OFF",@"OON",@"IIN",@"OPN"];
    float _w = (self.height - 20) / 7.0 ,cnt = 0;
    for (int i =0; i < 6; i++) {
        switch (i) {
            case 0:cnt +=0.5; break;
            case 1:
            case 2:
            case 3:cnt +=1.0;break;
            case 4:
            case 5:cnt +=1.5;break;
            default:break;
        }

        UILabel * l = [[UILabel alloc]init];
        l.frame = CGRectMake(15, 0 + _w * cnt, 30, 20);
        l.font = [UIFont systemFontOfSize:12];
        l.text = titleArr[i];
        l.textColor = [UIColor darkGrayColor];
//        l.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:l];

        UILabel * ltime = [[UILabel alloc]init];
        ltime.frame = CGRectMake(60, l.top, 50, 20);
        ltime.font = [UIFont systemFontOfSize:13];
        ltime.tag = 20 + i;
        [self addSubview:ltime];
    }
}

// finished  color :(ctx, 30/255.0, 170/255.0, 240/255.0, 1)
// unfinshed color :(ctx, 220/255.0, 220/255.0, 220/255.0, 1)
-(void)setFleetStatus:(NSInteger)fleetStatus
{
    if (shapLayer) {
        [shapLayer removeFromSuperlayer];shapLayer = nil;
    }
    
    UIBezierPath * path = [UIBezierPath bezierPath];

    float _w = (self.height - 20) / 7.0 ,cnt = 0;
    float _h = 0;
    for (int i =1; i <= fleetStatus; i++) {
        switch (i) {
            case 1:cnt +=0.5; break;
            case 2:
            case 3:
            case 4:cnt +=1.0;break;
            case 5:
            case 6:cnt +=1.5;break;
            default:break;
        }
        
        _h = 10 + _w * cnt;
        UIBezierPath * tmp = [UIBezierPath bezierPath];
        [tmp addArcWithCenter:CGPointMake(kLine_Point_X, _h) radius:2 startAngle:0 endAngle:360 clockwise:1];
        [path appendPath:tmp];
        if (i == 6)  _h = 10 + _w * (cnt+0.5);
    }

//    UIBezierPath * line = [UIBezierPath bezierPath];
//    [line moveToPoint:CGPointMake(15, 10)];
//    [line addLineToPoint:CGPointMake(15, _h)];
//    [path appendPath:line];
    if (_h > 0) {
        [path moveToPoint:CGPointMake(kLine_Point_X, 10)];
        [path addLineToPoint:CGPointMake(kLine_Point_X, _h)];
    }

    shapLayer = [CAShapeLayer layer];
    shapLayer.strokeColor = [UIColor colorWithRed:30/255.0 green:170/255.0 blue:240/255.0 alpha:1].CGColor;
    shapLayer.fillColor = [UIColor colorWithRed:30/255.0 green:170/255.0 blue:240/255.0 alpha:1].CGColor;
    shapLayer.lineWidth = 2;
    shapLayer.path = path.CGPath;
    [self.layer addSublayer:shapLayer];
    
    [self setTimeWithFleetStatus:fleetStatus];
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];

    CGContextRef ctx =  UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, kLine_Point_X, 10);
    CGContextAddLineToPoint(ctx, kLine_Point_X, self.height - 10);
    CGContextSetLineWidth(ctx, 2);
    CGContextSetRGBStrokeColor(ctx, 220/255.0, 220/255.0, 220/255.0, 1);
    CGContextStrokePath(ctx);

    float _w = (self.height - 20) / 7.0 ,cnt = 0;
    for (int i =0; i < 6; i++) {
        switch (i) {
            case 0:cnt +=0.5; break;
            case 1:
            case 2:
            case 3:cnt +=1.0;break;
            case 4:
            case 5:cnt +=1.5;break;
            default:break;
        }
        CGContextAddArc(ctx, kLine_Point_X , 10 + _w * cnt, 3, 0, 360, 0);
        CGContextSetRGBFillColor(ctx, 220/255.0, 220/255.0, 220/255.0, 1);
        CGContextFillPath(ctx);
    }

    CGContextStrokePath(ctx);
}

//设置时间
-(void)setTimeWithFleetStatus:(NSInteger)status
{
    [self clearTime];
    for (int i =0; i < status; i++) {
        UIView *_v = [self viewWithTag:20+i ];
        if ([_v isKindOfClass:[UILabel class]]) {
            [((UILabel*)_v) setText:timeArr[i]];
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
*/

@end
