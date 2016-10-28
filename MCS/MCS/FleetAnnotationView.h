//
//  FleetAnnotationView.h
//  MCS
//
//  Created by gener on 16/10/19.
//  Copyright © 2016年 Light. All rights reserved.
//

#import <MapKit/MapKit.h>
@class  MKMapView,M2Animation;

@interface FleetAnnotationView : MKAnnotationView

@property(nonatomic,retain)M2Animation * annitataion;

+(FleetAnnotationView *)annotationViewFromMap:(MKMapView*)mapview;

@end
