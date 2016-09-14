//
//  GGQRScanView.m
//  MCS
//
//  Created by gener on 16/9/12.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "GGQRScanView.h"
#define kTimeInterval   0.01
#define kHeightToTop  100

@implementation GGQRScanView
{
    NSTimer * _timer;
    
    UIImageView * _scanLineImg;//扫描线条
    
    float  _offset_y;//扫描线偏移量
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _timer  = [NSTimer scheduledTimerWithTimeInterval:kTimeInterval target:self selector:@selector(scanTimer) userInfo:nil repeats:YES];
        _offset_y = 0;
    }
    
    return self;
}

-(void)dealloc
{
//    [_timer invalidate];
//    _timer = nil;
    NSLog(@"%@ dealloc",[self class]);
}

-(void)scanTimer
{
    [UIView animateWithDuration:kTimeInterval animations:^{
        _scanLineImg.transform = CGAffineTransformMakeTranslation(0, ++_offset_y);
    } completion:^(BOOL finished) {
        if (_offset_y > _scanSize.height - 5) {
            _offset_y  =0;
            _scanLineImg.transform = CGAffineTransformIdentity;
        }
    }];
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (!_scanLineImg) {
        _scanLineImg = [[UIImageView alloc]initWithFrame:CGRectMake((self.bounds.size.width - _scanSize.width)/2.0, kHeightToTop, _scanSize.width, 2)];
        _scanLineImg.image = [UIImage imageNamed:@"qr_scan_line"];
        _scanLineImg.contentMode = UIViewContentModeScaleAspectFill;

        [self addSubview:_scanLineImg];
    }
    
    //提示信息
    UILabel * msg = [[UILabel alloc]init];
    [self addSubview:msg];
    msg.text = @"请将二维码置于扫描框内";
    msg.textColor = [UIColor whiteColor];
    msg.textAlignment = NSTextAlignmentCenter;
    msg.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray * horizontal = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[msg]|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(msg)];
    [self addConstraints:horizontal];
    
    NSArray * vertical = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[msg(30)]" options:kNilOptions metrics:nil views:NSDictionaryOfVariableBindings(msg)];
    [self addConstraints:vertical];
    
    NSLayoutConstraint * centerOffset= [NSLayoutConstraint constraintWithItem:msg attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:kHeightToTop + self.scanSize.height + 30];
    
    [self addConstraint:centerOffset];
}


- (void)drawRect:(CGRect)rect {
    CGRect scanRect = CGRectMake((rect.size.width - _scanSize.width)/2.0, kHeightToTop, _scanSize.width, _scanSize.height);
    
    //区域填充
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetRGBFillColor(ctx, 40 / 255.0,40 / 255.0,40 / 255.0,0.5);
    CGContextFillRect(ctx, rect);

    //扫描区域
    CGContextClearRect(ctx, scanRect);
    
    //画边框
    CGContextStrokeRect(ctx, scanRect);
    CGContextSetRGBStrokeColor(ctx, 1, 1, 1, 1);
    CGContextSetLineWidth(ctx, 1);
    CGContextAddRect(ctx, scanRect);
    CGContextStrokePath(ctx);
    
    [self addCornerWithContext:ctx inRect:scanRect];
}

#pragma mark - 绘制四个边角
-(void)addCornerWithContext:(CGContextRef)ctx inRect:(CGRect)rect
{
    CGContextSetLineWidth(ctx, 3);
    CGContextSetRGBStrokeColor(ctx, 30/255.0, 170/255.0, 240/255.0, 1);
    float offsetValue = 1.0f;
    float cornerWidth = 20.0f;
    
    //left top
    CGPoint pointLeftTop[] = {
        CGPointMake(rect.origin.x + offsetValue, rect.origin.y + cornerWidth),
        CGPointMake(rect.origin.x + offsetValue, rect.origin.y + offsetValue),
        CGPointMake(rect.origin.x + cornerWidth, rect.origin.y + offsetValue)
    };
    CGContextAddLines(ctx, pointLeftTop, 3);
    
    //left bottom
    CGPoint pointLeftBottom[] = {
        CGPointMake(rect.origin.x + offsetValue, rect.origin.y + rect.size.height - cornerWidth),
        CGPointMake(rect.origin.x + offsetValue, rect.origin.y + rect.size.height - offsetValue),
        CGPointMake(rect.origin.x + cornerWidth, rect.origin.y + rect.size.height - offsetValue)
    };
    
    CGContextAddLines(ctx, pointLeftBottom, 3);
    
    //right top
    CGPoint pointRightTop[] = {
        CGPointMake(rect.origin.x + rect.size.width - cornerWidth, rect.origin.y + offsetValue),
        CGPointMake(rect.origin.x + rect.size.width - offsetValue, rect.origin.y + offsetValue),
        CGPointMake(rect.origin.x + rect.size.width - offsetValue, rect.origin.y + cornerWidth)
    };
    
    CGContextAddLines(ctx, pointRightTop, 3);
    
    //right bottom
    CGPoint pointRigthBottom[] = {
        CGPointMake(rect.origin.x + rect.size.width - cornerWidth, rect.origin.y + rect.size.height - offsetValue),
        CGPointMake(rect.origin.x + rect.size.width - offsetValue, rect.origin.y + rect.size.height - offsetValue),
        CGPointMake(rect.origin.x + rect.size.width - offsetValue, rect.origin.y + rect.size.height - cornerWidth)
    };
    
    CGContextAddLines(ctx, pointRigthBottom, 3);
    
    CGContextStrokePath(ctx);
}


@end
