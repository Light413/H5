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
    self.layer.borderColor = [UIColor colorWithRed:0.792 green:0.792 blue:0.792 alpha:1].CGColor;
    self.layer.borderWidth = 1.0;
    
//    _lineView.layer.borderColor = [UIColor greenColor].CGColor;
//    _lineView.layer.borderWidth = 1.0;
    
 //   _iconImg.layer.masksToBounds = YES;
   // _iconImg.layer.cornerRadius = 32.5;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(checkFault:)];
    [_iconImg addGestureRecognizer:tap];
}

-(void)checkFault :(UITapGestureRecognizer *)ges
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(faultAnalysis:)]) {
        [self.delegate performSelector:@selector(faultAnalysis:) withObject:@1];
    }
}

- (IBAction)btn_status:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(faultAnalysis:)]) {
        [self.delegate performSelector:@selector(faultAnalysis:) withObject:@2];
    }
}


-(void)setFleetStatus:(NSInteger)fleetStatus
{
    timeArr = @[@"09:50",@"09:55",@"10:15",@"10:55",@"11:10",@"12:05"];

    [_lineView setFleetStatus:fleetStatus withTime:timeArr];

}




@end



