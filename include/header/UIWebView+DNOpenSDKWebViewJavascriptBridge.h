//
//  UIWebView+DNOpenSDKWebViewJavascriptBridge.h
//  Pods
//
//  Created by lynn on 16/1/22.
//
//

#import <UIKit/UIKit.h>
#import <WebViewJavascriptBridge/WebViewJavascriptBridge.h>

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
 *  @brief 注册JS监听
 *  @param handlerName 注册监听的名字
 *  @param handler     回调
 */
- (void)registerBridgeHandler:(NSString *)handlerName bridgeHandler:(DNOpenSDKBridgeHandler)handler;

/*!
 *  @brief 执行回调
 */
- (void)callBridgeKHandler:(NSString *)handlerName;
- (void)callBridgeKHandler:(NSString *)handlerName jsonData:(NSString *)jsonData;
- (void)callBridgeKHandler:(NSString *)handlerName jsonData:(NSString *)jsonData callback:(DNOpenSDKBridgeCallback)callback;

@end

/*!
 *  @brief 滴滴试驾开放服务H5首页URL地址
 */
UIKIT_EXTERN NSString * const DNOpenSDKTryDriveWebViewHomePageURL;

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
