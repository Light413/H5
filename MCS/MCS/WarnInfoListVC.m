//
//  WarnInfoListVC.m
//  MCS
//
//  Created by gener on 16/11/11.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "WarnInfoListVC.h"

static NSString * cellReuseIdentifierId =      @"warnHandleCellIdentifierId";
static NSString * warnHandleCellIdentifierId = @"warnHandleCellIdentifierId";

@interface WarnInfoListVC ()
{
    BOOL _firstFlag;
}
@end

@implementation WarnInfoListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _firstFlag = YES;
    
    [self initSubviews];
    [self.tableView setContentInset:UIEdgeInsetsMake(0, 0, 10, 0)];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (_firstFlag) {
        _firstFlag = NO;
        [self loadDataFromServer];
        NSLog(@"++++++++++++ %s",__func__);
    }

}

-(void)initSubviews
{
    [self.tableView registerNib:[UINib nibWithNibName:@"WarnHandleCell" bundle:nil] forCellReuseIdentifier:@"warnHandleCellIdentifierId"];
    
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.tableFooterView = [[UIView alloc]init];
}

-(void)loadDataFromServer
{
    #warning ....test
    [MBHUD showStatueInView:self.view WithMsg:@"Loading..."];
    [self.dataArray removeAllObjects];
    [self.tableView reloadData];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 1.0), dispatch_get_main_queue(), ^{
        NSInteger rad = arc4random() % 15 + 2;
        for (int i =0; i < rad; i++) {
            [self.dataArray addObject:@""];
        }
        [self.tableView reloadData];

        [MBHUD dismiss];
    });
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}
//

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifierId forIndexPath:indexPath];
    
    // Configure the cell...
    
    
    cell.backgroundColor = indexPath.row %2 ? kTableViewCellBgColorDeep:kTableViewCellBgColorLight;
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[[NSBundle mainBundle]loadNibNamed:@"WarnHandleHeader" owner:self options:nil]lastObject];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    NSString *  str = [index integerValue] == 1 ? @"FleetFaultDesVCSBID" : @"FleetStatueInfoVCSBID";
    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"FleetFaultDesVCSBID"];
    if(vc)
        [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
