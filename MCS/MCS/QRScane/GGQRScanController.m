//
//  GGQRScanController.m
//  MCS
//
//  Created by gener on 16/9/12.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "GGQRScanController.h"
#import <AVFoundation/AVFoundation.h>
#import "GGQRScanView.h"

#define kTimeInterval   0.01
#define kScansizeWidth  200

@interface GGQRScanController ()<AVCaptureMetadataOutputObjectsDelegate>
{
    AVCaptureDevice * _device;
    AVCaptureDeviceInput * _input;
    AVCaptureMetadataOutput * _output;
    AVCaptureVideoPreviewLayer * _previewLayer;
    AVCaptureSession * _session;

    GGQRScanView * scanView;
}
@end

@implementation GGQRScanController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.title = @"扫描二维码";

    [self __init];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSTimer * timer =  [scanView valueForKey:@"_timer"];
    if ([timer isKindOfClass:[NSTimer class]])
    {
        [timer setFireDate:[NSDate distantPast]];
        [scanView setValue:@0 forKey:@"_offset_y"];
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSTimer * timer =  [scanView valueForKey:@"_timer"];
    [timer setFireDate:[NSDate distantFuture]];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    NSTimer * timer =  [scanView valueForKey:@"_timer"];
    [timer invalidate];
    timer = nil;
}

#pragma mark - init
-(void)__init
{
    scanView = [[GGQRScanView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:scanView];
    scanView.scanSize = CGSizeMake(kScansizeWidth, kScansizeWidth);
    scanView.backgroundColor = [UIColor clearColor];

    AVAuthorizationStatus statue = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (statue != AVAuthorizationStatusAuthorized) {
        UIAlertController * _alert = [UIAlertController alertControllerWithTitle:@"请在[设置]-[隐私]-[相机]中允许访问相机" message:nil preferredStyle:UIAlertControllerStyleAlert];
        __weak typeof(self) weakSelf = self;
        UIAlertAction * action1 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }];
        UIAlertAction * action2 = [UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            [[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"prefs:root=Privacy&path=Photos"]];
            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
        }];
        [_alert addAction:action1];
        [_alert addAction:action2];
        
        [self presentViewController:_alert animated:YES completion:nil];
    }
    else
    {
        _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        [_device lockForConfiguration:nil];
        [_device setFocusMode:AVCaptureFocusModeAutoFocus];
        [_device unlockForConfiguration];
        
        _input = [AVCaptureDeviceInput deviceInputWithDevice:_device error:nil];
        
        _output = [[AVCaptureMetadataOutput alloc]init];
        [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
        
        _session = [[AVCaptureSession alloc]init];
        _session.sessionPreset = AVCaptureSessionPresetHigh;

        if ([_session canAddInput:_input]) {
            [_session addInput:_input];
        }
        if ([_session canAddOutput:_output]) {
            [_session addOutput:_output];
        }
        
        _output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode];
        
        _previewLayer = [[AVCaptureVideoPreviewLayer alloc]initWithSession:_session];
        _previewLayer.videoGravity = AVLayerVideoGravityResize;
        _previewLayer.frame = self.view.bounds;
        [self.view.layer insertSublayer:_previewLayer atIndex:0];
        
        //扫描区域
        CGFloat screenHeight = self.view.frame.size.height;
        CGFloat screenWidth = self.view.frame.size.width;
        CGRect scanRect = CGRectMake((screenWidth - scanView.scanSize.width) / 2,
                                     100,
                                     scanView.scanSize.width,
                                     scanView.scanSize.height);
        
        [_output setRectOfInterest:CGRectMake(scanRect.origin.y / (screenHeight - 64),
                                              scanRect.origin.x / screenWidth,
                                              scanRect.size.height / (screenHeight - 64),
                                              scanRect.size.width / screenWidth)];
        

        [_session startRunning];
    }
    
}


#pragma mark - AVCaptureMetadataOutputObjectsDelegate
-(void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    if (metadataObjects.count > 0) {
        [_session stopRunning];
        
        AVMetadataMachineReadableCodeObject * codeObject = [metadataObjects objectAtIndex:0];
        if ([[codeObject type]isEqualToString:@"org.iso.QRCode"]) {
            NSLog(@"is qrcode");
        }
        
        NSString * result = [codeObject stringValue];
        if (_scanQRSuccessBlock) {
            _scanQRSuccessBlock(result);
        }
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


