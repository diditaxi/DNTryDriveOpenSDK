//
//  DNViewController.m
//  DNTryDriveOpenSDK
//
//  Created by wangshaolin on 01/28/2016.
//  Copyright (c) 2016 wangshaolin. All rights reserved.
//

#import "DNViewController.h"

@interface DNViewController ()

@end

@implementation DNViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    // 加载默认的jsBridge
    [self.webView loadDefaultJavascriptBridge];
}

@end
