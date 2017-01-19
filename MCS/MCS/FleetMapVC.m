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

@property(nonatomic,assign)NSInteger  index;//数据源中的索引

@end
@implementation MAnimation

@end

//定义弹出子视图
@interface M2Animation : NSObject<MKAnnotation>

@property(nonatomic)CLLocationCoordinate2D coordinate;
@property(nonatomic,copy)NSString * title;
@property(nonatomic,copy)NSString * subtitle;
@property(nonatomic,strong)UIImage * image;
@property(nonatomic)NSDictionary * dic;

@end

@implementation M2Animation

@end


@interface FleetMapVC ()<MKMapViewDelegate,FleetInfoCellEventDelegate>
{
    MKMapView *_mapView;
    CLLocationManager * _locationManager;
    
     BOOL _firstFlag;
    NSArray * _dataArray;
}
@end

@implementation FleetMapVC

- (void)viewDidLoad {
    [super viewDidLoad];
    _firstFlag = YES;
    
    [self initSubviews];
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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (_firstFlag) {
        _firstFlag = NO;
        [self loadData];
    }
    
}

-(void)loadData
{
    [SVProgressHUD showWithStatus:@"Loading..."];

    RequestTaskHandle * task = [RequestTaskHandle taskWith:kFleetPosListUrl parms:[NSDictionary dictionaryWithObjectsAndKeys:kTeantCode,@"tenantCode", nil] andSuccess:^(NSURLSessionDataTask *task, id responseObject) {
        if (responseObject && [responseObject isKindOfClass:[NSArray class]]) {
            _dataArray = responseObject ;
            [self addAnnotations];
        }
        [SVProgressHUD dismiss];;

    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD showInfoWithStatus:@"Failed from server"];
    }];
    
    
    [HttpManager doGetWithTask:task];
}


-(void)addAnnotations
{
    for (int i =0; i < _dataArray.count; i++) {
        NSDictionary * dic  =_dataArray[i];
        double lat= [dic[@"lastLatitude"]doubleValue];
        double log = [dic[@"lastLongitude"]doubleValue];
        if ((NSInteger)lat == 0 && (NSInteger)log == 0) {
            continue;
        }

        CLLocationCoordinate2D location1=CLLocationCoordinate2DMake(lat, log);
        MAnimation *a1=[[MAnimation alloc]init];
        a1.coordinate=location1;
        a1.index = i;
        
        //警告等级
        NSString * priority = dic[@"alarmGrade"];///null/1/10/120/200/1000
        NSInteger imgindex = 0;
        if (![priority isKindOfClass:[NSNull class]]) {
            switch ([priority integerValue]) {
                case 1://级别最高
                    imgindex = 5; break;
                case 10: imgindex = 4;break;
                case 120:imgindex = 3;break;
                case 200:imgindex = 2;break;
                case 1000:imgindex = 1;break;
                default: break;
            }
        }

        a1.image = [UIImage imageNamed:[NSString stringWithFormat:@"smai_plane_%ld",imgindex]];
        [_mapView addAnnotation:a1];
    }
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
-(void)mapViewWillStartLocatingUser:(MKMapView *)mapView
{
    NSLog(@"%s",__FUNCTION__);
}

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    NSLog(@"%s",__FUNCTION__);
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{

    NSLog(@"%s",__FUNCTION__);
}
-(void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error
{
//    [MBHUD showErrorInView:self.view WithMsg:@"locate failure"];
//    [MBHUD dismiss];
    NSLog(@"%s",__FUNCTION__);
}

-(void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    if ([view.annotation isKindOfClass:[MAnimation class]]) {
        MAnimation * annotation1 = view.annotation;
        M2Animation * annotation2 = [[M2Animation alloc]init];
        annotation2.coordinate = annotation1.coordinate;
        
        NSInteger index = annotation1.index;
        annotation2.dic = [_dataArray objectAtIndex:index];
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
        NSInteger index = ((MAnimation*)annotation).index;
        
        NSDictionary * dic = [_dataArray objectAtIndex:index];
        double angle = [dic[@"rotation"]doubleValue];
        
        annotationView.transform = CGAffineTransformMakeRotation(angle + 90.0);
        return annotationView;
    }
    else if([annotation isKindOfClass:[M2Animation class]])
    {
//        FleetAnnotationView * v = [FleetAnnotationView annotationViewFromMap:mapView];
//        v.annotation = annotation;
//        v.fleetStatus = 3;
//        v.delegate = self;
        
        MapAnnotationView * v = [MapAnnotationView annotationViewFromMap:mapView];
        v.annotation = annotation;
        NSDictionary * dic = ((M2Animation*)annotation).dic;
        [v fillDataWith:dic];
        
        return v;
    }
    else
    return nil;
}


//#pragma mark FleetInfoCellEventDelegate
//-(void)faultAnalysis:(id)index
//{
//    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    NSString *  str = [index integerValue] == 1 ? @"FleetFaultDesVCSBID" : @"FleetStatueInfoVCSBID";
//    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:str];
//    if(vc)
//        [self.navigationController pushViewController:vc animated:YES];
//}




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
