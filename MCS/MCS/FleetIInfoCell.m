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
    NSMutableArray * _timeDataArray;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.borderColor = [UIColor colorWithRed:0.792 green:0.792 blue:0.792 alpha:0.3].CGColor;
    self.layer.borderWidth = 0.5;
    
//    _lineView.layer.borderColor = [UIColor greenColor].CGColor;
//    _lineView.layer.borderWidth = 1.0;
    
 //   _iconImg.layer.masksToBounds = YES;
   // _iconImg.layer.cornerRadius = 32.5;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(checkFault:)];
    [_iconImg addGestureRecognizer:tap];
    _timeDataArray = [[NSMutableArray alloc]init];
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


//-(void)setFleetStatus:(NSInteger)fleetStatus
//{
//    timeArr = @[@"09:50",@"09:55",@"10:15",@"10:55",@"11:10",@"12:05"];
//
//    [_lineView setFleetStatus:fleetStatus withTime:timeArr];
//}

//时间进度
-(void)setFleetStatus:(NSDictionary *)dic
{
    [_timeDataArray removeAllObjects];
    timeArr = @[
                [self stringFromData:dic[@"flightDate"] needTime:YES],
                [self stringFromData:dic[@"out"] needTime:YES],
                [self stringFromData:dic[@"off"] needTime:YES],
                [self stringFromData:dic[@"on"] needTime:YES],
                [self stringFromData:dic[@"in"] needTime:YES]
                ];
    
    for (int i=0; i < timeArr.count; i++) {
        NSString * tmp = timeArr[i];
        if ([tmp isEqualToString:@""]) {
            for (int j = i+1; j < timeArr.count; j++) {
                NSString * tmp2 = timeArr[j];
                if (![tmp2 isEqualToString:@""]) {
                    [_timeDataArray addObject:tmp2];break;
                }
            }
        }
        else
        {
            [_timeDataArray addObject:tmp];
        }
    }

    [_lineView setFleetStatus:_timeDataArray.count withTime:_timeDataArray];
}

-(void)setCellWith:(NSDictionary *)dic
{
    self.planeNo.text = dic[@"tailNo"]?dic[@"tailNo"]:@"";
    
    self.flightNum.text = dic[@"flightNumber"]?dic[@"flightNumber"]:@"";
    
    //警告等级
    NSString * priority = dic[@"priority"];///null/1/10/120/200/1000
    NSInteger imgindex = 0;
    if (![self isNull:priority]) {
        self.iconImg.userInteractionEnabled = YES;
        switch ([priority integerValue]) {
            case 1:
                imgindex = 5;
                break;
            case 10:
                imgindex = 4;
                break;
            case 120:
                imgindex = 3;
                break;
            case 200:
                imgindex = 2;
                break;
            case 1000:
                imgindex = 1;
                break;
            default: break;
        }
    }
    
    self.iconImg.image = [UIImage imageNamed:[NSString stringWithFormat:@"plane_%ld",imgindex]];
//    self.alertNo.text = [NSString stringWithFormat:@"%@",priority && ![self isNull:priority] ? priority:@"0"];
    
    
    self.ddNo.text = [NSString stringWithFormat:@"%@",dic[@"ddCount"]?dic[@"ddCount"]:@"0"] ;
    
    self.start.text = [NSString stringWithFormat:@"%@",dic[@"dep"]?dic[@"dep"]:@""];
    
    self.arrive.text = [NSString stringWithFormat:@"%@", dic[@"arr"]?dic[@"arr"]:@""];
    
     NSString * eta = dic[@"ahmETA"];
    self.planTime.text = [NSString stringWithFormat:@"%@",[self stringFromData:eta]];
    
    NSString * flightStatus = dic[@"flightStatus"];
    NSLog(@"......... %@",flightStatus);
    NSString * statueStr = [NSString stringWithFormat:@"%@",dic[@"flightStatus"]?dic[@"flightStatus"]:@""];
    
    [self.status setTitle:@"正常" forState:UIControlStateNormal];
    
    [self setFleetStatus:dic];
}


#pragma mark - private methods
-(void)prepareForReuse
{
    self.iconImg.userInteractionEnabled = NO;
}

-(BOOL)isNull:(id)obj
{
    return [obj isKindOfClass:[NSNull class]];
}

-(NSString*)stringFromData:(NSString*)eta
{
    return [self stringFromData:eta needTime:NO];
}

-(NSString*)stringFromData:(NSString*)eta needTime:(BOOL)_b
{
    if ([self isNull:eta]) {
        return @"";
    }
    
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:[eta doubleValue]/1000];
    NSDateFormatter * _formatter = [[NSDateFormatter alloc]init];
    [_formatter setDateFormat:_b?@"HH:mm":@"MM-dd HH:mm"];
    return [_formatter stringFromDate:date];
}

@end



