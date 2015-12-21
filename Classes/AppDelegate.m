//
//  AppDelegate.m
//  EAIntroView
//
//  Created by Evgeny Aleksandrov on 14.09.13.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

    [self setUserAgent];
    //此为找到plist文件中得版本号suo'dui所对应的键
    
    NSString *key = (NSString *)kCFBundleVersionKey;
    
    // 1.从plist中取出版本号
    
    NSString *version = [NSBundle mainBundle].infoDictionary[key];
    
    // 2.从沙盒中取出上次存储的版本号
    
    NSString *saveVersion = [[NSUserDefaults  standardUserDefaults] objectForKey:key];
    
    if([version  isEqualToString:saveVersion]) {
        
        //不是第一次使用这个版本
        
        //不显示状态
        
        application.statusBarHidden =NO;
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        UIViewController *viewController = [storyboard instantiateInitialViewController];
//               UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"viewController"];
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        self.window.rootViewController = viewController;
        [self.window makeKeyAndVisible];
        return YES;

        
    
}else{
    
    //版本号不一样：第一次使用新版本
    
    //将新版本号写入沙盒
    
    [[NSUserDefaults  standardUserDefaults] setObject:version forKey:key];
    
    [[NSUserDefaults  standardUserDefaults] synchronize];
    
    //显示版本新特性界面
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Guide" bundle:nil];
    UIViewController *viewController = [storyboard instantiateInitialViewController];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = viewController;
    
    [self.window makeKeyAndVisible];
  
    
}
   
    
    return YES;
}

-(void)setUserAgent
{
    NSString *userAgent = [[[UIWebView alloc] init] stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
    // 获取App名称，我的App有本地化支持，所以是如下的写法
    NSString *appName = NSLocalizedStringFromTable(@"CFBundleDisplayName", @"InfoPlist", nil);
    // 如果不需要本地化的App名称，可以使用下面这句
    // NSString * appName = [[NSBundle mainBundle] infoDictionary][@"CFBundleDisplayName"];
    NSString *version = [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
    NSString *customUserAgent = [userAgent stringByAppendingFormat:@" %@", @"lqshapp"];
    customUserAgent = @"lqshapp";
    [[NSUserDefaults standardUserDefaults] registerDefaults:@{@"UserAgent":customUserAgent}];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
