//
//  XMPPManager.m
//  MCS
//
//  Created by gener on 16/11/25.
//  Copyright © 2016年 Light. All rights reserved.
//

#import "XMPPManager.h"

@implementation XMPPManager
{
    XMPPStream * _xmppStream;
    XMPPReconnect * _xmppReconnect;
    NSString * _username;
    NSString * _userpwd;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self initXMPP];

    }
    
    return self;
}

-(void)initXMPP
{
    _xmpp_queue = dispatch_queue_create("com.mcs.xmpp-queue", DISPATCH_QUEUE_CONCURRENT);
    
    _xmppStream = [[XMPPStream alloc]init];
    [_xmppStream addDelegate:self delegateQueue:_xmpp_queue];
    _xmppStream.enableBackgroundingOnSocket = YES;
    _xmppStream.hostName = XMPP_SERVER;
    _xmppStream.hostPort = 5222;
    
    _xmppReconnect = [[XMPPReconnect alloc]init];
    [_xmppReconnect activate:_xmppStream];
    [_xmppReconnect addDelegate:self delegateQueue:_xmpp_queue];
}

+(XMPPManager *)share
{
    static dispatch_once_t once;
    static XMPPManager * singleton = nil;
    dispatch_once(&once, ^{
        singleton = [[XMPPManager alloc]init];
    });
    
    return singleton;
}

#pragma mark methods
-(void)connectServerWithuser:(NSString*)name
                    password:(NSString *)pwd
                     success:(Success)successblock
                     andfail:(Fail)failblock
{
    _username = name;
    _userpwd = pwd;
    _successBlock = successblock;
    _failBlock = failblock;
    
    XMPPJID * _jid = [XMPPJID jidWithUser:name domain:XMPP_SERVER resource:XMPP_SRC];
    _xmppStream.myJID = _jid;
    
    NSError * error = nil;
    if (![_xmppStream isConnected]) {
        [_xmppStream connectWithTimeout:XMPPStreamTimeoutNone error:&error];
    }
    if (error) {
        NSLog(@"%@",[error description]);
    }
}

/*发送消息
 <message type="chat" to="xiaoming@example.com">
 　　<body>Hello World!<body />
 <message />
*/
- (void)sendMessage:(NSString *)msg toUser:(NSString *)user {
    NSXMLElement *body = [NSXMLElement elementWithName:@"body"];
    [body setStringValue:msg];
    
    NSXMLElement *message = [NSXMLElement elementWithName:@"message"];
    [message addAttributeWithName:@"type" stringValue:@"chat"];
    [message addAttributeWithName:@"to" stringValue:user];
    [message addChild:body];
    [_xmppStream sendElement:message];
}



#pragma mark - XMPPStreamDelegate
-(void)xmppStreamWillConnect:(XMPPStream *)sender
{
    /*
     GCDAsyncSocket * socket = [sender valueForKey:@"asyncSocket"];
     
     [socket performBlock:^{
     [socket enableBackgroundingOnSocket];
     }];*/
    
    /*
     CFReadStreamSetProperty([socket getCFReadStream], kCFStreamNetworkServiceType, kCFStreamNetworkServiceTypeVoIP);
     CFWriteStreamSetProperty([socket getCFWriteStream], kCFStreamNetworkServiceType, kCFStreamNetworkServiceTypeVoIP);*/
}

-(void)xmppStream:(XMPPStream *)sender socketDidConnect:(GCDAsyncSocket *)socket
{
    NSLog(@"########:%s",__func__);
    
}

-(void)xmppStreamDidConnect:(XMPPStream *)sender
{
    NSLog(@"########:%s",__func__);
    NSError * error = nil;
    [sender authenticateWithPassword:_userpwd error:&error];
    if (error) {
        NSLog(@"authent error");
    }
}

-(void)xmppStreamConnectDidTimeout:(XMPPStream *)sender
{
    NSLog(@"########:%s",__func__);
    self.failBlock();
}

-(void)xmppStreamDidAuthenticate:(XMPPStream *)sender
{
    NSLog(@"########:%s",__func__);
    XMPPPresence * presence = [XMPPPresence presenceWithType:@"available"];
    [sender sendElement:presence];
    self.successBlock();
}

-(void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(DDXMLElement *)error
{
    NSLog(@"########:%s",__func__);
    self.failBlock();
}

-(void)xmppStream:(XMPPStream *)sender didReceiveMessage:(XMPPMessage *)message
{
    NSLog(@"########:%s",__func__);
    NSString * from = message.fromStr;
    NSString * to = message.toStr;
    NSString * msg = [[message elementForName:@"body"]stringValue];
    
    NSLog(@"\n%@ \nrec msg : %@ \nfrom  : %@",to,msg,from);
    
    [self sendMessage:@"response-ok!" toUser:from];
    
    AppDelegate * app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [app xmppStreamdidReceiveMessage];
}

-(void)xmppStream:(XMPPStream *)sender didSendMessage:(XMPPMessage *)message
{
    NSLog(@"########:%s",__func__);
}

-(void)xmppStream:(XMPPStream *)sender didFailToSendMessage:(XMPPMessage *)message error:(NSError *)error
{
    NSLog(@"########:%s",__func__);
}

#pragma mark - XMPPReconnectDelegate
-(void)xmppReconnect:(XMPPReconnect *)sender didDetectAccidentalDisconnect:(SCNetworkConnectionFlags)connectionFlags
{
    NSLog(@"########:%s",__func__);
}

-(BOOL)xmppReconnect:(XMPPReconnect *)sender shouldAttemptAutoReconnect:(SCNetworkConnectionFlags)connectionFlags
{
    NSLog(@"########:%s",__func__);
    return  YES;
}


@end



