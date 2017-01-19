//
//  WarnInfoListVC.m
//  MCS
//
//  Created by gener on 16/11/11.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "WarnInfoListVC.h"
#import "WarnHandleCell.h"

static NSString * cellReuseIdentifierId =      @"warnHandleCellIdentifierId";
static NSString * warnHandleCellIdentifierId = @"warnHandleCellIdentifierId";

@interface WarnInfoListVC ()
{
    BOOL _firstFlag;
    
    NSInteger _currentPage;//当前页码
    NSInteger _currentWarnType;
}
@end

@implementation WarnInfoListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initData];
    
    [self initSubviews];
    [self.tableView setContentInset:UIEdgeInsetsMake(0, 0, 10, 0)];
    
}

-(void)initData{
    _firstFlag = YES;
    _currentPage = 1;
    _currentWarnType = 10;//不起作用？
}

-(void)setWarnType:(NSInteger)warnType
{
    switch (warnType) {
        case 1:_warnType = 10; break;
        case 2: _warnType = 20;break;
        case 3:_warnType = 31;break;
        default:break;
    }
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

    //是否类型切换
    if (self.warnType != _currentWarnType) {
        _currentWarnType = self.warnType;
        _currentPage = 1;
        [self.dataArray removeAllObjects];
        [self.tableView reloadData];
    }
    
    //判断页码，是否继续请求下一页
    if (_currentPage == NSNotFound) {
        if (self.dataArray.count > 20) {
          [SVProgressHUD showInfoWithStatus:@"NO MORE DATA!"];
        }
        return;
    }
    
    [SVProgressHUD showWithStatus:@"Loading..."];
    NSDictionary * dic = [NSDictionary dictionaryWithObjectsAndKeys:@(_currentWarnType),@"type",@(_currentPage),@"page",@"20",@"rows",@"0,3",@"statusMlt",kTeantCode,@"tenantCode", nil];
    RequestTaskHandle * task = [RequestTaskHandle taskWith:kWarnListUrl parms:dic andSuccess:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
            NSArray * _arr = responseObject[@"rows"];
            if (_arr && [_arr isKindOfClass:[NSArray class]]) {
                if (_arr.count < 20) {
                    _currentPage = NSNotFound;
                }
                else
                {
                    _currentPage++;
                }
                [self.dataArray addObjectsFromArray:_arr];
                [self.tableView reloadData];
            }

        }
        [SVProgressHUD dismiss];;
        
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD showInfoWithStatus:@"Failed from server"];
    }];
    
    
    [HttpManager doGetWithTask:task];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WarnHandleCell *cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifierId forIndexPath:indexPath];
    NSDictionary * dic = [self.dataArray objectAtIndex:indexPath.row];
    [cell setCellWith:dic];
    
    cell.backgroundColor = indexPath.row %2 ? kTableViewCellBgColorDeep:kTableViewCellBgColorLight;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
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
    NSDictionary * dic = self.dataArray[indexPath.row];
    NSString * alarmId = [[dic[@"detail"]objectAtIndex:0] objectForKey:@"alarmEventId"];
    if (!alarmId) {
        [SVProgressHUD showInfoWithStatus:@"Invalid alarmEventId"]; return;
    }
    
    NSDictionary * parm = [NSDictionary dictionaryWithObjectsAndKeys:alarmId,@"id",kTeantCode,@"tenantCode", nil];

    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FleetFaultDesVC *vc = [sb instantiateViewControllerWithIdentifier:@"FleetFaultDesVCSBID"];
    vc.dic = dic;
    
    if(vc)
        [self.navigationController pushViewController:vc animated:YES];
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.dataArray.count-1) {
            [self loadDataFromServer];
    }

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
