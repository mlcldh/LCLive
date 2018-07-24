//
//  LCWebViewController.m
//  LCWeb
//
//  Created by MengLingChao on 2018/7/8.
//  Copyright © 2018年 MengLingChao. All rights reserved.
//

#import "LCWebViewController.h"
#import <WebKit/WebKit.h>

@interface LCWebViewController ()

/**webview*/
@property (nonatomic, strong) WKWebView *webView;

@end

@implementation LCWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self webView];
    NSURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.urlString] cachePolicy:0 timeoutInterval:0];
    [self.webView loadRequest:urlRequest];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Getter
- (WKWebView *)webView {
    if (! _webView) {
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc]init];
        configuration.allowsInlineMediaPlayback = YES;// iPhone上为NO，iPad上为YES，需要设置为YES
        _webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:configuration];
//        _h5View.backgroundColor = RGB(0x2e, 0x31, 0x32);
        _webView.allowsBackForwardNavigationGestures = YES;
//        _h5View.navigationDelegate = self;
//        _h5View.UIDelegate = self;
//        [self addObserver:self forKeyPath:@"h5View.title" options:(NSKeyValueObservingOptionNew) context:nil];
//        [self addObserver:self forKeyPath:@"h5View.estimatedProgress" options:(NSKeyValueObservingOptionNew) context:nil];
//        [self addObserver:self forKeyPath:@"h5View.canGoBack" options:(NSKeyValueObservingOptionNew) context:nil];
        [self.view addSubview:_webView];
        [_webView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
    }
    return _webView;
}

@end
