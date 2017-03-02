//
//  DWQProvincesCitiesCountiesPickerview.h
//  DWQAddressSelector
//
//  Created by 杜文全 on 15/1/2.
//  Copyright © 2015年 com.iOSDeveloper.duwenquan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DWQProvincesCitiesCountiesPickerview : UIView
@property (nonatomic,copy) void (^completion)(NSString *provinceName,NSString *cityName,NSString *countyName);

- (void)showPickerWithProvinceName:(NSString *)provinceName cityName:(NSString *)cityName countyName:(NSString *)countyName;//显示 省 市 县名
@end
