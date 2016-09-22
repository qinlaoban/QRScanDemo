//
//  socketHelper.m
//  Scoket_ssl
//
//  Created by QinRong on 16/9/21.
//  Copyright © 2016年 Qin. All rights reserved.
//

#import "socketHelper.h"
#import "GCDAsyncSocket.h"


@interface socketHelper ()<GCDAsyncSocketDelegate>

@property (nonatomic, strong) GCDAsyncSocket *asyncSocket;

@property (nonatomic, strong) NSMutableArray *clientSockets;// 客户端socket

@end

@implementation socketHelper


- (NSMutableArray *)clientSockets {
    if (_clientSockets == nil) {
        _clientSockets = [NSMutableArray array];
    }
    return _clientSockets;
}

+ (instancetype)sharedSocket {
    static socketHelper *scoket;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        scoket = [[self alloc] init];
    });
    return scoket;
}

/*
 全局队列（代理的方法是在子线程被调用）
 dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0)
 
 主队列（代理的方法会在主线程被调用）
 dispatch_get_main_queue()
 代理里的动作是耗时的动作，要在子线程中操作
 代理里的动作不是耗时的动作，就可以在主线程中调用
 看情况写队列
 */
- (instancetype)init {
    if (self = [super init]) {
        _asyncSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)];
    }
    return self;
}

- (void)startConnectSocket {
    
    NSError *error = nil;
    [_asyncSocket acceptOnPort:self.port error:&error];
    
    if (!error) {
        
        NSLog(@"服务开启成功");
        
    } else {
        NSLog(@"服务开启失败 %@", error);
    }
}

#pragma mark - delegate

// 服务器读取客户端发送数据
- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag {
    
    NSLog(@"客户端  %@", sock);
    NSString *dataStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"data --- %@", dataStr);
}

// 在读取数据之前 服务端还需要监听 客户端有没有写入数据

- (void)socket:(GCDAsyncSocket *)sock didAcceptNewSocket:(GCDAsyncSocket *)newSocket {
    NSLog(@"服务端  %@", sock);
    NSLog(@"客户端  %@", newSocket);
    [self.clientSockets addObject:newSocket];
    
    // 监听客户端是否写入数据
    // timeOut: -1 暂时不需要 超时时间  tag暂时不需要 传0
    [newSocket readDataWithTimeout:-1 tag:0];
}

@end
