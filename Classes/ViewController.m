//
//  ViewController.m
//  EAIntroView
//
//  Created by Evgeny Aleksandrov on 14.09.13.
//

#import "ViewController.h"
#define SCREEN_WIDTH                    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT                   ([UIScreen mainScreen].bounds.size.height)
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
   
    [self loadWebPageWithString:@"http://xxx.ahxdnet.com/wap/"];
   
}

- (void)viewDidAppear:(BOOL)animated {
    // all settings are basic, pages with custom packgrounds, title image on each page
    
  
}
- (void)loadWebPageWithString:(NSString*)urlString
{
    NSURL *url =[NSURL URLWithString:urlString];
    
    NSURLRequest *request =[NSURLRequest requestWithURL:url];
    [_webview loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
//    UIView *loadview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-300)];
//    [loadview setTag:108];
//    [loadview setBackgroundColor:[UIColor blackColor]];
//    [loadview setAlpha:0.5];
//    [self.view addSubview:loadview];
    
//    ai = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 32.0f, 32.0f)];
//    [ai setCenter:loadview.center];
//    [ai setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleWhite];
//    [loadview addSubview:ai];
//    [ai startAnimating];
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
//    [ai stopAnimating];
//    UIView *view = (UIView*)[self.view viewWithTag:108];
//    [view removeFromSuperview];
    
    
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}




@end
