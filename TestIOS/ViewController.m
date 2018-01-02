//
//  ViewController.m
//  TestIOS
//
//  Created by simultech on 28/2/17.
//  Copyright © 2017 simultech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    // Whether to use WKWebView, or stick with UIWebview
    self.useWKWebView = YES;
    // The URL to open automatically
    self.url = @"https://shorthand.com/";
    
    [super viewDidLoad];
    if (!self.useWKWebView) {
        self.webView.delegate = self;
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:self.url]];
        [self.webView loadRequest:urlRequest];
    } else {
        [self.webView removeFromSuperview];
        WKWebViewConfiguration *theConfiguration = [[WKWebViewConfiguration alloc] init];
        self.wkWebView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:theConfiguration];
        self.wkWebView.navigationDelegate = self;
        NSURL *nsurl=[NSURL URLWithString:self.url];
        NSURLRequest *nsrequest=[NSURLRequest requestWithURL:nsurl];
        [self.wkWebView loadRequest:nsrequest];
        [self.view addSubview:self.wkWebView];
    }
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
}

- (void) orientationChanged:(NSNotification *)notification
{
    [self updateWKFrame];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self updateWKFrame];
}

- (void)updateWKFrame {
    if (@available(iOS 11, *)) {
        if (self.useWKWebView) {
            // Resize WKWebView to fit iPhoneX when required
            CGFloat offsetY = 0;
            offsetY = self.view.safeAreaInsets.top;
            CGRect frameRect = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + offsetY, self.view.frame.size.width, self.view.frame.size.height - offsetY);
            self.wkWebView.frame = frameRect;
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
}


@end
