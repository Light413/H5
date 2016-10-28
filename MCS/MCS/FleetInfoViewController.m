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

@interface FleetInfoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView * _collectionView;
    
}
@end

@implementation FleetInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Fleet Status";
    
    // Do any additional setup after loading the view.
    [self initSubviews];
}

-(void)initSubviews
{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;
    layout.itemSize = CGSizeMake(240, 160);
    
    _collectionView =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, CURRNET_SCREEN_WIDTH, CURRENT_SCREEN_HEIGHT - 64) collectionViewLayout:layout];
    [_collectionView setContentInset:UIEdgeInsetsMake(5, 5, 5, 5)];
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
    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
    cell.layer.borderWidth = 1;
    
    cell.fleetStatus  = arc4random()%7;
    //...时间和一些其他数据填充
    
    return cell;
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
