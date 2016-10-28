//
//  SVGViewController.m
//  MCS
//
//  Created by gener on 16/10/11.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "SVGViewController.h"


#import "SVGKit.h"
#import "CALayerExporter.h"
#import "SVGKImage.h"

@interface SVGViewController ()
{
    SVGKFastImageView * svgFastImageview;
}
@end

@implementation SVGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //<! 初始化svg
    NSString * path = [[NSBundle mainBundle] pathForResource:@"CSS" ofType:@"svg"];
    svgFastImageview = [[SVGKFastImageView alloc] initWithSVGKImage:[SVGKImage imageWithContentsOfFile:path]];
    //<! 设置svg的frame
    svgFastImageview.frame = CGRectMake(0, 0, 300, 300);
    
    //<! 给svg图片添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [svgFastImageview addGestureRecognizer:tap];
    [self.view addSubview:svgFastImageview];
}

-(void)handleTapGesture:(UITapGestureRecognizer *)gestureRecognizer
{
    NSLog(@"555");
    CGPoint p = [gestureRecognizer locationInView:svgFastImageview];
    CALayer * hitLayerT;
    
    hitLayerT = svgFastImageview.image.CALayerTree;
    
    if ([svgFastImageview isKindOfClass:[SVGKFastImageView class]]) {
        SVGKImage * svgImage = svgFastImageview.image;
        CGSize scaleConvertImageToViewForHitTest = CGSizeMake( svgFastImageview.bounds.size.width / svgImage.size.width, svgFastImageview.bounds.size.height / svgImage.size.height );
        
        p = CGPointApplyAffineTransform( p, CGAffineTransformInvert( CGAffineTransformMakeScale( scaleConvertImageToViewForHitTest.width, scaleConvertImageToViewForHitTest.height)) ); // must do the OPPOSITE of the zoom (to convert the 'seeming' point to the 'actual' point
    }

    else
        hitLayerT = svgFastImageview.layer;
   
    CALayer * deslayer = [hitLayerT hitTest:p];
    NSLog(@"%@",deslayer.name);
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
