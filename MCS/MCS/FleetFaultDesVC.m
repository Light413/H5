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
    BOOL _section2IsSelected;
}

@end

@implementation FleetFaultDesVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"故障描述";
    
    _section2IsSelected = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section ==0) {
        return 1;
    }
    if (section ==1 && _section2IsSelected) {
        return 1;
    }
    else if (section ==2)
        return 3;
    else if (section ==3)
        return 5;
    
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell  * cell;
    if (indexPath.section ==0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell1_IdentifierId" forIndexPath:indexPath];
    }
    if (indexPath.section ==1) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell2_IdentifierId" forIndexPath:indexPath];
    }
    if (indexPath.section ==2) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell3_IdentifierId" forIndexPath:indexPath];
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
        return 220;
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
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section ==1) {
        return 10;
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
    else if (section == 1)
    {
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
        
        btn.selected = _section2IsSelected;
        return btn;
    }
    else if (section == 2)
    {
        UIView * _v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CURRNET_SCREEN_WIDTH, 40)];
        _v.backgroundColor = [UIColor colorWithRed:0.961 green:0.973 blue:0.980 alpha:1];
        UISegmentedControl * seg = [[UISegmentedControl alloc]initWithItems:@[@"可能的故障原因",@"排故手册",@"最低设备清单",@"上传文件"]];
        //seg.backgroundColor = [UIColor colorWithRed:0.961 green:0.973 blue:0.980 alpha:1];
        //seg.tintColor = [UIColor colorWithRed:0.961 green:0.973 blue:0.980 alpha:1];
        
        seg.selectedSegmentIndex = 0;
        seg.frame = CGRectMake(5, 0, 600, 40);
        [_v addSubview:seg];
        return _v;
    }
    
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 1) {
        UIView * _v = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CURRNET_SCREEN_WIDTH, 20)];
        _v.backgroundColor = [UIColor whiteColor];
        return _v;
    }
    return nil;
}

-(void)sectionBtnAction :(UIButton *)btn
{
    btn.selected = !btn.selected;
    _section2IsSelected = !_section2IsSelected;
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:btn.tag] withRowAnimation:UITableViewRowAnimationFade];
}


- (IBAction)sectionBtn_format:(UIButton *)sender {
    
}

- (IBAction)sectionBtn_origin:(UIButton *)sender {
    
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
