//
//  StoryboadUtil.m
//  washcar
//
//  Created by xiejingya on 10/5/15.
//  Copyright © 2015 CSB. All rights reserved.
//

#import "StoryboadUtil.h"
#define IS_WIDESCREEN_5                            (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)568) < __DBL_EPSILON__)
#define IS_WIDESCREEN_6                            (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)667) < __DBL_EPSILON__)
#define IS_WIDESCREEN_6Plus                        (fabs((double)[[UIScreen mainScreen] bounds].size.height - (double)736) < __DBL_EPSILON__)
#define IS_IPHONE                                  ([[[UIDevice currentDevice] model] isEqualToString: @"iPhone"] || [[[UIDevice currentDevice] model] isEqualToString: @"iPhone Simulator"])
#define IS_IPOD                                    ([[[UIDevice currentDevice] model] isEqualToString: @"iPod touch"])
#define IS_IPHONE_5                                (IS_IPHONE && IS_WIDESCREEN_5)
#define IS_IPHONE_6                                (IS_IPHONE && IS_WIDESCREEN_6)
#define IS_IPHONE_6Plus                            (IS_IPHONE && IS_WIDESCREEN_6Plus)
@implementation StoryboadUtil



+(id) getViewController:(NSString *) storyboadName:(NSString*)Identifier{
    UIViewController *controller;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboadName bundle:nil];
    controller = [storyboard instantiateViewControllerWithIdentifier:Identifier];
    
    return  controller;
}

@end
