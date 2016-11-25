//
//  FleetAnnotationView.h
//  MCS
//
//  Created by gener on 16/10/19.
//  Copyright © 2016年 Light. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "FleetStatusLineView.h"
@protocol FleetInfoCellEventDelegate <NSObject>

-(void)faultAnalysis :(id)obj;//故障分析


@end


@class  MKMapView,M2Animation;

@interface FleetAnnotationView : MKAnnotationView

@property(nonatomic,retain)M2Animation * annitataion;

@property(nonatomic,assign)NSInteger fleetStatus;

@property(nonatomic,assign) id<FleetInfoCellEventDelegate>delegate;
@property (weak, nonatomic) IBOutlet FleetStatusLineView *lineView;

@property (weak, nonatomic) IBOutlet UIButton *iconBtn;
@property (weak, nonatomic) IBOutlet UILabel *planeNo;//飞机号

@property (weak, nonatomic) IBOutlet UILabel *alertNo;

@property (weak, nonatomic) IBOutlet UILabel *ddNo;

@property (weak, nonatomic) IBOutlet UILabel *flightNum;//航班号
@property (weak, nonatomic) IBOutlet UILabel *start;
@property (weak, nonatomic) IBOutlet UILabel *arrive;
@property (weak, nonatomic) IBOutlet UILabel *planTime;
@property (weak, nonatomic) IBOutlet UIButton *statusBtn;



+(FleetAnnotationView *)annotationViewFromMap:(MKMapView*)mapview;

@end
