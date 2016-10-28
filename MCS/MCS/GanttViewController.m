//
//  GanttViewController.m
//  MCS
//
//  Created by gener on 16/9/20.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "GanttViewController.h"

#define kRowHeight 50
#define kRowWidth  80

@interface GanttViewController ()<UIScrollViewDelegate>
{
    UIScrollView * backScrollView;
    UIScrollView * contentScrollView;
    UIScrollView * topHeadScrollView;
    
    NSInteger rows,columns;
}

@end

@implementation GanttViewController

-(void)initData
{
    rows = 20;
    columns = 24;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initData];
    
    [self addheadView];
    [self addBackgroundView];
    [self addColumn];
    [self addContentView];
}

#pragma mark - add subviews
-(void)addBackgroundView
{
    //back view
    backScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(5, 50, self.view.bounds.size.width - 10, self.view.bounds.size.height - 10-64 - 50)];
    backScrollView.contentSize = CGSizeMake(backScrollView.bounds.size.width, kRowHeight * rows);
    backScrollView.showsHorizontalScrollIndicator = YES;
    backScrollView.showsVerticalScrollIndicator = NO;
    backScrollView.alwaysBounceHorizontal = NO;
    backScrollView.bounces = NO;
    backScrollView.directionalLockEnabled = YES;
    [self.view addSubview:backScrollView];
}

-(void)addheadView
{
    topHeadScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(kRowWidth + 5, 0, CURRNET_SCREEN_WIDTH - 10, 50)];
    topHeadScrollView.layer.borderColor = [UIColor colorWithRed:206/255.0 green:206/255.0 blue:206/255.0 alpha:1].CGColor;
    topHeadScrollView.layer.borderWidth =0.5;
    topHeadScrollView.contentSize = CGSizeMake(kRowWidth + columns * kRowHeight, 50);
    [self.view addSubview:topHeadScrollView];
    topHeadScrollView.showsHorizontalScrollIndicator = NO;
    topHeadScrollView.alwaysBounceHorizontal = NO;
    topHeadScrollView.bounces = NO;
    topHeadScrollView.scrollEnabled = NO;
    
    for (int i =0; i < columns; i++) {
        UILabel * _l = [[UILabel alloc]init];
        _l.frame =CGRectMake(0 + 50 * i, 0, 50, 50);
        _l.text = [NSString stringWithFormat:@"%02d",i];
        _l.font = [UIFont systemFontOfSize:14];
        _l.textAlignment = NSTextAlignmentCenter;
        _l.tag = 10 + i;
        [self _setBorder:_l];
        [topHeadScrollView addSubview:_l];
    }
}


-(void)addColumn
{
    for (int i=0; i < rows; i++) {
        UILabel * _lab = [[UILabel alloc]init];
        _lab.backgroundColor = [UIColor whiteColor];
        _lab.frame = CGRectMake(0, kRowHeight * i+0, kRowWidth, kRowHeight);
        _lab.layer.borderColor = [UIColor colorWithRed:206/255.0 green:206/255.0 blue:206/255.0 alpha:1].CGColor;
        _lab.layer.borderWidth =0.5;
        _lab.textAlignment = NSTextAlignmentCenter;
        _lab.text = [NSString stringWithFormat:@"BM-%d",i];
        _lab.font = [UIFont systemFontOfSize:13];
        _lab.tag = 100 + i;
        [backScrollView addSubview:_lab];
    }
}

-(void)addContentView
{
    contentScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(kRowWidth, 0, backScrollView.width - kRowWidth, kRowHeight * rows)];
    contentScrollView.backgroundColor = [UIColor whiteColor];
    contentScrollView.contentSize = CGSizeMake(columns * kRowHeight, rows * kRowHeight);
    contentScrollView.showsHorizontalScrollIndicator = NO;
    contentScrollView.showsVerticalScrollIndicator = NO;
    contentScrollView.alwaysBounceHorizontal = NO;
    contentScrollView.bounces = NO;
    contentScrollView.layer.borderColor = [UIColor colorWithRed:206/255.0 green:206/255.0 blue:206/255.0 alpha:1].CGColor;
    contentScrollView.layer.borderWidth =0.5;
    contentScrollView.delegate = self;
    [backScrollView addSubview:contentScrollView];
    
    GanttView * _v = [[GanttView alloc]initWithFrame:CGRectMake(0, 0, contentScrollView.contentSize.width,contentScrollView.contentSize.height)];
    _v.backgroundColor = [UIColor whiteColor];
    _v.rows = rows;
    _v.columns = columns + 1;
    
    
    _v.clickActionBlock = ^(NSInteger indx){
        NSLog(@"btn click");
    };
    
    [contentScrollView addSubview:_v];
    
    
//    UIBezierPath * path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 600-50,kRowHeight * 14)];
//
//    UIBezierPath * path2 = [UIBezierPath bezierPath];
//    for (int i =0; i < 14; i++) {
//        [path2 moveToPoint:CGPointMake(0,kRowHeight * (i + 0))];
//        [path2 addLineToPoint:CGPointMake(590, kRowHeight * (i + 0))];
//    }
//    
////    [path appendPath:path2];
//    
//    CAShapeLayer * layer = [CAShapeLayer layer];
//    layer.strokeColor = [UIColor darkGrayColor].CGColor;
//    layer.lineWidth = 0.5f;
//    layer.path = path2.CGPath;
////    layer.fillColor = [UIColor lightGrayColor].CGColor;
//    [contentscrollView.layer addSublayer:layer];
    
}

-(void)_setBorder:(UIView *)v
{
    v.layer.borderColor = [UIColor colorWithRed:206/255.0 green:206/255.0 blue:206/255.0 alpha:1].CGColor;
    v.layer.borderWidth =0.5;
}

#pragma mark - UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == contentScrollView) {
        [topHeadScrollView setContentOffset:scrollView.contentOffset];
    }
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
