//
//  AppDelegate.m
//  shuiku
//
//  Created by 韩明静 on 2018/9/27.
//  Copyright © 2018年 韩明静. All rights reserved.
//

#import "AppDelegate.h"
#import "MapViewController.h"
#import <BMKLocationKit/BMKLocationComponent.h>
#import "LoginViewController.h"

@interface AppDelegate ()<BMKLocationAuthDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.mapmanager=[[BMKMapManager alloc]init];
    
    BOOL ret=[self.mapmanager start:@"YsYBDtbVMbteOq7mK0QUZYY8yesNMl6H" generalDelegate:nil];
    if (!ret) {
        NSLog(@"====================================manager start failed");
    }
    
    [[BMKLocationAuth sharedInstance]checkPermisionWithKey:@"YsYBDtbVMbteOq7mK0QUZYY8yesNMl6H" authDelegate:self];
    
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    LoginViewController *login=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"login"];
    UINavigationController *vc=[[UINavigationController alloc]initWithRootViewController:login];
    self.window.rootViewController=vc;
    [self.window makeKeyAndVisible];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
