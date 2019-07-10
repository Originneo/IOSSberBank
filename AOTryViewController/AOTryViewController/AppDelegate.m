//
//  AppDelegate.m
//  AOTryViewController
//
//  Created by Камила Валиева on 30/06/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property(nonatomic,strong)UIViewController *verticalViewController;
@property(nonatomic,strong)UIViewController *horizontalViewController;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    self.window.backgroundColor = UIColor.whiteColor;
    [self.window makeKeyAndVisible];
    UITabBarController* barCon = [[UITabBarController alloc]init];
    [self setupUI];
   
    [barCon setViewControllers:(@[self.verticalViewController,self.horizontalViewController])];
    [self.window setRootViewController:barCon];
    self.verticalViewController.tabBarItem.title = @"vertical";
    self.horizontalViewController.tabBarItem.title = @"horizontal";

    
    
    return YES;
}

-(void)setupUI
{
    UIViewController* redViewController = [self AORedViewController];
    UIViewController *blueViewController = [self AOBlueViewController];
    
    UIViewController* redViewControllerSecond = [self AORedViewController];
    UIViewController* blueViewControllerSecond = [self AOBlueViewController];
    
    
    self.verticalViewController = [UIViewController new];
    self.horizontalViewController = [UIViewController new];
   
    [self.horizontalViewController addChildViewController:redViewController];
    [self.horizontalViewController addChildViewController:blueViewController];
    [self.verticalViewController addChildViewController:redViewControllerSecond];
    [self.verticalViewController addChildViewController:blueViewControllerSecond];
    
    [self.horizontalViewController.view addSubview:redViewController.view];
    [self.horizontalViewController.view addSubview:blueViewController.view];
    [self.verticalViewController.view addSubview:redViewControllerSecond.view];
    [self.verticalViewController.view addSubview:blueViewControllerSecond.view];
    
    
    [redViewController.view.leadingAnchor constraintEqualToAnchor:self.horizontalViewController.view.leadingAnchor].active = YES;
    [redViewController.view.trailingAnchor constraintEqualToAnchor:self.horizontalViewController.view.trailingAnchor].active = YES;
    [redViewController.view.topAnchor constraintEqualToAnchor:self.horizontalViewController.view.topAnchor].active = YES;
    [redViewController.view.bottomAnchor constraintEqualToAnchor:blueViewController.view.topAnchor].active = YES;
    
    [blueViewController.view.leadingAnchor constraintEqualToAnchor:self.horizontalViewController.view.leadingAnchor].active = YES;
    [blueViewController.view.trailingAnchor constraintEqualToAnchor:self.horizontalViewController.view.trailingAnchor].active = YES;
    [blueViewController.view.bottomAnchor constraintEqualToAnchor:self.horizontalViewController.view.bottomAnchor].active = YES;
    [blueViewController.view.heightAnchor constraintEqualToAnchor:redViewController.view.heightAnchor].active = YES;
    

    
    [redViewController didMoveToParentViewController:self.horizontalViewController];
    [blueViewController didMoveToParentViewController:self.horizontalViewController];

    [redViewControllerSecond.view.leadingAnchor constraintEqualToAnchor:self.verticalViewController.view.leadingAnchor].active = YES;
    [redViewControllerSecond.view.trailingAnchor constraintEqualToAnchor:blueViewControllerSecond.view.leadingAnchor].active = YES;
    [redViewControllerSecond.view.topAnchor constraintEqualToAnchor:self.verticalViewController.view.topAnchor].active = YES;
    [redViewControllerSecond.view.bottomAnchor constraintEqualToAnchor:self.verticalViewController.view.bottomAnchor].active = YES;

    [blueViewControllerSecond.view.widthAnchor constraintEqualToAnchor:redViewControllerSecond.view.widthAnchor].active = YES;
    [blueViewControllerSecond.view.trailingAnchor constraintEqualToAnchor:self.verticalViewController.view.trailingAnchor].active = YES;
    [blueViewControllerSecond.view.bottomAnchor constraintEqualToAnchor:self.verticalViewController.view.bottomAnchor].active = YES;
    [blueViewControllerSecond.view.topAnchor constraintEqualToAnchor:self.verticalViewController.view.topAnchor].active = YES;

    [redViewControllerSecond didMoveToParentViewController:self.verticalViewController];
    [blueViewControllerSecond didMoveToParentViewController:self.verticalViewController];

};


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
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


-(UIViewController*)AORedViewController
{
    UIViewController* controller = [UIViewController new];
    controller.view.backgroundColor = UIColor.redColor;
    controller.view.translatesAutoresizingMaskIntoConstraints = NO;
    return controller;
}

-(UIViewController*)AOBlueViewController
{
    UIViewController* controller = [UIViewController new];
    controller.view.backgroundColor = UIColor.blueColor;
    controller.view.translatesAutoresizingMaskIntoConstraints = NO;
    return controller;
}


@end
