//
//  AppDelegate.m
//  GG环信test
//
//  Created by heyudongfang on 16/3/17.
//  Copyright © 2016年 heyudongfang. All rights reserved.
//

#import "AppDelegate.h"
#import "EaseUI.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[ UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor redColor];
    [self.window makeKeyAndVisible];
    
    ViewController *vc = [[ ViewController alloc] init];
    UINavigationController *nc = [[ UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = nc;
    
    
    
    
    //AppKey:注册的appKey，详细见下面注释。
    //apnsCertName:推送证书名(不需要加后缀)，详细见下面注释。
    EMOptions *options = [EMOptions optionsWithAppkey:@"gx110387#test"];
    options.apnsCertName = @"istore_dev";
    [[EMClient sharedClient] initializeSDKWithOptions:options];

  
    EMError *error1 = [[EMClient sharedClient] loginWithUsername:@"gaoxing01" password:@"gaoxing"];
    if (!error1) {
        DDLog(@"登陆成功");
    }
    [[EMClient sharedClient].chatManager loadAllConversationsFromDB];
 
    return YES;
}
// App进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[EMClient sharedClient] applicationDidEnterBackground:application];
}

// App将要从后台返回
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[EMClient sharedClient] applicationWillEnterForeground:application];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}



- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
