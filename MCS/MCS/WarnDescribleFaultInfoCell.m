//
//  WarnDescribleFaultInfoCell.m
//  MCS
//
//  Created by wyg on 2017/1/15.
//  Copyright © 2017年 Light. All rights reserved.
//

#import "WarnDescribleFaultInfoCell.h"

@implementation WarnDescribleFaultInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setCellWith:(NSDictionary*)dic
{
    if (dic) {
        self.fleetNumLable.text = dic[@"tailNo"];
        self.flightNumLable.text = dic[@"flightNumber"];
        
        //状态
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
        self.statueLable.text = str;
        self.statueLable.backgroundColor = clor;
        
        
        
        self.segmentLable.text = dic[@"leg"];
        self.faultTimeLable.text = [NSDate stringFromTimeStamp:dic[@"productDatetime"] andFormatter:@"yyyy-MM-dd HH:mm"];
        
#warning //.....
        self.faultMsgLable.text = @"N/A-";
        
        self.arriveanddesLable.text = [NSString stringWithFormat:@"%@ / %@",dic[@"dep"],dic[@"arr"]];
        
        
    }
}


-(void)prepareForReuse
{
    self.statueLable.text = @"";
    self.statueLable.backgroundColor = [UIColor clearColor];
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
