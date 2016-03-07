//
//  DNContentViewController.m
//  DNOpenSDK
//
//  Created by lynn on 16/1/28.
//

#import "DNContentViewController.h"

@interface DNContentViewController(){
    UIButton *_backButton;
    NSString *_carModelId;
}

@end

@implementation DNContentViewController

- (instancetype)initWithCarModelId:(NSString *)carModelId{
    if(self = [super init]){
        _carModelId = carModelId;
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backButton setImage:[UIImage imageNamed:@"page_back_button_normal"] forState:UIControlStateNormal];
    [_backButton setImage:[UIImage imageNamed:@"page_back_button_pressed"] forState:UIControlStateHighlighted];
    _backButton.frame = CGRectMake(0, 0, 31.0, 31.0);
    [_backButton addTarget:self action:@selector(didClickBackButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_backButton];
    UIBarButtonItem *nullBarButtonItem = [[UIBarButtonItem alloc] init];
    nullBarButtonItem.width = -15.0;
    self.navigationItem.leftBarButtonItems = @[nullBarButtonItem, backBarButtonItem];
    
    CGRect webViewFrame = self.view.bounds;
    webViewFrame.size.height -= 64.0; // 减去导航栏的高度
    self.webView.frame = webViewFrame;
    
    // 发请求，实际接入时需要使用真是的位置信息和真实的车型id
    [self loadRequestWithCarModelId:_carModelId currentCoordinate:self.coordinate];
}

- (void)didClickBackButton:(UIButton *)backButton{
    if(self.webView.canGoBack){
        [self.webView goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
