//
//  FleetAnnotationView.m
//  MCS
//
//  Created by gener on 16/10/19.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "FleetAnnotationView.h"

@implementation FleetAnnotationView

-(void)awakeFromNib
{
    [super awakeFromNib];
    self.layer.borderColor = DefaultBgColor.CGColor;
    self.layer.borderWidth = 2;
    self.layer.cornerRadius = 10;
    self.layer.masksToBounds = YES;
}


+(FleetAnnotationView *)annotationViewFromMap:(MKMapView *)mapview
{
    static NSString * fleetAnnotationviewIdentifier = @"fleetAnnotationviewIdentifier";
    FleetAnnotationView * view = (FleetAnnotationView *)[mapview dequeueReusableAnnotationViewWithIdentifier:fleetAnnotationviewIdentifier];
    if (!view) {
        view  =[[[NSBundle mainBundle]loadNibNamed:@"FleetAnnotationView" owner:self options:nil] lastObject];
        view.enabled = NO;
        view.centerOffset = CGPointMake(0, -(view.height+30)/2.0);
    }
    
    return view;
}

-(void)drawRect:(CGRect)rect
{


}

@end




