//
//  WarnDescribleFaultInfoCell.h
//  MCS
//
//  Created by wyg on 2017/1/15.
//  Copyright © 2017年 Light. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WarnDescribleFaultInfoCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *fleetNumLable;
@property (weak, nonatomic) IBOutlet UILabel *flightNumLable;
@property (weak, nonatomic) IBOutlet UILabel *statueLable;

@property (weak, nonatomic) IBOutlet UILabel *segmentLable;
@property (weak, nonatomic) IBOutlet UILabel *faultTimeLable;
@property (weak, nonatomic) IBOutlet UILabel *faultMsgLable;
@property (weak, nonatomic) IBOutlet UILabel *arriveanddesLable;
@property (weak, nonatomic) IBOutlet UISegmentedControl *historySegments;

-(void)setCellWith:(NSDictionary*)dic;


@end
