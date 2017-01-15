//
//  FleetFaultDesVC.m
//  MCS
//
//  Created by gener on 16/11/11.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "FleetFaultDesVC.h"

@interface FleetFaultDesVC ()
{
    BOOL _section_1_IsOpened;//section_1是否展开
    BOOL _section_1_formatter_msg;//section_1报文格式
    
    NSInteger _section_2_cellType;
    
    CustomMultipleButtons * _section1_headerView;
    CustomMultipleButtons * _section2_headerView;
}

@end

@implementation FleetFaultDesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"告警描述";
    
    _section_1_IsOpened = NO;
    _section_1_formatter_msg = YES;
    _section_2_cellType = 1;
    
    [self initSubviews];
}

-(void)initSubviews
{
    _section1_headerView = [[CustomMultipleButtons alloc]initWithFrame:CGRectMake(0, 0, CURRNET_SCREEN_WIDTH, 50) buttonTitles:@[@"格式化报文",@"原始报文"] selectedHandler:^(NSInteger index) {
        _section_1_formatter_msg = index==1?YES:NO;
        
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationNone];
    }];
    
    _section2_headerView = [[CustomMultipleButtons alloc]initWithFrame:CGRectMake(0, 0, CURRNET_SCREEN_WIDTH, 50) buttonTitles:@[@"可能的故障原因",@"排故手册",@"最低设备清单",@"上传文件"] selectedHandler:^(NSInteger index) {
        _section_2_cellType = index==1?1:2;
        
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationNone];
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark -
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0 || section ==1) {
        return 1;
    }
    else if(section ==2)
        
#warning ....test
        return _section_2_cellType ==1? 3 : 1;
    else if (section ==3)
        return 3;
    
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell  * cell;
    if (indexPath.section ==0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell1_IdentifierId" forIndexPath:indexPath];
    }
    if (indexPath.section ==1) {
        NSString * cellId = _section_1_formatter_msg ? @"cell2_IdentifierId" : @"cell21_IdentifierId";
        cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    }
    if (indexPath.section ==2) {
        NSString * cellId = _section_2_cellType == 1 ? @"cell3_IdentifierId":@"cell31_IdentifierId";
        cell = [tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    }
    if (indexPath.section ==3) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell4_IdentifierId" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        
        if (indexPath.row %2) {
            cell.backgroundColor = kTableViewCellBgColorDeep;
        }
    }

    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        return 270;
    }
    else if (indexPath.section ==1)
    {
        return _section_1_IsOpened ? 180:0;
    }
    else if (indexPath.section ==2)
    {
        return 180;
    }
    else if (indexPath.section ==3)
    {
        return 80;
    }
    else
        return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        return _section_1_IsOpened?50:1;
    }
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0) {
        return 40;
    }
    return 1;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section ==0 || section ==3) {
        UILabel * l = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, CURRNET_SCREEN_WIDTH, 20)];
        l.text = section?@"\t\t本航段其它故障": @"\t\t故障分析";
        l.font = [UIFont boldSystemFontOfSize:16];
        l.textColor = [UIColor darkGrayColor];
        return l;
    }
    else if (section == 1 && _section_1_IsOpened)
    {
        return _section1_headerView;
    }
    else if (section == 2)
    {
        return  _section2_headerView;
    }
    
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section ==0) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0, 0, CURRNET_SCREEN_WIDTH, 40);
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        btn.titleLabel.textAlignment = NSTextAlignmentLeft;
        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [btn setTitle:@"2163      COND TRIM AIR SYS FAULT" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:0.161 green:0.675 blue:0.941 alpha:1] forState:UIControlStateNormal ];
        
        [btn setImage:[UIImage imageNamed:@"open"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"close"] forState:UIControlStateSelected];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(0, 15, 0, 0)];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, 25, 0, 0)];
        btn.tag = 1;
        [btn addTarget:self action:@selector(sectionBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        btn.selected = _section_1_IsOpened;
        return btn;
    }
       else if (section == 1) {
        UIView * _v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CURRNET_SCREEN_WIDTH, 20)];
        _v.backgroundColor = [UIColor whiteColor];
        return nil;
    }
    return nil;
}

-(void)sectionBtnAction :(UIButton *)btn
{
    btn.selected = !btn.selected;
    _section_1_IsOpened = !_section_1_IsOpened;
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:btn.tag] withRowAnimation:UITableViewRowAnimationFade];
}


@end
