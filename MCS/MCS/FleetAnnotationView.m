//
//  FleetAnnotationView.m
//  MCS
//
//  Created by gener on 16/10/19.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "FleetAnnotationView.h"

@implementation FleetAnnotationView
{
    NSArray * timeArr;
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.layer.borderColor = DefaultBgColor.CGColor;
    self.layer.borderWidth = 2;
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
    
}


- (IBAction)btn_status:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(faultAnalysis:)]) {
        [self.delegate performSelector:@selector(faultAnalysis:) withObject:@(sender.tag)];
    }
}



+(FleetAnnotationView *)annotationViewFromMap:(MKMapView *)mapview
{
    static NSString * fleetAnnotationviewIdentifier = @"fleetAnnotationviewIdentifier";
    FleetAnnotationView * view = (FleetAnnotationView *)[mapview dequeueReusableAnnotationViewWithIdentifier:fleetAnnotationviewIdentifier];
    if (!view) {
        view  =[[[NSBundle mainBundle]loadNibNamed:@"FleetAnnotationView" owner:nil options:nil] lastObject];
        view.enabled = NO;
        view.centerOffset = CGPointMake(0, -(view.height+45)/2.0);
 
    }
    
    return view;
}



////////
////////
-(void)setFleetStatus:(NSInteger)fleetStatus
{
    timeArr = @[@"09:50",@"09:55",@"10:15",@"10:55",@"11:10",@"12:05"];
    
    [_lineView setFleetStatus:fleetStatus withTime:timeArr];
    
}


@end




