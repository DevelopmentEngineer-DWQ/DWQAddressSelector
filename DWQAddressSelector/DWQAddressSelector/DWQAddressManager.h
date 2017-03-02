//
//  DWQAddressManager.h
//  DWQAddressSelector
//
//  Created by 杜文全 on 15/1/2.
//  Copyright © 2015年 com.iOSDeveloper.duwenquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DWQAddressManager : NSObject
+ (instancetype)shareInstance;

@property (nonatomic,strong) NSArray *provinceDicAry;//省字典数组

#define kAddressManager [DWQAddressManager shareInstance]
@end
