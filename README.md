# 滴滴试驾开放服务SDK

[![CI Status](http://img.shields.io/travis/wangshaolin/DNTryDriveOpenSDK.svg?style=flat)](https://travis-ci.org/wangshaolin/DNTryDriveOpenSDK)
[![Version](https://img.shields.io/cocoapods/v/DNTryDriveOpenSDK.svg?style=flat)](http://cocoapods.org/pods/DNTryDriveOpenSDK)
[![License](https://img.shields.io/cocoapods/l/DNTryDriveOpenSDK.svg?style=flat)](http://cocoapods.org/pods/DNTryDriveOpenSDK)
[![Platform](https://img.shields.io/cocoapods/p/DNTryDriveOpenSDK.svg?style=flat)](http://cocoapods.org/pods/DNTryDriveOpenSDK)

## SDK接入准备

第三方APP在接入SDK时需要提前准备好appId和appSecret,其中appSecret用于签名;
[点击获得appId和appSecret](#)

## 开发环境

* `iOS7+` `Xcode7+`

## 如何接入SDK
* 已使用cocoapods管理工程的项目
 * `podfile`文件中加入`pod "DNTryDriveOpenSDK", :git => "https://github.com/diditaxi/DNTryDriveOpenSDK.git"`
    终端进入工程所在目录下，执行`pod install`命令，执行完成后工程就具备DNTryDriveOpenSDK的能力

* 未使用cocoapods管理工程的项目
 * 手动把静态库（.a）以及头文件拷贝到工程中，在项目中添加`SSKeychain`和`WebViewJavascriptBridge`第三方库依赖

## 代码接入
* 在iOS9中支持http请求
 * 在XXXX-Info.plist中添加`NSAppTransportSecurity`类型为`Dictionary`，在`NSAppTransportSecurity`下添加`NSAllowsArbitraryLoads`类型为`Boolean`，值为`YES`。

* 在iOS8以上的系统中支持定位
 * 在XXXX-Info.plist中添加`NSLocationWhenInUseUsageDescription`类型为`String`，值可为空。

* 在AppDelegate中以以下方式引入头文件
```objc
#import <DNTryDriveOpenSDK/DNTryDriveOpenSDK.h>

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    // 设置appId和appSecret
    [DNOpenSDKManager setAppId:@"33837971c4294a939f4d14d61a282fe5" withAppSecret:@"OtxrzxIsfpFjA7SwPzILwy8Bw21TLhquhboDYROV"];
    ....
    
    return YES;
}

```

* 使用SDK提供的Controller和WebView
```objc
#import <DNTryDriveOpenSDK/DNTryDriveOpenSDK.h>
// 继承自SDK提供的DNWebViewController即可，已注册WebView与JS的交互handler
@interface DNContentViewController : DNWebViewController
    
@end

```
* 使用自己的Controller和WebView
```objc
#import <DNTryDriveOpenSDK/DNTryDriveOpenSDK.h>

- (void)viewDidLoad {
    [super viewDidLoad];

    // 调用如下方法注册WebView与JS的交互handler，此方法会生成一个默认的jsBridge
    // 给webView设置自己的jsBridge，并注册WebView与JS的交互handler，如果使用SDK默认的jsBridge，此行代码可以注释掉，改用[self.webView loadDefaultJavascriptBridge];
    // self.webView.javascriptBridge = xxxx; // xxxx表示自己的jsBridge
    
    // 注册WebView与JS的交互handler，如果没有设置自己的jsBridge，此方法会创建一个默认的jsBridge，如果设置了自己的jsBridge，则调用此方法，什么事情都不会发生
    [self.webView loadDefaultJavascriptBridge];
    
    ...

}

```

* SDK首页的URL地址
 * url使用常量字符串`DNOpenSDKTryDriveWebViewHomePageURL`

## Author

汪绍林, wangshaolin@didichuxing.com

## License

DNTryDriveOpenSDK is available under the MIT license. See the LICENSE file for more info.

