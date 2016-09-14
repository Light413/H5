//
//  GGQRScanController.h
//  MCS
//
//  Created by gener on 16/9/12.
//  Copyright © 2016年 Light. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGQRScanController : UIViewController

@property(nonatomic,copy)void (^scanQRSuccessBlock)(NSString *);//扫描完成执行的操作

@end
