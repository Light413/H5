//
//  FleetStatusLineView.h
//  MCS
//
//  Created by gener on 16/10/13.
//  Copyright © 2016年 Light. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FleetStatusLineView : UIView

@property(nonatomic,assign)NSInteger fleetStatus;//当前状态节点(1-6)6个节点

-(void)setFleetStatus:(NSInteger)fleetStatus withTime :(NSArray*)time;

@end
