//
//  QRScanViewController.h
//  QRScan
//
//  Created by Qin on 16/3/8.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QRConst.h"

@interface QRScanViewController : UIViewController

/** 扫描结果 */
@property (nonatomic, copy) void (^returnScanBarCodeValue)(NSString * barCodeString);

@end
