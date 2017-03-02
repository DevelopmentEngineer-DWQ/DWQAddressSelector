//
//  ViewController.m
//  DWQAddressSelector
//
//  Created by 杜文全 on 15/1/2.
//  Copyright © 2015年 com.iOSDeveloper.duwenquan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *PccLB;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //为余额添加点击事件
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(toSelectAddress)];
    // 允许用户交互
    self.PccLB.userInteractionEnabled=YES;
    
    [self.PccLB addGestureRecognizer:tap];
}
-(void)toSelectAddress{
    
    NSString *address = self.PccLB.text;
    NSArray *array = [address componentsSeparatedByString:@" "];
    
    NSString *province = @"";//省
    NSString *city = @"";//市
    NSString *county = @"";//县
    if (array.count > 2) {
        province = array[0];
        city = array[1];
        county = array[2];
    } else if (array.count > 1) {
        province = array[0];
        city = array[1];
    } else if (array.count > 0) {
        province = array[0];
    }
    
    [self.regionPickerView showPickerWithProvinceName:province cityName:city countyName:county];

}
- (DWQProvincesCitiesCountiesPickerview *)regionPickerView {
    if (!_regionPickerView) {
        _regionPickerView = [[DWQProvincesCitiesCountiesPickerview alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
        
        __weak typeof(self) wself = self;
        _regionPickerView.completion = ^(NSString *provinceName,NSString *cityName,NSString *countyName) {
            __strong typeof(wself) self = wself;
            self.PccLB.text = [NSString stringWithFormat:@"%@ %@ %@",provinceName,cityName,countyName];
            
                        if ([provinceName isEqualToString:@""]) {
                self.PccLB.text=@"省份、城市、县区";
            }
            
        };
        [self.view addSubview:_regionPickerView];
    }
    return _regionPickerView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
