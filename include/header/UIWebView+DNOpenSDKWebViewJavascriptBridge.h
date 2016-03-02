//
//  UIWebView+DNOpenSDKWebViewJavascriptBridge.h
//  Pods
//
//  Created by lynn on 16/1/22.
//
//

#import <UIKit/UIKit.h>
#import <WebViewJavascriptBridge/WebViewJavascriptBridge.h>
#import <CoreLocation/CoreLocation.h>

typedef void(^DNOpenSDKBridgeCallback)(id data);
typedef void(^DNOpenSDKBridgeHandler)(NSDictionary *dictionary, DNOpenSDKBridgeCallback callback);

@interface UIWebView (DNOpenSDKWebViewJavascriptBridge)

@property (nonatomic, strong) WebViewJavascriptBridge *javascriptBridge;

/*!
 *  @brief 装载默认的javascriptBridge组件，并注册默认handler（包括获取签名handler、获取sdk版本号handler、向native磁盘写数据、从native磁盘读数据）
 */
- (void)loadDefaultJavascriptBridge;

/*!
 *  @brief 设置自己的javascriptBridge，也会自动注册默认handler（包括获取签名handler、获取sdk版本号handler，向native磁盘写数据、从native磁盘读数据）
 *
 *  @param javascriptBridge 自己的javascriptBridge
 */
- (void)setJavascriptBridge:(WebViewJavascriptBridge *)javascriptBridge;

/*!
 *  @brief 注册js监听
 *  @param handlerName 注册监听的名字
 *  @param handler     回调
 */
- (void)registerBridgeHandler:(NSString *)handlerName bridgeHandler:(DNOpenSDKBridgeHandler)handler;

/*!
 *  @brief 执行js回调
 */
- (void)callBridgeKHandler:(NSString *)handlerName;
- (void)callBridgeKHandler:(NSString *)handlerName jsonData:(NSString *)jsonData;
- (void)callBridgeKHandler:(NSString *)handlerName jsonData:(NSString *)jsonData callback:(DNOpenSDKBridgeCallback)callback;

@end

/*!
 *  @brief 试驾预约发单页面的url
 *
 *  @param carModelId        车型id，非空
 *  @param currentCoordinate 当前位置的经纬度信息，尽量传，且要保证值的正确性，否则影响体验效果（非法时[通过DNLocationCoordinate2DIsValid(...)校验]，H5页面会自己获取，但是对体验效果有所影响，因此建议还是native提供此经纬度信息）
 *
 *  @return 完整的url
 */
UIKIT_EXTERN NSString *DNOpenSDKTryDriveWebViewMakeOrderURL(NSString *carModelId, CLLocationCoordinate2D currentCoordinate);

/*!
 *  @brief 校验经纬的合法性
 *
 *  @param coordinate 经纬度
 *
 *  @return 合法返回YES，否则返回NO
 */
UIKIT_EXTERN BOOL DNLocationCoordinate2DIsValid(CLLocationCoordinate2D coordinate);

/*!
 *  @brief js获取native签名
 */
UIKIT_EXTERN NSString * const DNOpenSDKJavascriptBridgeHandlerNameSign;

/*!
 *  @brief js获取native sdk版本号
 */
UIKIT_EXTERN NSString * const DNOpenSDKJavascriptBridgeHandlerNameSDKVersion;

/*!
 *  @brief 打开新的H5页面
 */
UIKIT_EXTERN NSString * const DNOpenSDKJavascriptBridgeHandlerNameOpenWebpage;

/*!
 *  @brief 关闭H5页面
 */
UIKIT_EXTERN NSString * const DNOpenSDKJavascriptBridgeHandlerNameCloseWebpage;

/*!
 *  @brief H5写数据到本地磁盘
 */
UIKIT_EXTERN NSString * const DNOpenSDKJavascriptBridgeHandlerNameWriteDataToDisk;

/*!
 *  @brief H5读取本地磁盘数据
 */
UIKIT_EXTERN NSString * const DNOpenSDKJavascriptBridgeHandlerNameReadDataFromDisk;
