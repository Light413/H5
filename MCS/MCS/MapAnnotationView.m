//
//  MapAnnotationView.m
//  MCS
//
//  Created by gener on 17/1/16.
//  Copyright © 2017年 Light. All rights reserved.
//

#import "MapAnnotationView.h"

@implementation MapAnnotationView

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.layer.borderColor = DefaultBgColor.CGColor;
    self.layer.borderWidth = 1;
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = YES;
    
}


- (IBAction)dismiss:(id)sender {
    
    [self removeFromSuperview];
}

-(void)fillDataWith:(NSDictionary*)dic
{
    self.fleetNumLable.text = dic[@"aircraftNo"];
    self.flightNumLable.text = dic[@"flightNo"];
    
    self.startTimeLable.text = [NSDate stringFromTimeStamp:dic[@"beginFlightDatetime"] andFormatter:@"MM-dd HH:mm"];
    
    self.startPostionLable.text = dic[@"depCode3"];
    self.arriveLable.text = dic[@"arrCode3"];
    self.lastReportTimeLable.text = [NSDate stringFromTimeStamp:dic[@"lastReportDatetime"] andFormatter:@"MM-dd HH:mm"];
}


+(MapAnnotationView *)annotationViewFromMap:(MKMapView *)mapview
{
    static NSString * fleetAnnotationviewIdentifier = @"fleetAnnotationviewIdentifier";
    MapAnnotationView * view = (MapAnnotationView *)[mapview dequeueReusableAnnotationViewWithIdentifier:fleetAnnotationviewIdentifier];
    if (!view) {
        view  =[[[NSBundle mainBundle]loadNibNamed:@"MapAnnotationView" owner:nil options:nil] lastObject];
        view.enabled = NO;
        view.centerOffset = CGPointMake(0, -(view.height+45)/2.0);
        
    }
    
    return view;
}


@end
