//
//  DNWebViewController.h
//  Pods
//
//  Created by lynn on 16/1/22.
//
//

#import <UIKit/UIKit.h>
#import "UIWebView+DNOpenSDKWebViewJavascriptBridge.h"
#import <CoreLocation/CoreLocation.h>

@interface DNWebViewController : UIViewController

@property (nonatomic, strong, readonly) UIWebView *webView;

@property (nonatomic, assign) NSTimeInterval timeoutInterval; // 超时时间，默认10秒
@property (nonatomic, assign) NSURLRequestCachePolicy cachePolicy; // 缓存策略，默认NSURLRequestReloadIgnoringCacheData

/*!
 *  @brief 加载默认的url请求
 
 *  @param carModelId 车型Id
 *  @param coordinate 当前所在位置的经纬度信息，此值请尽量传且保证正确性，否则影响到发单以及体验效果
 */
- (void)loadRequestWithCarModelId:(NSString *)carModelId currentCoordinate:(CLLocationCoordinate2D)coordinate;

/*!
 *  @brief 刷新当前的url请求
 */
- (void)reloadRequest;

/*!
 *  @brief H5调用native打开一个新的H5页面，子类实现
 *  @param param 页面需要的参数，例如url
 */
- (void)openWebViewControllerWithParam:(NSDictionary *)param;

/*!
 *  @brief H5调用native关闭当前页面，子类实现
 *  @param param 参数
 */
- (void)closeWebViewControllerWithParam:(NSDictionary *)param;

/*!
 *  @brief 注册js监听
 *  @param handlerName 名字
 *  @param handler     回调
 */
- (void)registerBridgeHandler:(NSString *)handlerName bridgeHandler:(DNOpenSDKBridgeHandler)handler;

/*!
 *  @brief 执行js回调
 *  @param handlerName 名字
 */
- (void)callBridgeKHandler:(NSString *)handlerName;

/*!
 *  @brief 执行js回调
 *  @param handlerName 名字
 *  @param jsonData    数据
 */
- (void)callBridgeKHandler:(NSString *)handlerName jsonData:(NSString *)jsonData;

/*!
 *  @brief 执行js回调
 *  @param handlerName  名字
 *  @param jsonData     数据
 *  @param callback     js对native的回调
 */
- (void)callBridgeKHandler:(NSString *)handlerName jsonData:(NSString *)jsonData callback:(DNOpenSDKBridgeCallback)callback;

/*!
 *  @brief webView 代理回调
 */
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType;
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;
- (void)webViewDidFinishLoad:(UIWebView *)webView;
- (void)webViewDidStartLoad:(UIWebView *)webView;

@end
