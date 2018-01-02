//
//  ViewController.h
//  TestIOS
//
//  Created by simultech on 28/2/17.
//  Copyright © 2017 simultech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate, WKNavigationDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) WKWebView *wkWebView;

@property (assign) BOOL useWKWebView;
@property (nonatomic, strong) NSString *url;

@end

