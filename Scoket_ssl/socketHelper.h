//
//  socketHelper.h
//  Scoket_ssl
//
//  Created by QinRong on 16/9/21.
//  Copyright © 2016年 Qin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface socketHelper : NSObject

@property (nonatomic, assign) uint16_t port; // 端口
@property (nonatomic, copy) NSString *socketHost; // 服务器地址

+ (instancetype)sharedSocket;

- (void)startConnectSocket;

@end
