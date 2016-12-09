//
//  XMPPManager.h
//  MCS
//
//  Created by gener on 16/11/25.
//  Copyright © 2016年 Light. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <XMPPFramework/XMPPFramework.h>
#import "AppDelegate.h"
#import "Reachability.h"

typedef void(^Success)();
typedef void(^Fail)();

@interface XMPPManager : NSObject<XMPPStreamDelegate,XMPPReconnectDelegate>

@property(nonatomic,copy)Success successBlock;

@property(nonatomic,copy)Fail failBlock;

@property dispatch_queue_t xmpp_queue;

+(XMPPManager *)share;

-(void)connectServerWithuser:(NSString*)name
                    password:(NSString *)pwd
                     success:(Success)successblock
                     andfail:(Fail)failblock;

- (void)sendMessage:(NSString *) msg toUser:(NSString *) user;



@end
