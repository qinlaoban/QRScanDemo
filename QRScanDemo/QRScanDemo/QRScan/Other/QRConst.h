//
//  QRConst.h
//  ScanBarCode
//
//  Created by Qin on 16/3/7.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import "QRColor.h"
#import "UIImage+Qin.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

/**
 *  导航栏高度
 */
extern CGFloat const NAVIGATIONBAR_HEIGHT;

/**
 *  tabBar高度
 */
extern CGFloat const TABBAR_HEIGHT;

/**
 *  扫描透明框比例
 */
extern CGFloat const QRScanRatio;

@interface QRConst : NSObject

@end
