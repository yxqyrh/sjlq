//
//  WebViewController.h
//  washcar
//
//  Created by CSB on 15/9/26.
//  Copyright © 2015年 CSB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
//#import "BaseViewController.h"

@interface WebViewController : UIViewController<UIWebViewDelegate,EGORefreshTableHeaderDelegate> {
    //下拉视图
    EGORefreshTableHeaderView * _refreshHeaderView;
    //刷新标识，是否正在刷新过程中
    BOOL _reloading;
}

@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) NSString *url;

@property (nonatomic) bool isNeedRefresh;

-(void)setTitle:(NSString *)title andUrl:(NSString *)url;



@end
