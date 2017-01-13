//
//  FleetFaultSummaryVC.m
//  MCS
//
//  Created by gener on 17/1/10.
//  Copyright © 2017年 Light. All rights reserved.
//

#import "FleetFaultSummaryVC.h"
#import "FaultDescribleInfoCell.h"
#include "FaultDescribleWarnListCell.h"

@interface FleetFaultSummaryVC ()
{
    NSDictionary * _dataDic;
}
@end

@implementation FleetFaultSummaryVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"故障概要";
    
    [self.tableView registerNib:[UINib nibWithNibName:@"FaultDescribleInfoCell" bundle:nil] forCellReuseIdentifier:@"FaultDescribleInfoCellReuseID"];
    [self.tableView registerNib:[UINib nibWithNibName:@"FaultDescribleWarnListCell" bundle:nil] forCellReuseIdentifier:@"FaultDescribleWarnListCellReuseID"];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundView = nil;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.961 green:0.973 blue:0.980 alpha:1];
    
    [self loadData];
}

-(void)loadData
{
    RequestTaskHandle * task = [RequestTaskHandle taskWith:kFaultSummaryUrl parms:self.dic andSuccess:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            _dataDic = responseObject;
        }
        
        [MBHUD dismiss];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [MBHUD showTextInView:self.view WithMsg:@"Failed from server"];
    }];
    
    [HttpManager doGetWithTask:task];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section) {
        return 5;
    }
    return 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section) {
        return 80;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell  * cell;

    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"FaultDescribleInfoCellReuseID" forIndexPath:indexPath];
        [((FaultDescribleInfoCell*)cell) setCellWith:_dataDic[@"faultSummary"]];
    }
    else if (indexPath.section == 1)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"FaultDescribleWarnListCellReuseID" forIndexPath:indexPath];
         cell.backgroundColor = indexPath.row %2 ? kTableViewCellBgColorDeep:kTableViewCellBgColorLight;
    }


    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.section?60:200;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section ==1 ) {
        UIView * bg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.frame), 100)];
        bg.backgroundColor = [UIColor clearColor];
        
        UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBtn.frame = CGRectMake(30, 0, 50, 40);
        [leftBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//        [leftBtn setTitle:@"<" forState:UIControlStateNormal];
        [leftBtn setImage:[UIImage imageNamed:@"icon_last"] forState:UIControlStateNormal];
        [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
        leftBtn.tag = 100;
        [leftBtn addTarget:self action:@selector(changeFlightTime:) forControlEvents:UIControlEventTouchUpInside];
        [bg addSubview:leftBtn];
        
        UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.frame = CGRectMake(CGRectGetMaxX(leftBtn.frame)+20, 0, CGRectGetWidth(leftBtn.frame), CGRectGetHeight(leftBtn.frame));
        [rightBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//        [rightBtn setTitle:@">" forState:UIControlStateNormal];
        [rightBtn setImage:[UIImage imageNamed:@"icon_next"] forState:UIControlStateNormal];
         [rightBtn setImageEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
        rightBtn.tag = 101;
        [rightBtn addTarget:self action:@selector(changeFlightTime:) forControlEvents:UIControlEventTouchUpInside];
        [bg addSubview:rightBtn];
        
        UIView * bottom = [[UIView alloc]initWithFrame:CGRectMake(0, 40, CGRectGetWidth(tableView.frame), 40)];
        bottom.backgroundColor = [UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1];
        UILabel * lab1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.frame)/2.0-200, CGRectGetHeight(bottom.frame))];
        lab1.textAlignment = NSTextAlignmentCenter;
        lab1.textColor = [UIColor darkGrayColor];
        lab1.text = @"告警等级";
        lab1.font = [UIFont systemFontOfSize:14];
        [bottom addSubview:lab1];
        UILabel * lab2 = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetWidth(tableView.frame)/2.0, 0, CGRectGetWidth(tableView.frame)/2.0-180, CGRectGetHeight(bottom.frame))];
        lab2.textAlignment = NSTextAlignmentCenter;
        lab2.textColor = [UIColor darkGrayColor];
        lab2.text = @"状态";
        lab2.font = [UIFont systemFontOfSize:14];
        [bottom addSubview:lab2];
        
        [bg addSubview:bottom];
        return bg;
    }
    return nil;
}

-(void)changeFlightTime:(UIButton*)btn
{
    NSLog(@"...");
    if (btn.tag == 100) {
        //last
    }
    else if (btn.tag == 101)
    {
    //next
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
