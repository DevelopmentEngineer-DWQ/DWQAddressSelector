//
//  DWQAddressManager.m
//  DWQAddressSelector
//
//  Created by 杜文全 on 15/1/2.
//  Copyright © 2015年 com.iOSDeveloper.duwenquan. All rights reserved.
//

#import "DWQAddressManager.h"

@interface DWQAddressManager ()

@end

@implementation DWQAddressManager

+ (instancetype)shareInstance {
    static DWQAddressManager *_addressManager = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _addressManager = [[self alloc] init];
    });
    return _addressManager;
}

- (NSArray *)provinceDicAry {
    if (!_provinceDicAry) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"address" ofType:@"plist"];
        _provinceDicAry = [[NSArray alloc] initWithContentsOfFile:path];
    }
    return _provinceDicAry;
}
@end
