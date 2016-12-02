//
//  HomeViewController.m
//  MCS
//
//  Created by gener on 16/11/2.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCollectionViewCell.h"

#import <XMPPFramework/XMPPFramework.h>

static NSString * collectionCellReuseIdentifier = @"collectionCellReuseIdentifier";

#define MY_DEBUG
#ifdef MY_DEBUG
NSString *name = @"lisi";
NSString *pwd = @"123";
//NSString *server = @"127.0.0.1";
NSString *server = @"192.168.90.121";
NSString *src = @"iPad";
#else
NSString *name = @"wangyiwen";
NSString *pwd = @"wangyiwen";
NSString *server = @"119.15.136.39";
NSString *src = @"iPad";
#endif

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,XMPPStreamDelegate,XMPPReconnectDelegate>
{
    UICollectionView * _collectionView;
    NSArray * _menuArray;
    NSDictionary * _vcDic;
    NSDictionary * _limiDic;
    
    //...test
    XMPPStream * _xmppStream;
    XMPPReconnect * _xmppReconnect;
    dispatch_queue_t _queue;
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
    UIDevice * dev = [UIDevice currentDevice];
    
    UIButton * testBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    testBtn.frame = CGRectMake(CURRNET_SCREEN_WIDTH - 80 - 100, 30, 50, 55);
    [testBtn setTitle:@"TEST" forState:UIControlStateNormal];
    [testBtn addTarget:self action:@selector(testVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testBtn];

    [self initXMPP];
}

-(void)initData
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"menu" ofType:@"plist"];
    _menuArray = [NSArray arrayWithContentsOfFile:path];
    
    //....test data
    _vcDic = @{
               @"id_hbdt":@"GanttViewController",
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

-(void)initXMPP
{
     _queue = dispatch_queue_create("com.mcs.xmpp-queue", DISPATCH_QUEUE_CONCURRENT);
    
    _xmppStream = [[XMPPStream alloc]init];
    [_xmppStream addDelegate:self delegateQueue:_queue];
    _xmppStream.enableBackgroundingOnSocket = YES;
    
    XMPPJID * _jid = [XMPPJID jidWithUser:name domain:server resource:src];
    _xmppStream.myJID = _jid;
    _xmppStream.hostName = server;
    _xmppStream.hostPort = 5222;
    
    _xmppReconnect = [[XMPPReconnect alloc]init];
    [_xmppReconnect activate:_xmppStream];
    [_xmppReconnect addDelegate:self delegateQueue:_queue];
    
}


#pragma mark XMPPStreamDelegate
-(void)xmppStreamWillConnect:(XMPPStream *)sender
{
    /*
    GCDAsyncSocket * socket = [sender valueForKey:@"asyncSocket"];
    
    [socket performBlock:^{
        [socket enableBackgroundingOnSocket];
    }];*/
    
   /*
    CFReadStreamSetProperty([socket getCFReadStream], kCFStreamNetworkServiceType, kCFStreamNetworkServiceTypeVoIP);
    CFWriteStreamSetProperty([socket getCFWriteStream], kCFStreamNetworkServiceType, kCFStreamNetworkServiceTypeVoIP);*/
}

-(void)xmppStream:(XMPPStream *)sender socketDidConnect:(GCDAsyncSocket *)socket
{
    NSLog(@"########:%s",__func__);

}

-(void)xmppStreamDidConnect:(XMPPStream *)sender
{
    NSLog(@"########:%s",__func__);
    NSError * error = nil;
    [sender authenticateWithPassword:pwd error:&error];
    if (error) {
        NSLog(@"authent error");
    }
}

-(void)xmppStreamConnectDidTimeout:(XMPPStream *)sender
{
    NSLog(@"########:%s",__func__);
}

-(void)xmppStreamDidAuthenticate:(XMPPStream *)sender
{
    NSLog(@"########:%s",__func__);
    XMPPPresence * presence = [XMPPPresence presenceWithType:@"available"];
    [sender sendElement:presence];
}

-(void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(DDXMLElement *)error
{
    NSLog(@"########:%s",__func__);
}

-(void)xmppStream:(XMPPStream *)sender didReceiveMessage:(XMPPMessage *)message
{
     NSLog(@"########:%s",__func__);
    NSString * from = message.fromStr;
    NSString * to = message.toStr;
    NSString * msg = [[message elementForName:@"body"]stringValue];
    
    NSLog(@"\n%@ \nrec msg : %@ \nfrom  : %@",to,msg,from);
    
    [self sendMessage:@"haha ,u ok!" toUser:from];
    
}

-(void)xmppStream:(XMPPStream *)sender didSendMessage:(XMPPMessage *)message
{
    NSLog(@"########:%s",__func__);
}

-(void)xmppStream:(XMPPStream *)sender didFailToSendMessage:(XMPPMessage *)message error:(NSError *)error
{
    NSLog(@"########:%s",__func__);
}

/*发送消息，我们需要根据 XMPP 协议，将数据放到 <message /> 标签内，例如：
<message type="chat" to="xiaoming@example.com">
　　<body>Hello World!<body />
<message />
 */

- (void)sendMessage:(NSString *) msg toUser:(NSString *) user {
    NSXMLElement *body = [NSXMLElement elementWithName:@"body"];
    [body setStringValue:msg];
    
    NSXMLElement *message = [NSXMLElement elementWithName:@"message"];
    [message addAttributeWithName:@"type" stringValue:@"chat"];
    [message addAttributeWithName:@"to" stringValue:user];
    [message addChild:body];
    [_xmppStream sendElement:message];
}

#pragma mark XMPPReconnectDelegate
-(void)xmppReconnect:(XMPPReconnect *)sender didDetectAccidentalDisconnect:(SCNetworkConnectionFlags)connectionFlags
{
    NSLog(@"########:%s",__func__);
}

-(BOOL)xmppReconnect:(XMPPReconnect *)sender shouldAttemptAutoReconnect:(SCNetworkConnectionFlags)connectionFlags
{
    NSLog(@"########:%s",__func__);
    return  YES;
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


-(void)testVC
{
    NSLog(@"click...");
    
    NSError * error = nil;
    
    if (![_xmppStream isConnected]) {
        [_xmppStream connectWithTimeout:XMPPStreamTimeoutNone error:&error];
    }
    
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
    UIViewController * vc = [cls new];
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
