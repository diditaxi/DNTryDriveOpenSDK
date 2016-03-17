//
//  DNContentViewController.m
//  DNOpenSDK
//
//  Created by lynn on 16/1/28.
//

#import "DNContentViewController.h"

@interface DNContentViewController(){
    UIButton *_backButton;
    UIButton *_closeButton;
    
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
    
    _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_closeButton setImage:[UIImage imageNamed:@"page_close_button_normal"] forState:UIControlStateNormal];
    [_closeButton setImage:[UIImage imageNamed:@"page_close_button_pressed"] forState:UIControlStateHighlighted];
    _closeButton.frame = CGRectMake(0, 0, 31.0, 31.0);
    [_closeButton addTarget:self action:@selector(didClickCloseButton:) forControlEvents:UIControlEventTouchUpInside];
    _closeButton.hidden = YES; // 默认隐藏
    
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_backButton];
    UIBarButtonItem *nullBarButtonItem = [[UIBarButtonItem alloc] init];
    nullBarButtonItem.width = -15.0; // 控制返回按钮距离左边的间距不能太宽
    UIBarButtonItem *closeBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_closeButton];
    self.navigationItem.leftBarButtonItems = @[nullBarButtonItem, backBarButtonItem, closeBarButtonItem];
    
    CGRect webViewFrame = self.view.bounds;
    webViewFrame.size.height -= 64.0; // 减去导航栏的高度
    self.webView.frame = webViewFrame;
    
    // 加载webView请求，实际接入时需要使用真实的位置信息和真实的车型id
    [self loadRequestWithCarModelId:_carModelId currentCoordinate:self.coordinate];
}

- (void)didClickBackButton:(UIButton *)backButton{
    if(self.webView.canGoBack){
        [self.webView goBack];
        
        // 显示关闭按钮
        _closeButton.hidden = NO;
    }else{
        [self didClickCloseButton:_closeButton];
    }
}

- (void)didClickCloseButton:(UIButton *)closeButton{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
