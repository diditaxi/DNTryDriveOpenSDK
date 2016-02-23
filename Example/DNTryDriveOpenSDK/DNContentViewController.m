//
//  DNContentViewController.m
//  DNOpenSDK
//
//  Created by lynn on 16/1/28.
//  Copyright © 2016年 wangshaolin. All rights reserved.
//

#import "DNContentViewController.h"

@interface DNContentViewController(){
    UIButton *_backButton;
}

@end

@implementation DNContentViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backButton setImage:[UIImage imageNamed:@"page_back_button_normal"] forState:UIControlStateNormal];
    [_backButton setImage:[UIImage imageNamed:@"page_back_button_pressed"] forState:UIControlStateHighlighted];
    _backButton.frame = CGRectMake(0, 0, 31.0, 31.0);
    [_backButton addTarget:self action:@selector(didClickBackButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_backButton];
    UIBarButtonItem *nullBarButtonItem = [[UIBarButtonItem alloc] init];
    nullBarButtonItem.width = -15.0;
    self.navigationItem.leftBarButtonItems = @[nullBarButtonItem, backBarButtonItem];
}

- (void)didClickBackButton:(UIButton *)backButton{
    if(self.webView.canGoBack){
        [self.webView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [super webViewDidFinishLoad:webView];
    
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
}

@end
