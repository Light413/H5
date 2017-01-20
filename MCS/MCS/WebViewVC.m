//
//  WebViewVC.m
//  MCS
//
//  Created by gener on 17/1/10.
//  Copyright © 2017年 Light. All rights reserved.
//

#import "WebViewVC.h"
#import <WebKit/WKWebView.h>
#import <WebKit/WKNavigationDelegate.h>

@interface WebViewVC ()<WKNavigationDelegate>
{
    WKWebView *_webview;
}
@end

@implementation WebViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _webview = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, CURRNET_SCREEN_WIDTH, CURRENT_SCREEN_HEIGHT - 64)];
    _webview.navigationDelegate = self;
//    _webview.scalesPageToFit = YES;

    [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]]];
    [self.view addSubview:_webview];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [MBHUD showStatueInView:self.view WithMsg:@"Loading..."];
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation
{
    NSLog(@"--- %s",__func__);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation;
{
    NSLog(@"--- %s",__func__);
    [MBHUD dismiss];
}




//...UIWebView delegate methods
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


@end
