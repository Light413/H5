//
//  FleetInfoViewController.m
//  MCS
//
//  Created by gener on 16/10/12.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "FleetInfoViewController.h"
#import "FleetIInfoCell.h"

 static NSString * collectionCellReuseIdentifier = @"collectionCellReuseIdentifier";

@interface FleetInfoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,FleetInfoCellEventDelegate>
{
    UICollectionView * _collectionView;
    
}
@end

@implementation FleetInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubviews];
}

-(void)initSubviews
{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 0;
    layout.minimumInteritemSpacing = 0;
    layout.itemSize = CGSizeMake(250, 160);
    float _offsetx = (CURRNET_SCREEN_WIDTH - 250 * 4 - 0)/2.0;
    
    _collectionView =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, CURRNET_SCREEN_WIDTH, CURRENT_SCREEN_HEIGHT - 64) collectionViewLayout:layout];
    [_collectionView setContentInset:UIEdgeInsetsMake(20, _offsetx, 20, _offsetx)];
    _collectionView.delegate = self;
    
    _collectionView.dataSource = self;

    [_collectionView registerNib:[UINib nibWithNibName:@"FleetIInfoCell" bundle:nil]forCellWithReuseIdentifier:collectionCellReuseIdentifier];
    _collectionView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_collectionView];
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FleetIInfoCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellReuseIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    
    cell.fleetStatus  = arc4random()%7;
    //...时间和一些其他数据填充
    
    return cell;
}


#pragma mark FleetInfoCellEventDelegate
-(void)faultAnalysis
{
    NSLog(@"2222");
    UIStoryboard * sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    FleetFaultDesVC * vc = [sb instantiateViewControllerWithIdentifier:@"FleetFaultDesVCSBID"];
    
    [self.navigationController pushViewController:vc animated:YES];
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
