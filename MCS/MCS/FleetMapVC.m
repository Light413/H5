//
//  FleetMapVC.m
//  MCS
//
//  Created by gener on 16/10/17.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "FleetMapVC.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MAnimation : NSObject<MKAnnotation>

//默认视图
@property(nonatomic)CLLocationCoordinate2D coordinate;

@property(nonatomic,copy)NSString * title;

@property(nonatomic,copy)NSString * subtitle;
@property(nonatomic,strong)UIImage * image;

@end
@implementation MAnimation

@end

//定义弹出子视图
@interface M2Animation : NSObject<MKAnnotation>
@property(nonatomic)CLLocationCoordinate2D coordinate;

@property(nonatomic,copy)NSString * title;

@property(nonatomic,copy)NSString * subtitle;
@property(nonatomic,strong)UIImage * image;
@end

@implementation M2Animation


@end


@interface FleetMapVC ()<MKMapViewDelegate,FleetInfoCellEventDelegate>
{
    MKMapView *_mapView;
    CLLocationManager * _locationManager;
}
@end

@implementation FleetMapVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initSubviews];

    [self addAnnotations];

    [MBHUD showStatueInView:self.view WithMsg:@"Locating..."];
}

-(void)initSubviews
{
    _locationManager = [[CLLocationManager alloc]init];
    if (![CLLocationManager locationServicesEnabled] || [CLLocationManager authorizationStatus] !=kCLAuthorizationStatusAuthorizedWhenInUse) {
        [_locationManager requestWhenInUseAuthorization];
    }

    _mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, CURRNET_SCREEN_WIDTH, CURRENT_SCREEN_HEIGHT - 64)];
    _mapView.mapType = MKMapTypeStandard;
    _mapView.delegate = self;
    
    _mapView.showsUserLocation = YES;
//    _mapView.userTrackingMode = MKUserTrackingModeFollow;
    [self.view addSubview:_mapView];
}

-(void)addAnnotations
{
    NSArray * arr = @[@{@"lat":@"31.269513",@"lng":@"121.467243"},
                      @{@"lat":@"31.227016",@"lng":@"121.546065"},
                      @{@"lat":@"31.257545",@"lng":@"121.471326"},
                      @{@"lat":@"31.322225",@"lng":@"121.414984"},
                      @{@"lat":@"31.236305",@"lng":@"121.482249"},
                      @{@"lat":@"39.934475",@"lng":@"116.42074"},
                      @{@"lat":@"39.964565",@"lng":@"116.300008"},
                      ];
    
    for (int i =0; i < arr.count; i++) {
        NSDictionary * dic  =arr[i];
        CLLocationCoordinate2D location1=CLLocationCoordinate2DMake([dic[@"lat"]doubleValue], [dic[@"lng"]doubleValue]);
        MAnimation *a1=[[MAnimation alloc]init];
//        a1.title=@"蓝天绿地商务广场";
//        a1.subtitle=@"地址：共和新路1301号b幢 坐标：121.467243,31.269513";
        a1.coordinate=location1;
//        a1.image = [UIImage imageNamed:@"shoplist-navi"];
        a1.image = [UIImage imageNamed:@"plane_5"];
        [_mapView addAnnotation:a1];
    }

    [self fetchNearbyInfo];
}

//搜索附近信息
- (void)fetchNearbyInfo
{
    CLLocationDegrees latitude=116.13554;
    CLLocationDegrees longitude=38.413546;
    CLLocationCoordinate2D location=CLLocationCoordinate2DMake(latitude, longitude);
    
    MKCoordinateRegion region=MKCoordinateRegionMakeWithDistance(location, 5 ,5 );
    MKLocalSearchRequest *requst = [[MKLocalSearchRequest alloc] init];
    requst.region = region;
    requst.naturalLanguageQuery = @"place"; //想要的信息
    MKLocalSearch *localSearch = [[MKLocalSearch alloc] initWithRequest:requst];
    
    [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error){
        if (!error)
        {

        }
        else
        {
 
        }
    }];
}

#pragma mark - MKMapViewDelegate
-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    NSLog(@"%s",__FUNCTION__);
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    [MBHUD dismiss];
}
-(void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
    [MBHUD showErrorInView:self.view WithMsg:@"locate failure"];
    [MBHUD dismiss];
}
-(void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray<MKAnnotationView *> *)views
{
NSLog(@"%s",__FUNCTION__);

}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
NSLog(@"%s",__FUNCTION__);
    if ([view.annotation isKindOfClass:[MAnimation class]]) {
        MAnimation * annotation1 = view.annotation;
        M2Animation * annotation2 = [[M2Animation alloc]init];
        annotation2.coordinate = annotation1.coordinate;
        
        [mapView addAnnotation:annotation2];
    }
}

-(void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view
{
    [mapView.annotations enumerateObjectsUsingBlock:^(id<MKAnnotation>  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[M2Animation class]]) {
            [mapView removeAnnotation:obj];
        }
    }];
}


-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MAnimation class]]) {
        static NSString * annotationReuseIdentifier = @"annotationReuseIdentifier";
        MKAnnotationView * annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:annotationReuseIdentifier];
        if (annotationView == nil) {
           annotationView = [[MKAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:annotationReuseIdentifier];
            annotationView.canShowCallout=NO;
//            annotationView.calloutOffset=CGPointMake(0, 1);//定义详情视图偏移量
//            annotationView.leftCalloutAccessoryView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"50-01"]];//定义详情左侧视图
        }

        annotationView.annotation = annotation;
        annotationView.image = ((MAnimation*)annotation).image;
        return annotationView;
    }
    else if([annotation isKindOfClass:[M2Animation class]])
    {
        FleetAnnotationView * v = [FleetAnnotationView annotationViewFromMap:mapView];
        v.annotation = annotation;
        v.fleetStatus = 3;
        v.delegate = self;
        return v;
    }
    else
    return nil;
}

#pragma mark FleetInfoCellEventDelegate
-(void)faultAnalysis:(id)index
{
    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    NSString *  str = [index integerValue] == 1 ? @"FleetFaultDesVCSBID" : @"FleetStatueInfoVCSBID";
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:str];
    if(vc)
        [self.navigationController pushViewController:vc animated:YES];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
