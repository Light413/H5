//
//  WarnInfoListVC.m
//  MCS
//
//  Created by gener on 16/11/11.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "WarnInfoListVC.h"

#define cellBgGrapColor [UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1]
#define cellBgLightColor [UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1]

static NSString * cellReuseIdentifierId = @"warnHandleCellIdentifierId";
static NSString * warnHandleCellIdentifierId = @"warnHandleCellIdentifierId";

@interface WarnInfoListVC ()

@end

@implementation WarnInfoListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubviews];
}

-(void)initSubviews
{
    [self.tableView registerNib:[UINib nibWithNibName:@"WarnHandleCell" bundle:nil] forCellReuseIdentifier:@"warnHandleCellIdentifierId"];
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.tableFooterView = [[UIView alloc]init];
}

#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return self.dataArray.count;
//}
//

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifierId forIndexPath:indexPath];
    
    // Configure the cell...
    
    
    cell.backgroundColor = indexPath.row %2 ? cellBgGrapColor:cellBgLightColor;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[[NSBundle mainBundle]loadNibNamed:@"WarnHandleHeader" owner:self options:nil]lastObject];
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
