//
//  WarnInfoListVC.h
//  MCS
//
//  Created by gener on 16/11/11.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "BaseTableVC.h"
#import "FleetFaultDesVC.h"

@interface WarnInfoListVC : BaseTableVC

/*
 1.告警条目 2.其他告警 3.超限告警
 */
@property(nonatomic,assign)NSInteger warnType;


-(void)loadDataFromServer;

@end
