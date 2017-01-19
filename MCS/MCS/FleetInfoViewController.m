//
//  FleetInfoViewController.m
//  MCS
//
//  Created by gener on 16/10/12.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "FleetInfoViewController.h"
#import "FleetIInfoCell.h"
#import "FleetInfoListCell.h"

#import "BaseNavigationVC.h"
#import <objc/runtime.h>

#import "WarnHandleVC.h"


#define cellBgGrapColor [UIColor colorWithRed:0.961 green:0.961 blue:0.961 alpha:1]
#define cellBgLightColor [UIColor colorWithRed:1.000 green:1.000 blue:1.000 alpha:1]

static NSString * fleetInfoListCellReuseIdentifier = @"FleetInfoListCellReuseIdentifier";

static NSString * collectionCellReuseIdentifier = @"collectionCellReuseIdentifier";

@interface FleetInfoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource,FleetInfoCellEventDelegate>
{
    UICollectionView * _collectionView;
    UITableView * _tableView;
    
    NSArray * _dataArray;
}

@end

@implementation FleetInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
#warning //...
    [self initSubviews];
    
//    Method old = class_getInstanceMethod([BaseNavigationVC class], @selector(viewControllerBackAction:));
//    Method new = class_getInstanceMethod([self class], @selector(testBack));
//    method_exchangeImplementations(old, new);

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(recNotification:) name:@"kNotification_change_style" object:nil];

    [self loadData];
}

-(void)loadData
{
//    NSData * _data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"list" ofType:@"json"]];
//    
//    id _obj = [NSJSONSerialization JSONObjectWithData:_data options:NSJSONReadingMutableContainers error:nil];
//    if (_obj && [_obj isKindOfClass:[NSArray class]]) {
//        _dataArray = _obj;
//    }
//    
//    return;
    
    [SVProgressHUD showWithStatus:@"Loading..."];
    RequestTaskHandle * task = [RequestTaskHandle taskWith:kFleetStatueInfoUrl parms:[NSDictionary dictionaryWithObjectsAndKeys:kTeantCode,@"tenantCode", nil] andSuccess:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject && [responseObject isKindOfClass:[NSArray class]]) {
            _dataArray = responseObject;
        }
        [SVProgressHUD dismiss];
        
        [_collectionView reloadData];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD showInfoWithStatus:@"Failed from server"];
    }];
    
    
    [HttpManager doGetWithTask:task];
}

//切换列表显示
-(void)recNotification:(NSNotification*)notifaction
{
    BOOL _b = [notifaction.object boolValue];
    
    if (_b) {
        _tableView.hidden = NO;
        _collectionView.hidden = YES;
        [_tableView reloadData];
    }
    else
    {
        _tableView.hidden = YES;
        _collectionView.hidden = NO;
        [_collectionView reloadData];
    }
}

-(void)initSubviews
{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(250, 160);
    float _offsetx = (CURRNET_SCREEN_WIDTH - 250 * 4 - 0)/2.0;
    
    _collectionView =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, CURRNET_SCREEN_WIDTH, CURRENT_SCREEN_HEIGHT - 64) collectionViewLayout:layout];
     [self.view addSubview:_collectionView];
    [_collectionView setContentInset:UIEdgeInsetsMake(20, _offsetx, 20, _offsetx)];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"FleetIInfoCell" bundle:nil]forCellWithReuseIdentifier:collectionCellReuseIdentifier];
    _collectionView.backgroundColor = [UIColor whiteColor];
   
    
    _tableView = [[UITableView alloc]initWithFrame:_collectionView.frame style:UITableViewStylePlain];
    
    _tableView.hidden = YES;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"FleetInfoListCell" bundle:nil] forCellReuseIdentifier:fleetInfoListCellReuseIdentifier];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    [self initSubviews];
    
}
#pragma mark - tablview methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = [_dataArray objectAtIndex:indexPath.row];
    
    FleetInfoListCell * cell = [tableView dequeueReusableCellWithIdentifier:fleetInfoListCellReuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    [cell setCellWith:dic];
    cell.cellButtonBlock = ^(NSInteger index){
        NSDictionary * dic = [_dataArray objectAtIndex:index];
        NSDictionary * parms = [NSDictionary dictionaryWithObjectsAndKeys:dic[@"legId"]?dic[@"legId"]:@"",@"legId",dic[@"tailNo"]?dic[@"tailNo"]:@"",@"tailNo",kTeantCode,@"tenantCode", nil];
        
        UIViewController * vc;
        if (1) {
            vc = [[FleetFaultSummaryVC alloc]initWithStyle:UITableViewStyleGrouped];
            ((FleetFaultSummaryVC*)vc).dic = parms;
        }
        
        [self.navigationController pushViewController:vc animated:YES];
    };
    
    cell.backgroundColor = indexPath.row %2 ? kTableViewCellBgColorDeep:cellBgLightColor;
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[[NSBundle mainBundle]loadNibNamed:@"FleetInfoListHeader" owner:self options:nil]lastObject];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    //    NSString *  str = [index integerValue] == 1 ? @"FleetFaultDesVCSBID" : @"FleetStatueInfoVCSBID";
//    UIViewController *vc = [sb instantiateViewControllerWithIdentifier:@"FleetFaultDesVCSBID"];
//    if(vc)
//        [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark - UICollectionView delegate methods
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = [_dataArray objectAtIndex:indexPath.row];
    
    FleetIInfoCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellReuseIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    [cell setCellWith:dic andIndex:indexPath.row];
    
    
    return cell;
}


#pragma mark FleetInfoCellEventDelegate

-(void)fleetInfoCellClickedWith:(id)obj atIndex:(id)index
{
    NSDictionary * dic = [_dataArray objectAtIndex:[index integerValue]];
    NSDictionary * parms = [NSDictionary dictionaryWithObjectsAndKeys:dic[@"legId"]?dic[@"legId"]:@"",@"legId",dic[@"tailNo"]?dic[@"tailNo"]:@"",@"tailNo",kTeantCode,@"tenantCode", nil];

    UIViewController * vc;
    if ([obj integerValue] == 1) {
       vc = [[FleetFaultSummaryVC alloc]initWithStyle:UITableViewStyleGrouped];
        ((FleetFaultSummaryVC*)vc).dic = parms;
    }
    
    else
    {
        UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        vc = [sb instantiateViewControllerWithIdentifier:@"FleetStatueInfoVCSBID"];
    }
    
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
