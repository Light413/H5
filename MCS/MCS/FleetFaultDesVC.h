//
//  FleetFaultDesVC.h
//  MCS
//
//  Created by gener on 16/11/11.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "BaseTableVC.h"

#import "WarnDescribleFaultInfoCell.h"
#import "WarnDescribleMsgCell.h"
#import "WarnDescribleMsg2Cell.h"
#import "WarnDescribleFaultReasonCell.h"
#import "WarnDescribleOthersFaultCell.h"


#include "FaultDescribleWarnListCell.h"

@interface FleetFaultDesVC : BaseTableVC

@property(nonatomic)NSDictionary *  dic;
@end
