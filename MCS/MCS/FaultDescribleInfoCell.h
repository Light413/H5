//
//  FaultDescribleInfoCell.h
//  MCS
//
//  Created by gener on 17/1/11.
//  Copyright © 2017年 Light. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FaultDescribleInfoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bgview;

@property (weak, nonatomic) IBOutlet UITextField *fleetNum_tf;
@property (weak, nonatomic) IBOutlet UITextField *time_tf;
@property (weak, nonatomic) IBOutlet UIButton *flightsegments_btn;

@property (weak, nonatomic) IBOutlet UILabel *fleetNum_lab;
@property (weak, nonatomic) IBOutlet UILabel *flightNum_lab;
@property (weak, nonatomic) IBOutlet UILabel *arri_des;

@property (weak, nonatomic) IBOutlet UILabel *flightStartTime_lab;
@property (weak, nonatomic) IBOutlet UILabel *reportEndTime_lab;

@property (weak, nonatomic) IBOutlet UILabel *segment_lab;



-(void)setCellWith:(NSDictionary*)dic;





@end
