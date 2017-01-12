//
//  HomeViewController.m
//  MCS
//
//  Created by gener on 16/11/2.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCollectionViewCell.h"

static NSString * collectionCellReuseIdentifier = @"collectionCellReuseIdentifier";

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView * _collectionView;
    NSArray * _menuArray;
    NSDictionary * _vcDic;
    NSDictionary * _limiDic;

}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"MCS";
    [self initData];
    [self initSubviews];
 
    //....
    UIButton * testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake(CURRNET_SCREEN_WIDTH - 80 - 100, 30, 50, 55);
    [testBtn setTitle:@"TEST" forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(testBtnAction) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:testBtn];

//    dispatch_queue_t serialQueue=dispatch_queue_create("serial", NULL);
//    //将读取plist文档的线程加入串行线程队列serialQueue中并执行
//    dispatch_async(serialQueue, ^{
//        for (int i=0; i<10; i++) {
//            NSLog(@"%d - 读取plist文档并获取url",i);
//        }
//        
//    });
//    //将通过url加载图片的线程加入串行线程队列serialQueue中，并等在这前一个加入串行线程队列的读取plist文档线程执行完毕后执行
//    dispatch_async(serialQueue, ^{
//        for (int i=0; i<10; i++) {
//            NSLog(@"%d -通过url加载图片",i);
//        }
//        
//    });
//    NSLog(@"end");
    
}

-(void)initData
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"menu" ofType:@"plist"];
    _menuArray = [NSArray arrayWithContentsOfFile:path];
    
    //....test data
    _vcDic = @{
//               @"id_hbdt":@"GanttViewController",
               @"id_hbdt":@"FleetInfoBoardWedVC",
               @"id_ssjk":@"MonitorViewController",
               @"id_wxkz":@"MaintainViewController",
               @"id_gzqx":@"",
               @"id_cj":@"",
               @"id_fjzt":@"",
               @"id_kucun":@"",
               @"id_paiban":@"",
               @"id_more":@""
               };
    _limiDic = @{
                 @"id_hbdt":@"1",
                 @"id_ssjk":@"1",
                 @"id_wxkz":@"1",
                 @"id_more":@"0"
                 };
}

#pragma mark

-(void)exitAction:(UIButton*)sender
{
    UIAlertController * alertvc = [UIAlertController alertControllerWithTitle:@"提示" message:@"确定退出登录?" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * action1 =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alertvc addAction:action1];
    
    __weak typeof(self)weakSelf = self;
    UIAlertAction * action2 =[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
#if 0
        LoginVCSwift * vc = [[LoginVCSwift alloc]init];
#else
        LoginViewController *vc = [[LoginViewController alloc]init];
#endif
        [weakSelf presentViewController:vc animated:YES completion:nil];
    }];
    
    [alertvc addAction:action2];
    
    [self presentViewController:alertvc animated:YES completion:nil];

}


-(void)testBtnAction
{
    NSLog(@"click...");

    
    return;
    
    
    //php-test
    AFHTTPSessionManager * _m = [[AFHTTPSessionManager alloc]init];
    _m.requestSerializer = [AFHTTPRequestSerializer serializer];
    AFJSONResponseSerializer * _jsonser = [AFJSONResponseSerializer serializer];
//    _jsonser.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json", @"text/javascript", nil];
    _m.responseSerializer = _jsonser;

//    [_m GET:@"http://localhost/test.php" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//        
//    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",responseObject);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(@"%@",[error description]);
//    }];
    
    [_m POST:@"http://localhost/testpost.php" parameters:@{@"name":@"111"} progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
    
    
    //xmpp test
    /*
    [[XMPPManager share]connectServerWithuser:test_username password:test_userpwd success:^{
        NSLog(@"success");
    } andfail:^{
         NSLog(@"fail");
    }];*/

    
    /*
    ViewController * vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"ViewControllerSBID"];
    [self.navigationController pushViewController:vc animated:YES];*/
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [super viewWillAppear: animated];
    
//     LoginViewController *vc = [[LoginViewController alloc]init];
//    [self presentViewController:vc animated:animated completion:nil];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [super viewWillDisappear:animated];
}

-(void)initSubviews
{
    float _width = CURRNET_SCREEN_WIDTH / 4.0;
    float _space = _width /4.0;
    UIImageView *bgimageview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"menu_bg"]];
    bgimageview.frame = self.view.bounds;
    bgimageview.userInteractionEnabled = YES;
    [self.view addSubview:bgimageview];

//    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[[UIColor orangeColor]colorWithAlphaComponent:0]] forBarMetrics:UIBarMetricsDefault];
    
    UIImageView *logo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo_icon"]];
    logo.frame = CGRectMake(30, 25, 220, 55);
    [self.view addSubview:logo];
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    layout.minimumLineSpacing = 15;
    layout.minimumInteritemSpacing = _space/3.0 ;
    layout.itemSize = CGSizeMake(_width, 165);
    
    _collectionView =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, CURRNET_SCREEN_WIDTH, CURRENT_SCREEN_HEIGHT - 64) collectionViewLayout:layout];
    [_collectionView setContentInset:UIEdgeInsetsMake(50, 1.5*_space, 10, 1.5*_space)];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerNib:[UINib nibWithNibName:@"HomeCollectionViewCell" bundle:nil]forCellWithReuseIdentifier:collectionCellReuseIdentifier];
    _collectionView.backgroundColor = [UIColor clearColor];
    _collectionView.backgroundView = nil;
    [self.view addSubview:_collectionView];
    
    UIButton * exitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    exitBtn.frame = CGRectMake(CURRNET_SCREEN_WIDTH - 80, 32, 50, 50);
    [exitBtn addTarget:self action:@selector(exitAction:) forControlEvents:UIControlEventTouchUpInside];
    [exitBtn setImage:[UIImage imageNamed:@"icon_exit2"] forState:UIControlStateNormal];
    [self.view addSubview:exitBtn];
}

- (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}


#pragma mark - UICollectionViewDelegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _menuArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = _menuArray[indexPath.row];
    HomeCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionCellReuseIdentifier forIndexPath:indexPath];
//    cell.layer.borderColor = [UIColor lightGrayColor].CGColor;
//    cell.layer.borderWidth = 1;
    BOOL limit = [_limiDic[dic[@"id"]]boolValue];
    NSString * iconname = limit?dic[@"icon_y"]:dic[@"icon_n"];
    [cell setIcon:iconname limit:limit title:dic[@"title"]];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * d = _menuArray[indexPath.row];
    NSString * str= _vcDic[d[@"id"]];
    if(!str)return;
    
    if(![_limiDic[d[@"id"]]boolValue])
    {
        [MBHUD showTextInView:self.view WithMsg:@"No limits"];
        return;
    }

    Class cls = NSClassFromString(str);
    UIViewController * vc = [[cls alloc]init];
    vc.title = d[@"title"];
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
