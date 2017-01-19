//
//  FaultDescribleWarnListCell.m
//  MCS
//
//  Created by gener on 17/1/11.
//  Copyright © 2017年 Light. All rights reserved.
//

#import "FaultDescribleWarnListCell.h"

@implementation FaultDescribleWarnListCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setCellWith:(NSDictionary*)dic
{
    NSDictionary * tmp = [dic[@"detail"]firstObject];
    self.titleLable.text = [NSString stringFromObj:tmp[@"code"]];
    self.msgLable.text = [NSString stringFromObj:tmp[@"message"]];
    self.phaseLable.text = [NSString stringFromObj:tmp[@"phaseName"]] ;
//    self.intermittenceLab.text = tmp[@"message"];
    self.statusLable.text = [NSString stringFromObj:tmp[@"faultStatus"]];
    self.sourceLable.text = [NSString stringFromObj:tmp[@"detailStatus"]];
    self.timeLable.text = [NSDate stringFromTimeStamp:tmp[@"faultOccurrenceDate"] andFormatter:@"MM-dd HH:mm"];
    
    //警告等级
    NSString * priority = dic[@"alarmLevel"];///null/1/10/120/200/1000
    if (![priority isKindOfClass:[NSNull class]]) {
        
        switch ([priority integerValue]) {
            case 1:
                self.alarmLevelBtn.backgroundColor = kAlarmLevelColor_1;
                break;
            case 10:
                self.alarmLevelBtn.backgroundColor = kAlarmLevelColor_2;
                break;
            case 120:
                self.alarmLevelBtn.backgroundColor = kAlarmLevelColor_3;
                break;
            case 200:
                self.alarmLevelBtn.backgroundColor = kAlarmLevelColor_4;
                break;
            case 1000:
                self.alarmLevelBtn.backgroundColor = kAlarmLevelColor_5;
                break;
            default: break;
        }
    }
    
}

-(void)prepareForReuse
{
    self.alarmLevelBtn.backgroundColor =[UIColor clearColor];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
