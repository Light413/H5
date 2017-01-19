//
//  MapAnnotationView.h
//  MCS
//
//  Created by gener on 17/1/16.
//  Copyright © 2017年 Light. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MapAnnotationView : MKAnnotationView
@property (weak, nonatomic) IBOutlet UILabel *fleetNumLable;

@property (weak, nonatomic) IBOutlet UILabel *flightNumLable;
@property (weak, nonatomic) IBOutlet UILabel *startTimeLable;
@property (weak, nonatomic) IBOutlet UILabel *startPostionLable;
@property (weak, nonatomic) IBOutlet UILabel *arriveLable;
@property (weak, nonatomic) IBOutlet UILabel *lastReportTimeLable;

+(MapAnnotationView *)annotationViewFromMap:(MKMapView *)mapview;

-(void)fillDataWith:(NSDictionary*)dic;


@end
