//
//  GuideViewController.m
//  EAIntroView
//
//  Created by xiejingya on 11/23/15.
//  Copyright © 2015 SampleCorp. All rights reserved.
//

#import "GuideViewController.h"

@interface GuideViewController ()

@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self showIntroWithCrossDissolve];
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
- (void)showIntroWithCrossDissolve {
    EAIntroPage *page1 = [EAIntroPage page];
    
    page1.bgImage = [UIImage imageNamed:@"guide_step_1"];
    
    EAIntroPage *page2 = [EAIntroPage page];
    
    page2.bgImage = [UIImage imageNamed:@"guide_step_2"];
    
    EAIntroPage *page3 = [EAIntroPage page];
    
    page3.bgImage = [UIImage imageNamed:@"guide_step_3"];
    
    EAIntroPage *page4 = [EAIntroPage page];
    
    page4.bgImage = [UIImage imageNamed:@"guide_step_4"];
    
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3,page4]];
    
    [intro setDelegate:self];
    [intro showInView:self.view animateDuration:0.0];
}
- (void)introDidFinish {
    NSLog(@"Intro callback");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController = [storyboard instantiateInitialViewController];
    
    [self presentModalViewController:viewController animated:YES];
    //返回
    [self dismissModalViewControllerAnimated:YES];
}
@end
