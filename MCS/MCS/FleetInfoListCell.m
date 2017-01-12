//
//  FleetInfoListCell.m
//  
//
//  Created by gener on 16/12/28.
//
//

#import "FleetInfoListCell.h"

@implementation FleetInfoListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)setCellWith:(NSDictionary *)dic
{
    self.planeNo.text = dic[@"tailNo"]?dic[@"tailNo"]:@"";
    
    self.flightNum.text = dic[@"flightNumber"]?dic[@"flightNumber"]:@"";

    self.flightStartTime.text = [NSString stringWithFormat:@"%@",[self stringFromData:dic[@"flightDate"]]];
    self.reportEndtime.text = [NSString stringWithFormat:@"%@",[self stringFromData:dic[@"reportDate"]]];
    self.time_1.text = [NSString stringWithFormat:@"%@",[self stringFromData:dic[@"out"] needTime:YES]];
    self.time_2.text = [NSString stringWithFormat:@"%@",[self stringFromData:dic[@"off"] needTime:YES]];
    self.time_3.text = [NSString stringWithFormat:@"%@",[self stringFromData:dic[@"on"] needTime:YES]];
    self.time_4.text = [NSString stringWithFormat:@"%@",[self stringFromData:dic[@"in"] needTime:YES]];
    
    self.ddNo.text = [NSString stringWithFormat:@"%@",dic[@"ddCount"]?dic[@"ddCount"]:@"0"] ;
    
    self.start.text = [NSString stringWithFormat:@"%@",dic[@"dep"]?dic[@"dep"]:@""];
    self.arrive.text = [NSString stringWithFormat:@"%@", dic[@"arr"]?dic[@"arr"]:@""];
    
    //警告等级
    NSString * priority = dic[@"priority"];///null/1/10/120/200/1000
    self.alertLevel.backgroundColor =[UIColor clearColor];
    
    if (![self isNull:priority]) {

        switch ([priority integerValue]) {
            case 1:
                self.alertLevel.backgroundColor = [UIColor colorWithRed:0.980 green:0.349 blue:0.322 alpha:1];
                break;
            case 10:
                self.alertLevel.backgroundColor =[UIColor colorWithRed:0.976 green:0.651 blue:0.255 alpha:1];
                break;
            case 120:
                self.alertLevel.backgroundColor =[UIColor colorWithRed:0.969 green:0.992 blue:0.220 alpha:1];
                break;
            case 200:
                self.alertLevel.backgroundColor =[UIColor colorWithRed:0.816 green:0.820 blue:0.820 alpha:1];
                break;
            case 1000:
                self.alertLevel.backgroundColor =[UIColor colorWithRed:0.231 green:0.592 blue:0.914 alpha:1];
                break;
            default: break;
        }
    }

    
    NSString * eta = dic[@"ahmETA"];
    self.planTime.text = [NSString stringWithFormat:@"%@",[self stringFromData:eta]];
    
    NSString * flightStatus = dic[@"flightStatus"];
    NSString * statueStr = [NSString stringWithFormat:@"%@",flightStatus?flightStatus:@""];
    self.status.text = ^(NSString*value){
        switch ([value integerValue]) {
            case 0:return @"正常";break;
            case 1:return @"滑回";break;
            case 2:return @"返航";break;
            case 3:return @"备降";break;
            default:return @""; break;
        }}(statueStr);
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
