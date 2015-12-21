//
//  WebViewController.m
//  washcar
//
//  Created by CSB on 15/9/26.
//  Copyright © 2015年 CSB. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGRect rect = self.view.bounds;
    rect.origin.y = rect.origin.y + 20;
    rect.size.height = rect.size.height - 20 - 44;
    self.webView = [[UIWebView alloc] initWithFrame:rect];
    if (self.isNeedResetAgent) {
        NSString *userAgent = [self.webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
        NSString *customUserAgent;
        if ([userAgent rangeOfString:@"lqshapp"].length > 0) {
            customUserAgent = [userAgent stringByAppendingFormat:@" %@",@""];
            customUserAgent = @"lqshapp";
        }
        else {
            customUserAgent = [userAgent stringByAppendingFormat:@" %@",@"lqshapp"];
            
            customUserAgent = @"lqshapp";
        }
        
        [[NSUserDefaults standardUserDefaults] registerDefaults:@{@"UserAgent":customUserAgent}];
    }
    
    [self.view addSubview:self.webView];
//   
//    NSLayoutConstraint * h_c = [NSLayoutConstraint constraintWithItem:self.webView
//                                                            attribute:NSLayoutAttributeRight
//                                                                                    relatedBy:NSLayoutRelationEqual
//                                                               toItem:self.view
//                                                            attribute:NSLayoutAttributeRight
//                                                           multiplier:1.0
//                                                             constant:0];
//    NSLayoutConstraint * v_c = [NSLayoutConstraint constraintWithItem:self.webView
//                                                            attribute:NSLayoutAttributeTop
//                                                            relatedBy:NSLayoutRelationEqual
//                                                               toItem:self.view
//                                                            attribute:NSLayoutAttributeTop
//                                                           multiplier:1.0
//                                                             constant:20];
//    NSLayoutConstraint * e_w = [NSLayoutConstraint constraintWithItem:self.webView
//                                                            attribute:NSLayoutAttributeLeft
//                                                            relatedBy:NSLayoutRelationEqual
//                                                               toItem:self.view
//                                                            attribute:NSLayoutAttributeLeft
//                                                           multiplier:1.0 constant:0];
//    
//    NSLayoutConstraint * e_h = [NSLayoutConstraint constraintWithItem:self.webView
//                                                            attribute:NSLayoutAttributeBottom
//                                                            relatedBy:NSLayoutRelationEqual
//                                                               toItem:self.view
//                                                            attribute:NSLayoutAttributeBottom
//                                                           multiplier:1.0 constant:0];
//    [self.view addConstraints:@[h_c,v_c,e_h,e_w]];
    
    self.webView.delegate = self;
    self.webView.scrollView.delegate = self;
    
    
    
//    self.webView.scrollView.bounces = NO;
    //初始化refreshView，添加到webview 的 scrollView子视图中
    if (_refreshHeaderView == nil) {
        _refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0, 0-self.webView.scrollView.bounds.size.height, self.webView.scrollView.frame.size.width, self.webView.scrollView.bounds.size.height)];
        _refreshHeaderView.delegate = self;
        [self.webView.scrollView addSubview:_refreshHeaderView];
    }
    [_refreshHeaderView refreshLastUpdatedDate];
    
    [self loadPage];
}

-(void)viewWillAppear:(BOOL)animated
{
    if (_isNeedRefresh) {
        [self loadPage];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTitle:(NSString *)title andUrl:(NSString *)url
{
    self.title = title;
    _url = url;
    
}

//加载网页
- (void)loadPage {
      [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidStartLoad:(UIWebView *)webView {
    _reloading = YES;
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    _reloading = NO;
    [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.webView.scrollView];
    
     NSLog(@"UserAgent = %@", [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"]);
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    NSLog(@"load page error:%@", [error description]);
    _reloading = NO;
    [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:self.webView.scrollView];
    
   
}

#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
}

#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
    
    [self loadPage];
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
    
    return _reloading; // should return if data source model is reloading
    
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
    
    return [NSDate date]; // should return date data source was last changed
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
