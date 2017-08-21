//
//  TestWebView.m
//  TestNSURLProtocol
//
//  Created by KM on 2017/8/21.
//  Copyright © 2017年 KM. All rights reserved.
//

#import "TestWebView.h"
#import "RichURLSessionProtocol.h"

@interface TestWebView ()

@property (nonatomic, strong) UIWebView *webview;

@end

@implementation TestWebView

- (void)loadView{
    
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"baidu";
    
    CGFloat webW = [[UIScreen mainScreen] bounds].size.width;
    CGFloat webH = [[UIScreen mainScreen] bounds].size.height - 64;
    
    self.webview = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, webW, webH)];
    [self.view addSubview:self.webview];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://www.baidu.com"]];
    [self.webview loadRequest:request];
    
    //注册网络请求拦截
    [NSURLProtocol registerClass:[RichURLSessionProtocol class]];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    //取消注册网络请求拦截
    [NSURLProtocol unregisterClass:[RichURLSessionProtocol class]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
