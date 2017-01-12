//
//  webViewController.m
//  MCS
//
//  Created by gener on 16/10/11.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "webViewController.h"
#import "WebViewJavascriptBridge.h"

@interface webViewController ()<UIWebViewDelegate>
{
    UIWebView * _webview;
    WebViewJavascriptBridge * _webBridge;
}
@end

@implementation webViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, CURRNET_SCREEN_WIDTH, CURRENT_SCREEN_HEIGHT - 64)];
    [self.view addSubview:_webview];
    
//    NSString * str= [[NSBundle mainBundle]pathForResource:@"web" ofType:@"html"];
    NSString * str= @"http://192.168.6.59:8080/mcs/warnMonitor/flightInfoBorad";
    [_webview loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    [MBHUD showStatueInView:self.view WithMsg:@"loading..."];
    
    [self initSubview];
}

-(void)initSubview
{
    _webBridge =[WebViewJavascriptBridge bridgeForWebView:_webview];
    [_webBridge setWebViewDelegate:self];
    
    [_webBridge registerHandler:@"objc_fun1" handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"rec data from js :%@",data);
        responseCallback(@"i am from objc!");
    }];
    
    [_webBridge callHandler:@"js_fun1" data:@{@"key":@"hello js"} responseCallback:^(id responseData) {
        NSLog(@"from js  :%@",responseData);
    }];
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    NSLog(@"webViewDidStartLoad");
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"webViewDidFinishLoad");
    [MBHUD dismiss];
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
