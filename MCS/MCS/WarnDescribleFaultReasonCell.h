//
//  WarnDescribleFaultReasonCell.h
//  MCS
//
//  Created by gener on 17/1/19.
//  Copyright © 2017年 Light. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "YYText.h"

@interface WarnDescribleFaultReasonCell : UITableViewCell

@property(nonatomic,copy)void(^tapActionBlock)(NSString*);

-(void)setCellWithData:(NSDictionary*)dic isManula:(BOOL)ismannual;


@end
