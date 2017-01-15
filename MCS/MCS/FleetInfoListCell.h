//
//  FleetInfoListCell.h
//  
//
//  Created by gener on 16/12/28.
//
//

#import <UIKit/UIKit.h>

@interface FleetInfoListCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *planeNo;
@property (weak, nonatomic) IBOutlet UILabel *flightNum;
@property (weak, nonatomic) IBOutlet UILabel *start;

@property (weak, nonatomic) IBOutlet UILabel *arrive;

@property (weak, nonatomic) IBOutlet UILabel *flightStartTime;

@property (weak, nonatomic) IBOutlet UILabel *reportEndtime;

@property (weak, nonatomic) IBOutlet UILabel *time_1;
@property (weak, nonatomic) IBOutlet UILabel *time_2;
@property (weak, nonatomic) IBOutlet UILabel *time_3;
@property (weak, nonatomic) IBOutlet UILabel *time_4;
@property (weak, nonatomic) IBOutlet UIButton *alertLevel;
@property (weak, nonatomic) IBOutlet UILabel *planTime;
@property (weak, nonatomic) IBOutlet UILabel *ddNo;
@property (weak, nonatomic) IBOutlet UILabel *status;

@property (nonatomic, copy)void(^cellButtonBlock)(NSInteger);


-(void)setCellWith:(NSDictionary *)dic;


@end
