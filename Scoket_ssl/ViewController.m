//
//  ViewController.m
//  Scoket_ssl
//
//  Created by QinRong on 16/9/20.
//  Copyright © 2016年 Qin. All rights reserved.
//

#import "ViewController.h"

#import "GCDAsyncSocket.h"

static NSString *const host = @"210.72.224.35";

static int const port = 8501;


@interface ViewController ()<GCDAsyncSocketDelegate>

@property (strong, nonatomic)  GCDAsyncSocket *asyncSocket;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _asyncSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    
    
    [self connectWithHost:host port:port];
    
    
}


- (void)starSSL {
    
    NSMutableDictionary *sslSettings = [[NSMutableDictionary alloc] init];
    
    // SSL 证书
    NSData *pkcs12data = [[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"SSL" ofType:@"p12"]];
    
    CFDataRef inPKCS12Data = (CFDataRef)CFBridgingRetain(pkcs12data);
    
    // c语言字符串
    CFStringRef password = CFSTR("password");
    
    const void *keys[] = { kSecImportExportPassphrase };
    
    const void *values[] = { password };
    
    CFDictionaryRef options = CFDictionaryCreate(NULL, keys, values, 1, NULL, NULL);
    
    CFArrayRef items = CFArrayCreate(NULL, 0, 0, NULL);
    
    OSStatus securityError = SecPKCS12Import(inPKCS12Data, options, &items);
    CFRelease(options);
    CFRelease(password);
    
    if(securityError == errSecSuccess)
        NSLog(@"Success opening p12 certificate.");
    
    CFDictionaryRef identityDict = CFArrayGetValueAtIndex(items, 0);
    SecIdentityRef myIdent = (SecIdentityRef)CFDictionaryGetValue(identityDict,
                                                                  kSecImportItemIdentity);
    
    SecIdentityRef  certArray[1] = { myIdent };
    CFArrayRef myCerts = CFArrayCreate(NULL, (void *)certArray, 1, NULL);
    
    [sslSettings setObject:(id)CFBridgingRelease(myCerts) forKey:(NSString *)kCFStreamSSLCertificates];
    [sslSettings setObject:NSStreamSocketSecurityLevelNegotiatedSSL forKey:(NSString *)kCFStreamSSLLevel];
    [sslSettings setObject:(id)kCFBooleanTrue forKey:(NSString *)kCFStreamSSLAllowsAnyRoot];
    [sslSettings setObject:@"CONNECTION ADDRESS" forKey:(NSString *)kCFStreamSSLPeerName];
    
    // 此方法是GCDScoket 设置ssl验证的唯一方法,需要穿字典
    [_asyncSocket startTLS:sslSettings];
}


//设置主机服务器和端口号，连接
- (void)connectWithHost:(NSString *)hostName port:(int)port
{
    
    [_asyncSocket connectToHost:hostName onPort:port error:nil];
  
}
// 断开连接
- (void)disconnect {
    
    [_asyncSocket disconnect];
}
/** 连接状态*/
- (BOOL)isconnect {
    
    return [_asyncSocket isConnected];
    
}

#pragma mark - GSD代理

//socket断开连接会调用该函数
- (void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err
{
    NSLog(@"socket断开连接会调用该函数");
}

//socket连接到主机会调用该函数
- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port
{


    
    NSLog(@"socket连接到主机会调用该函数");

}

//SSL不通过证书验证
- (void)startWithTLS
{
    NSDictionary *sslSettings =  @{(NSString *)kCFStreamSSLValidatesCertificateChain: (id)kCFBooleanFalse};
    [_asyncSocket startTLS:sslSettings];
}

//socket连接后收到数据
- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
    [sock readDataWithTimeout:-1 tag:tag];
}

//socket写入数据
- (void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag
{
    [sock readDataWithTimeout:-1 tag:tag];
}

@end
