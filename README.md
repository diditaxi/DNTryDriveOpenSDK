# 滴滴试驾开放服务SDK

[![CI Status](http://img.shields.io/travis/wangshaolin/DNTryDriveOpenSDK.svg?style=flat)](https://travis-ci.org/wangshaolin/DNTryDriveOpenSDK)
[![Version](https://img.shields.io/cocoapods/v/DNTryDriveOpenSDK.svg?style=flat)](http://cocoapods.org/pods/DNTryDriveOpenSDK)
[![License](https://img.shields.io/cocoapods/l/DNTryDriveOpenSDK.svg?style=flat)](http://cocoapods.org/pods/DNTryDriveOpenSDK)
[![Platform](https://img.shields.io/cocoapods/p/DNTryDriveOpenSDK.svg?style=flat)](http://cocoapods.org/pods/DNTryDriveOpenSDK)

## SDK接入准备

第三方APP在接入SDK时需要提前准备好appId和appSecret,其中appSecret用于签名;
<a id="点击获得appId和appSecret"></a>点击获得appId和appSecret

## 开发环境

* `iOS6+` `Xcode7+`

## 如何接入SDK
* 已使用cocoapods管理工程的项目
 * `podfile`文件中加入`pod "DNTryDriveOpenSDK", :git => "https://github.com/diditaxi/DNTryDriveOpenSDK.git"`
    终端进入工程所在目录下，执行`pod install`命令，执行完成后工程就具备DNTryDriveOpenSDK的能力

* 未使用cocoapods管理工程的项目
 * 手动把静态库（.a）以及头文件拷贝到工程中，在项目中添加`SSKeychain`和`WebViewJavascriptBridge`第三方库依赖

## 代码接入
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
## Author

wangshaolin, wangshaolin@didichuxing.com

## License

DNTryDriveOpenSDK is available under the MIT license. See the LICENSE file for more info.

