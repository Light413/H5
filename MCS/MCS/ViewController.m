//
//  ViewController.m
//  MCS
//
//  Created by gener on 16/9/5.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "ViewController.h"
#import "MBHUD.h"
#import <AFNetworking/AFNetworking.h>

#import "HttpManager.h"
#import "GGQRScanController.h"

@interface ViewController ()
{
    UILabel * msgLable;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    // Do any additional setup after loading the view, typically from a nib.

    UIBarButtonItem * _item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self  action:@selector(click)];
    
    self.navigationItem.rightBarButtonItem =  _item;
    
//    [self testVfl];
//    [self testbezierPath];

    /*
    UIWebView * web = [[UIWebView alloc]initWithFrame:self.view.bounds];
    NSURL * url = [NSURL URLWithString:[[NSBundle mainBundle]pathForResource:@"index_d" ofType:@"html"]];
//    [web loadRequest:[NSURLRequest requestWithURL:url]];
    [web loadRequest:[NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10]];
    [self.view addSubview:web];
    */
}

#pragma mark - test btn action
- (IBAction)btnAction:(id)sender {
    GanttViewController * vc = [[GanttViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (IBAction)loadsvg:(id)sender {
    SVGViewController * vc = [[SVGViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)webviewjs:(id)sender {
    webViewController * vc = [[webViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)fleetInfo:(UIButton*)sender {
    NSArray *arr = @[@"FleetInfoViewController",@"FleetMapVC"];
    Class cls = NSClassFromString(arr[sender.tag]);

    id vc = [cls new];
    [self.navigationController pushViewController:vc animated:YES];
    
}






#pragma mark 
-(void)click
{
//        [MBHUD showStatueInView:self.view WithMsg:@"数据加载中..."];
        [MBHUD showSuccessInView:self.view WithMsg:@"加载完成" ];
//        [MBHUD showErrorInView:self.view WithMsg:@"请求失败"];
//        [MBHUD showTextInView:self.view WithMsg:@"请检查网络设置"];
}

-(void)testbezierPath
{
    //演员初始化
    CALayer *scaleLayer = [[CALayer alloc] init];
    scaleLayer.backgroundColor = [UIColor blueColor].CGColor;
    scaleLayer.frame = CGRectMake(100, 20 + 100, 50, 50);
    scaleLayer.cornerRadius = 10;
    [self.view.layer addSublayer:scaleLayer];
    
    //设定剧本
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation.toValue = [NSNumber numberWithFloat:5];
    scaleAnimation.autoreverses = NO;
    scaleAnimation.fillMode = kCAFillModeBackwards;
    scaleAnimation.repeatCount = MAXFLOAT;
    scaleAnimation.duration = 2;
    
    //开演
    [scaleLayer addAnimation:scaleAnimation forKey:@"scaleAnimation"];
  /*
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, 100, 100) cornerRadius:10];
//    [path moveToPoint:CGPointMake(10, 0)];
//    [path addLineToPoint:CGPointMake(100, 50)];

    CAShapeLayer * layer = [CAShapeLayer layer];
    layer.frame = CGRectMake(0, 50, CURRNET_SCREEN_WIDTH, 300);
    layer.path = path.CGPath;
    layer.lineWidth = 2;
    layer.lineCap = kCALineCapRound;
    
    layer.backgroundColor = [UIColor lightGrayColor].CGColor;
    
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor whiteColor].CGColor;
    
    [self.view.layer addSublayer:layer];
    
   */
    /*
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(0, 50, CURRNET_SCREEN_WIDTH, 300);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 50, 100, 100)];
    shapeLayer.path = path.CGPath;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 2.0f;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:shapeLayer];
    
    CABasicAnimation *pathAnima = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnima.duration = 3.0f;
    pathAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pathAnima.fromValue = [NSNumber numberWithFloat:0.0f];
    pathAnima.toValue = [NSNumber numberWithFloat:1.0f];
    pathAnima.fillMode = kCAFillModeForwards;
    pathAnima.removedOnCompletion = NO;
    [shapeLayer addAnimation:pathAnima forKey:@"strokeEndAnimation"];*/
}

///** 设置圆形图片(放到分类中使用) */
//- (UIImage *)cutCircleImage {
//    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
//    
//    // 获取上下文
//    CGContextRef ctr = UIGraphicsGetCurrentContext();
//    // 设置圆形
//    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
//    CGContextAddEllipseInRect(ctr, rect);
//    // 裁剪
//    CGContextClip(ctr);
//    // 将图片画上去
//    [self drawInRect:rect];
//    
//    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    return image;
//}


-(void)testVfl{
    //1.添加两个控件
    UIButton *blueView = [[UIButton alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [blueView addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    UIView *redView1 = [[UIView alloc] init];
    redView1.backgroundColor = [UIColor greenColor];
    redView1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView1];
    
    //2.1水平方向的约束 @"H:|-10-[blueView]-5-[redView(==blueView)]-10-|"
    NSString *hVFL = @"H:|[blueView][redView(==blueView)][redView1(==redView)]|";
    NSArray *hCons = [NSLayoutConstraint constraintsWithVisualFormat:hVFL options:NSLayoutFormatAlignAllBottom | NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(blueView,redView,redView1)];
    [self.view addConstraints:hCons];

    //2.2垂直方向的约束 @"V:[blueView(50)]-30-|"
    NSString *vVFL = @"V:[blueView(50)]|";
    NSArray *vCons = [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:0 metrics:nil views:@{@"blueView":blueView}];
    [self.view addConstraints:vCons];
    
    //msg
    msgLable = [[UILabel alloc]init];
    [self.view addSubview:msgLable];
    msgLable.translatesAutoresizingMaskIntoConstraints = NO;
    msgLable.backgroundColor = [UIColor lightGrayColor];
    
    NSArray * msg_h = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[msgLable]|" options:0 metrics:nil views:@{@"msgLable":msgLable}];
    NSArray *msg_v = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[msgLable(30)]" options:NSLayoutFormatAlignAllTop metrics:nil views:@{@"msgLable":msgLable}];
    [self.view addConstraints:msg_h];
    [self.view addConstraints:msg_v];
}

-(void)btnClick
{
    GGQRScanController * vc  = [[GGQRScanController alloc]init];
    vc.scanQRSuccessBlock = ^(NSString * value){
        msgLable.text = value;
    };
    
    [self.navigationController pushViewController:vc animated:YES];
/*
    NSDictionary *_d = [NSDictionary dictionaryWithObjectsAndKeys:@{},@"params", nil];
    RequestTaskHandle * task = [RequestTaskHandle taskWith:@"/nes-server/rs/room/directory/list" parms:_d andSuccess:^(NSURLSessionDataTask *task, id responseObject) {
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
    }];
    
    [HttpManager doPostWithTask:task];
 */

    
//    UIPopoverController * pop = [[UIPopoverController alloc]initWithContentViewController:self];
//    pop.popoverContentSize = CGSizeMake(50, 50);
//    [pop presentPopoverFromRect:self.view.bounds inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
}

@end


