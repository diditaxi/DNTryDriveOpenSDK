//
//  DNViewController.m
//  DNTryDriveOpenSDK
//
//  Created by wangshaolin on 01/28/2016.
//  Copyright (c) 2016 wangshaolin. All rights reserved.
//

#import "DNViewController.h"
#import "DNContentViewController.h"

@interface DNViewController ()

@end

@implementation DNViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"demo";
    
    CGFloat openWebViewPageButton_W = 150.0;
    CGFloat openWebViewPageButton_H = 50.0;
    CGFloat openWebViewPageButton_Y = 150.0;
    CGFloat openWebViewPageButton_X = (self.view.bounds.size.width - openWebViewPageButton_W) * 0.5;
    UIButton *openWebViewPageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    openWebViewPageButton.frame = CGRectMake(openWebViewPageButton_X, openWebViewPageButton_Y, openWebViewPageButton_W, openWebViewPageButton_H);
    openWebViewPageButton.titleLabel.font = [UIFont systemFontOfSize:30.0];
    [openWebViewPageButton setTitle:@"滴滴出行" forState:UIControlStateNormal];
    [openWebViewPageButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [openWebViewPageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [openWebViewPageButton addTarget:self action:@selector(didClickOpenWebViewPageButton:) forControlEvents:UIControlEventTouchUpInside];
    [openWebViewPageButton setBackgroundColor:[UIColor lightGrayColor]];
    openWebViewPageButton.layer.masksToBounds = YES;
    openWebViewPageButton.layer.cornerRadius = 8.0;
    [self.view addSubview:openWebViewPageButton];
}

- (void)didClickOpenWebViewPageButton:(UIButton *)openWebViewPageButton{
    DNContentViewController *contentViewController = [[DNContentViewController alloc] init];
    [self.navigationController pushViewController:contentViewController animated:YES];
}

@end
