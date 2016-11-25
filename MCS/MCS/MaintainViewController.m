//
//  MaintainViewController.m
//  MCS
//
//  Created by gener on 16/11/8.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "MaintainViewController.h"

@interface MaintainViewController ()

@end

@implementation MaintainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self initSubviews];
    
    
}


-(void)initSubviews
{
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:@[@"待安排工作",@"待办工作",@"WO",@"待接收",@"待创建",@"待安排",@"待关闭",@"已参与"]];
    seg.frame = CGRectMake(20, 10, 800, 35);
    
    seg.selectedSegmentIndex = 0;
    [seg setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor colorWithRed:0.220 green:0.325 blue:0.478 alpha:1]} forState:UIControlStateNormal];
    [seg setTintColor:DefaultBgColor];
    seg.backgroundColor = [UIColor whiteColor];
    
//    [seg addTarget:self action:@selector(changeVC:) forControlEvents:UIControlEventValueChanged];

    
    [self.view addSubview:seg];
}

-(void)changeVC:(UISegmentedControl*)seg
{
    /*
    UIPopoverController * pop = [[UIPopoverController alloc]initWithContentViewController:[[BaseViewController alloc]init]];
    pop.popoverContentSize = CGSizeMake(50, 50);
    [pop presentPopoverFromRect:seg.bounds inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    */
    
    BaseViewController * vc = [[BaseViewController alloc]init];

    vc.modalPresentationStyle = UIModalPresentationPopover;
    vc.popoverPresentationController.sourceView = seg;
    vc.popoverPresentationController.sourceRect = seg.bounds;
    vc.preferredContentSize = CGSizeMake(200, 200);
    vc.view.maskView.backgroundColor = [UIColor lightGrayColor];
    vc.view.maskView.bounds =CGRectMake(0, 0, 600, 600);
    
    [self presentViewController:vc animated:YES completion:nil];
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
