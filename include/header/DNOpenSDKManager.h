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
 *  @brief 设置appKey和签名私钥
 *  @param appKey    appKey
 *  @param appSecret 签名私钥
 */
+ (void)setAppKey:(NSString *)appKey withAppSecret:(NSString *)appSecret;

@end
