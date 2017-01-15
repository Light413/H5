//
//  FaultDescribleInfoCell.m
//  MCS
//
//  Created by gener on 17/1/11.
//  Copyright © 2017年 Light. All rights reserved.
//

#import "FaultDescribleInfoCell.h"

@implementation FaultDescribleInfoCell
{
    BaseViewController * presentViewController;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bgview.layer.cornerRadius = 5;
    self.bgview.layer.masksToBounds = YES;
    self.bgview.layer.borderWidth = 0.3;
    self.bgview.layer.borderColor = [UIColor darkGrayColor].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)selectDateAction:(UIButton*)sender {
    CalendarView * view = [[CalendarView alloc]initWithFrame:CGRectMake(0, 0, 360, 350)];
    view.delegate = self;
    
    presentViewController = [[BaseViewController alloc]init];
    presentViewController.modalPresentationStyle = UIModalPresentationPopover;
    presentViewController.popoverPresentationController.sourceView = sender;
    presentViewController.popoverPresentationController.sourceRect = sender.bounds;
    presentViewController.preferredContentSize =view.frame.size;
    presentViewController.view = view;
    
    presentViewController.view.maskView.backgroundColor = [UIColor blackColor];
    presentViewController.view.maskView.bounds =[[UIScreen mainScreen]bounds];
    
    [self.window.rootViewController presentViewController:presentViewController animated:YES completion:nil];
}

-(void)calendarViewDidSelectedWithDate:(NSDate *)date
{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString * timeStr = [formatter stringFromDate:date];
    self.time_tf.text = timeStr;
    [self.window.rootViewController dismissViewControllerAnimated:presentViewController completion:nil];
}

/*
 {
 arr = BKK;
 arrCNN = "\U66fc\U8c37\U56fd\U9645\U673a\U573a";
 arrENN = SUVARNABHUMI;
 arrHighlandType = 0;
 dep = PEK;
 depCNN = "\U9996\U90fd\U56fd\U9645\U673a\U573a";
 depENN = NANYUAN;
 depHighlandType = 0;
 flightNumber = CA757;
 lastReportTime = 1483552800000;
 leg = 0;
 legId = 402886c6596e3f9901596e749409001d;
 legStartTime = 1483548240000;
 maxLeg = 952;
 tailId = ABCDEFGHIJKLMNOPQRSTUVWXYZ400287;
 tailNo = "B-2032";
 };
*/

-(void)setCellWith:(NSDictionary *)dic
{
    self.fleetNum_tf.text = dic[@"tailNo"];
    self.time_tf.text = [NSDate stringFromTimeStamp:dic[@"lastReportTime"] andFormatter:@"yyyy-MM-dd"];
    [self.flightsegments_btn setTitle:[NSString stringFromObj:dic[@"leg"]] forState:UIControlStateNormal];
    
    self.fleetNum_lab.text = dic[@"tailNo"];
    self.flightNum_lab.text = dic[@"flightNumber"];
    self.arri_des.text = [NSString stringWithFormat:@"%@/%@",dic[@"dep"],dic[@"arr"]] ;
    self.flightStartTime_lab.text = [NSDate stringFromTimeStamp:dic[@"legStartTime"] andFormatter:@"yyyy-MM-dd HH:mm"];
    self.reportEndTime_lab.text = [NSDate stringFromTimeStamp:dic[@"lastReportTime"] andFormatter:@"yyyy-MM-dd HH:mm"];
    self.segment_lab.text = [NSString stringFromObj:dic[@"leg"]];
}









@end
