//
//  FaultDescribleWarnListCell.h
//  MCS
//
//  Created by gener on 17/1/11.
//  Copyright © 2017年 Light. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FaultDescribleWarnListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@property (weak, nonatomic) IBOutlet UIButton *alarmLevelBtn;
@property (weak, nonatomic) IBOutlet UILabel *msgLable;

@property (weak, nonatomic) IBOutlet UILabel *phaseLable;

@property (weak, nonatomic) IBOutlet UILabel *intermittenceLab;

@property (weak, nonatomic) IBOutlet UILabel *statusLable;
@property (weak, nonatomic) IBOutlet UILabel *sourceLable;

@property (weak, nonatomic) IBOutlet UILabel *timeLable;



-(void)setCellWith:(NSDictionary*)dic;

@end
