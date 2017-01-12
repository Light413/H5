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
    
    UIBarButtonItem * _rightBarButtonItem;
    BOOL _isfirst;
}
@end

@implementation MonitorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _isfirst = YES;
    [self initSubviews];
}

-(UIBarButtonItem*)barButtonItem
{
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"icon_coll_style"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"icon_list_style"] forState:UIControlStateSelected];
    btn.frame = CGRectMake(0, 0, 40, 40);
    [btn addTarget:self action:@selector(changeListDispStye:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];

    return barButtonItem;
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
    _lastSelectVc = _fleetInfoVC;

    //right Item
    _rightBarButtonItem = [self barButtonItem];
    self.navigationItem.rightBarButtonItem = _rightBarButtonItem;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    if (_isfirst) {
        _isfirst = NO;
        
        _warnHandleVC = [[WarnHandleVC alloc]init];
        _warnHandleVC.view.frame = self.view.bounds;
        [self addChildViewController:_warnHandleVC];
        
        _fleetMap = [[FleetMapVC alloc]init];
        _fleetMap.view.frame = self.view.bounds;
        [self addChildViewController:_fleetMap];

        _VCArray = @[_fleetInfoVC,_warnHandleVC,_fleetMap];
    }

}


-(void)changeListDispStye:(UIButton*)button
{
    button.selected = !button.selected;
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"kNotification_change_style" object:@(button.selected)];
}

-(void)changeVC:(UISegmentedControl*)seg
{
    self.navigationItem.rightBarButtonItem = seg.selectedSegmentIndex==0?_rightBarButtonItem:nil;
    
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
