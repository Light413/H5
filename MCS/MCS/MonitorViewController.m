//
//  MonitorViewController.m
//  MCS
//
//  Created by gener on 16/11/4.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "MonitorViewController.h"

@interface MonitorViewController ()
{
    FleetInfoViewController * _fleetInfoVC;
    WarnHandleVC *_warnHandleVC;
    FleetMapVC * _fleetMap;
    UIViewController * _lastSelectVc;
    NSArray * _VCArray;
}
@end

@implementation MonitorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubviews];

}

-(void)initSubviews
{
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:@[@"机队状态",@"警告处理",@"机队分布"]];
    seg.frame = CGRectMake(0, 0, 300, 35);
    seg.selectedSegmentIndex = 0;
    [seg setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    [seg addTarget:self action:@selector(changeVC:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = seg;
    
    _fleetInfoVC = [[FleetInfoViewController alloc]init];
    _fleetInfoVC.view.frame = self.view.bounds;
    [self addChildViewController:_fleetInfoVC];
    [self.view addSubview:_fleetInfoVC.view];
    _warnHandleVC = [[WarnHandleVC alloc]init];
    _warnHandleVC.view.frame = self.view.bounds;
    [self addChildViewController:_warnHandleVC];
    _fleetMap = [[FleetMapVC alloc]init];
    _fleetMap.view.frame = self.view.bounds;
    [self addChildViewController:_fleetMap];
    
    _lastSelectVc = _fleetInfoVC;
    _VCArray = @[_fleetInfoVC,_warnHandleVC,_fleetMap];
}

-(void)changeVC:(UISegmentedControl*)seg
{
    UIViewController * des = (UIViewController *)(_VCArray[seg.selectedSegmentIndex]);
    [self transitionFromViewController:_lastSelectVc toViewController:des duration:0.5 options:UIViewAnimationOptionCurveLinear animations:nil completion:^(BOOL _b){
        _lastSelectVc = des;
    }];
    
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
