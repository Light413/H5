//
//  FleetStatueInfoVC.m
//  MCS
//
//  Created by gener on 16/11/11.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "FleetStatueInfoVC.h"

@interface FleetStatueInfoVC ()

@end

@implementation FleetStatueInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"报文状态信息";
}

/*
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
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

    cell.backgroundColor = [UIColor colorWithRed:0.961 green:0.973 blue:0.980 alpha:1];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section ==0) {
        return 100;
    }
    else if (indexPath.section ==1)
    {
        return 220;
    }
    else
        return 0;
}*/
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
        l.text = section?@"": @"\t\t航后报B-MAP";
        l.font = [UIFont boldSystemFontOfSize:16];
        l.textColor = [UIColor darkGrayColor];
        return l;
    }
    return nil;
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
