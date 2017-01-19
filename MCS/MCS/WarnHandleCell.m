//
//  WarnHandleCell.m
//  MCS
//
//  Created by gener on 16/11/4.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "WarnHandleCell.h"

@implementation WarnHandleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setCellWith:(NSDictionary *)dic
{
    self.fleetNumLable.text = [NSString stringFromObj:dic[@"tailNo"]];
     self.flightNumLable.text = [NSString stringFromObj:dic[@"flightNumber"]];
     self.ataNumLable.text = [NSString stringFromObj:dic[@"ataNo"]];
     self.segmentLable.text = [NSString stringFromObj:dic[@"leg"]];
     self.msgTimeLable.text = [NSDate stringFromTimeStamp:dic[@"messageTime"] andFormatter:@"MM-dd HH:mm"] ;
    
    //状态
    /**  告警chengkun
     m.put("0", "新告警");
     m.put("3", "监控");
     m.put("5", "拒绝");
     m.put("8", "已进入维修流程");
     m.put("10", "完成");
     m.put("21", "无效");
     m.put("71", "监控关闭");
     m.put("72", "抑制关闭");
     m.put("91", "系统自动过期");
     */
    
//    .fault_alarm_status_0{
//        background-color:#9999CC; /* 紫色 */
//    }
//    .fault_alarm_status_3 {
//        background-color: #f89406;/* warning */
//    }
//    .fault_alarm_status_5 {
//        background-color: #999999;/* default */
//    }
//    .fault_alarm_status_8 {
//        background-color: #468847;/* success */
//    }
//    .fault_alarm_status_2 {
//        background-color: #468847;/* success */
//    }
//    .fault_alarm_status_10 {
//        background-color: #999999;/* default */
//    }
//    .fault_alarm_status_21 {
//        background-color: #999999;/* default */
//    }
//    .fault_alarm_status_71 {
//        background-color: #999999;/* default */
//    }
//    .fault_alarm_status_72 {
//        background-color: #999999;/* default */
//    }
//    .fault_alarm_status_91 {
//        background-color: #999999;/* default */
//    }
    
    NSInteger status = [dic[@"status"] integerValue];
    NSString * str;
    UIColor * clor = [UIColor clearColor];
    switch (status) {
        case 0:
            str = @"新告警";
            clor = [UIColor colorWithRed:0x99/255.0 green:0x99/255.0 blue:0xCC/255.0 alpha:1];
            break;
        case 3:
            str = @"监控";
            clor = [UIColor colorWithRed:0xf8/255.0 green:0x94/255.0 blue:0x06/255.0 alpha:1];
            break;
        case 5:
            str = @"拒绝";
            clor = [UIColor colorWithRed:0x99/255.0 green:0x99/255.0 blue:0x99/255.0 alpha:1];
            break;
        case 8:
            str = @"已进入维修流程";
            clor = [UIColor colorWithRed:0x46/255.0 green:0x88/255.0 blue:0x47/255.0 alpha:1];
            break;
        case 10:
            str = @"完成";
            clor = [UIColor colorWithRed:0x99/255.0 green:0x99/255.0 blue:0x99/255.0 alpha:1];
            break;
        case 21:
            str = @"无效";
            clor = [UIColor colorWithRed:0x99/255.0 green:0x99/255.0 blue:0x99/255.0 alpha:1];
            break;
        case 71:
            str = @"监控关闭";
            clor = [UIColor colorWithRed:0x99/255.0 green:0x99/255.0 blue:0x99/255.0 alpha:1];
            break;
        case 72:
            str = @"抑制关闭";
            clor = [UIColor colorWithRed:0x99/255.0 green:0x99/255.0 blue:0x99/255.0 alpha:1];
            break;
        case 91:
            str = @"系统自动过期";
            clor = [UIColor colorWithRed:0x99/255.0 green:0x99/255.0 blue:0x99/255.0 alpha:1];
            break;
        default:break;
    }
    self.statusLable.text = str;
    self.statusLable.backgroundColor = clor;
    
    self.faultTimeLable.text = [NSDate stringFromTimeStamp:dic[@"createDatetime"] andFormatter:@"MM-dd HH:mm"];
    
    //警告等级
    ///null/1/10/120/200/1000
    self.alarmLevelLable.backgroundColor =[UIColor clearColor];
    NSInteger index = [[NSString stringFromObj:dic[@"alarmLevel"]] integerValue];
    if (index) {
        switch (index) {
            case 1:
                self.alarmLevelLable.backgroundColor = kAlarmLevelColor_1;
                break;
            case 10:
                self.alarmLevelLable.backgroundColor = kAlarmLevelColor_2;
                break;
            case 120:
                self.alarmLevelLable.backgroundColor = kAlarmLevelColor_3;
                break;
            case 200:
                self.alarmLevelLable.backgroundColor = kAlarmLevelColor_4;
                break;
            case 1000:
                self.alarmLevelLable.backgroundColor = kAlarmLevelColor_5;
                break;
            default: break;
        }
    }
}




/*
 {
 aircraftsubtype = "A321-232";
 aircraftsubtypeId = C782E6EA52194EF38D2E9F4AFE7E28A4;
 alarmLevel = 1;
 arriveDatetime = 1484181351000;
 ataNo = 23;
 controlUnit = "\U6d59\U6c5f";
 createDatetime = 1484185215000;
 detail =     (
 {
 alarmEventId = 402886c659920a310159920c95db0285;
 alarmType = 10;
 code = 2311;
 id = 402886c659920a310159920c95db0286;
 isservicemessage = 0;
 message = "COM HF 1 DATA FAULT";
 }
 );
 
 flightNumber = CA1905;
 id = 402886c659920a310159920c95db0285;
 lastFaultDatetime = 1484181300000;
 leg = "-2";
 legId = 402886c659920a310159920c92930279;
 messageTime = 1484181300000;
 sourceType = 10;
 status = 0;
 tailId = C782E6EA52194EF38D2E9F4AFE7E0227;
 tailNo = "B-6848";
 type = 10;
 version = 0;
 }
 */
#pragma mark - private methods
-(void)prepareForReuse
{
    self.alarmLevelLable.backgroundColor =[UIColor clearColor];
    self.statusLable.text = @"";
    self.statusLable.backgroundColor = [UIColor clearColor];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
