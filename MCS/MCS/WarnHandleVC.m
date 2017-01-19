//
//  WarnHandleVC.m
//  MCS
//
//  Created by gener on 16/11/4.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "WarnHandleVC.h"
#import "WarnInfoListVC.h"

@interface WarnHandleVC ()
{
    WarnInfoListVC * _warnInfoListVC;
}
@end

@implementation WarnHandleVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self initSubviews];

}


-(void)initSubviews
{
    CustomMultipleButtons * multipleBtnView = [[CustomMultipleButtons alloc]initWithFrame:CGRectMake(0, 8, CURRNET_SCREEN_WIDTH, 50) buttonTitles:@[@"告警条目",@"其他告警",@"超限告警"] selectedHandler:^(NSInteger index) {
        _warnInfoListVC.warnType = index;
        [_warnInfoListVC loadDataFromServer];
    }];
    
    [self.view addSubview:multipleBtnView];
    
    _warnInfoListVC =  [[WarnInfoListVC alloc]init];
    [self addChildViewController:_warnInfoListVC];
    _warnInfoListVC.view.frame = CGRectMake(0, 58, CURRNET_SCREEN_WIDTH, CURRENT_SCREEN_HEIGHT-64-60);
    _warnInfoListVC.warnType = 1;
    [self.view addSubview:_warnInfoListVC.view];
}




/*
-(void)addTopSubview
{
    UIView *bgview = [[UIView alloc]initWithFrame:CGRectMake(0, 8, CURRNET_SCREEN_WIDTH, 50)];
    bgview.backgroundColor = [UIColor colorWithRed:0.961 green:0.973 blue:0.980 alpha:1];
    bgview.tag = 1001;
    [self.view addSubview:bgview];
    
    NSArray * btnTitle = @[@"告警条目",@"其他告警",@"超限告警"];
    for (int i =0; i < 3; i++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(10 + i * 150, 10, 150, CGRectGetHeight(bgview.frame)-10);
        [btn setTitle:btnTitle[i] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor colorWithRed:0.173 green:0.545 blue:0.757 alpha:1] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:@"btn_bg"] forState:UIControlStateSelected];
        btn.tag = 20 + i;
        [btn addTarget:self action:@selector(btnChangeListAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        btn.selected = i == 0 ?YES : NO;
        [bgview addSubview:btn];
    }
    
}

-(void)btnChangeListAction:(UIButton*)btn
{
    if (btn.selected) {
        return;
    }
    
    NSArray * views = [self.view viewWithTag:1001].subviews;
    for (UIView * _b in views) {
        if ([_b isKindOfClass:[UIButton class]]) {
            ((UIButton*)_b).selected = NO;
            ((UIButton*)_b).backgroundColor = [UIColor clearColor];
        }
        
    }
    btn.selected = YES;
    btn.backgroundColor = [UIColor whiteColor];
    
# warning //...tag 加载数据
    
    [_warnInfoListVC loadDataFromServer];
    
}
*/

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
