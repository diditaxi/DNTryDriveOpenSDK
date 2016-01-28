//
//  DNContentViewController.m
//  DNTryDriveOpenSDK
//
//  Created by lynn on 16/1/28.
//  Copyright © 2016年 wangshaolin. All rights reserved.
//

#import "DNContentViewController.h"

@implementation DNContentViewController

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

@end
