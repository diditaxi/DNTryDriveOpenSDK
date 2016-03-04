//
//  DNViewController.m
//  DNOpenSDK
//
//  Created by lynn on 01/21/2016.
//

#import "DNViewController.h"
#import "DNContentViewController.h"

@interface DNViewController ()

@end

@implementation DNViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"试驾SDK";
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    CGFloat openWebViewPageButtonWidth = 100.0;
    CGFloat openWebViewPageButtonHeight = 30.0;
    CGFloat openWebViewPageButtonY = 40.0;
    CGFloat openWebViewPageButtonX = (self.view.bounds.size.width - openWebViewPageButtonWidth) * 0.5;
    UIButton *openWebViewPageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    openWebViewPageButton.frame = CGRectMake(openWebViewPageButtonX, openWebViewPageButtonY, openWebViewPageButtonWidth, openWebViewPageButtonHeight);
    openWebViewPageButton.titleLabel.font = [UIFont systemFontOfSize:20.0];
    [openWebViewPageButton setTitle:@"滴滴试驾" forState:UIControlStateNormal];
    [openWebViewPageButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [openWebViewPageButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [openWebViewPageButton addTarget:self action:@selector(didClickOpenWebViewPageButton:) forControlEvents:UIControlEventTouchUpInside];
    [openWebViewPageButton setBackgroundColor:[UIColor lightGrayColor]];
    openWebViewPageButton.layer.masksToBounds = YES;
    openWebViewPageButton.layer.cornerRadius = 3.0;
    [self.view addSubview:openWebViewPageButton];
}

- (void)didClickOpenWebViewPageButton:(UIButton *)openWebViewPageButton{
    DNContentViewController *contentViewController = [[DNContentViewController alloc] initWithCarModelId:@"662"];
    contentViewController.coordinate = CLLocationCoordinate2DMake(40.042643, 116.290847);
    [self.navigationController pushViewController:contentViewController animated:YES];
}

@end
