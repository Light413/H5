//
//  FleetInfoBoardWedVC.m
//  MCS
//
//  Created by gener on 17/1/10.
//  Copyright © 2017年 Light. All rights reserved.
//

#import "FleetInfoBoardWedVC.h"
#import <WebKit/WKWebView.h>
#import <WebKit/WKNavigationDelegate.h>

@interface FleetInfoBoardWedVC ()<WKNavigationDelegate>
{
    WKWebView *_webview;
}
@end

@implementation FleetInfoBoardWedVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _webview = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, CURRNET_SCREEN_WIDTH, CURRENT_SCREEN_HEIGHT - 64)];
    _webview.navigationDelegate = self;
//    _webview.scalesPageToFit = YES;

    [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:kTestFleetInfoBoard]]];
    [self.view addSubview:_webview];
    
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation
{
    NSLog(@"--- %s",__func__);
     [MBHUD showStatueInView:self.view WithMsg:@"Loading..."];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation;
{
    NSLog(@"--- %s",__func__);
    [MBHUD dismiss];
}

//...
- (void)webViewDidStartLoad:(UIWebView *)webView
{

    [MBHUD showStatueInView:self.view WithMsg:@"Loading..."];

}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
     [MBHUD dismiss];
    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitUserSelect='none';"];
    
    [webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout='none';"];
    
}

//- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
//    
//    NSLog(@"%s", __FUNCTION__);
//    // 禁用选中效果
//    [self.webView evaluateJavaScript:@"document.documentElement.style.webkitUserSelect='none'" completionHandler:nil];
//    [self.webView evaluateJavaScript:@"document.documentElement.style.webkitTouchCallout='none'" completionHandler:nil];
//    
//}


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
