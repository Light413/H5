//
//  WarnHandleCell.h
//  MCS
//
//  Created by gener on 16/11/4.
//  Copyright © 2016年 Light. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WarnHandleCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *fleetNumLable;

@property (weak, nonatomic) IBOutlet UILabel *flightNumLable;

@property (weak, nonatomic) IBOutlet UILabel *ataNumLable;

@property (weak, nonatomic) IBOutlet UILabel *segmentLable;

@property (weak, nonatomic) IBOutlet UILabel *msgTimeLable;

@property (weak, nonatomic) IBOutlet UILabel *statusLable;

@property (weak, nonatomic) IBOutlet UILabel *faultTimeLable;

@property (weak, nonatomic) IBOutlet UILabel *alarmLevelLable;

@property (nonatomic, copy)void(^cellButtonBlock)(NSInteger);

-(void)setCellWith:(NSDictionary *)dic;


@end
