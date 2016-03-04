//
//  DNContentViewController.h
//  DNOpenSDK
//
//  Created by lynn on 16/1/28.
//

#import <DNTryDriveOpenSDK/DNTryDriveOpenSDK.h>

@interface DNContentViewController : DNWebViewController

@property (nonatomic, assign) CLLocationCoordinate2D coordinate; // 当前位置的经纬度信息

- (instancetype)initWithCarModelId:(NSString *)carModelId; // 车型id

- (void)didClickBackButton:(UIButton *)backButton;

@end
