//
//  DNOpenSDKManager.h
//  Pods
//
//  Created by lynn on 16/1/28.
//
//

#import <Foundation/Foundation.h>

@interface DNOpenSDKManager : NSObject

/*!
 *  @brief 设置appId和签名私钥
 *  @param appId    appId
 *  @param appSecret 签名私钥
 */
+ (void)setAppId:(NSString *)appId withAppSecret:(NSString *)appSecret;

@end
