//
//  PSBAppDelegate.m
//  day17-UINavigationController-baseTransition
//
//  Created by 潘松彪 on 14-8-29.
//  Copyright (c) 2014年 PSB. All rights reserved.
//

#import "PSBAppDelegate.h"
#import "PSBFirstViewController.h"

@implementation PSBAppDelegate

- (void)dealloc
{
    [_window  release];
    [super dealloc];
}

#pragma mark - 视图控制器

//创建视图控制器
- (void)createViewControllers
{
    PSBFirstViewController * fvc = [[PSBFirstViewController alloc] init];
    //栈结构，需要main函数，也就是说导航控制器需要一个跟视图控制器
    //添加导航控制器的跟视图控制器
    UINavigationController * nc = [[UINavigationController alloc] initWithRootViewController:fvc];
    
    self.window.rootViewController = nc;
    
    [nc release];
    [fvc release];
}

//定制导航条
- (void)customNavigationBar
{
    UINavigationController * nc = (id)self.window.rootViewController;
    
    //设置导航条是否透明
    nc.navigationBar.translucent = NO;
    
    //设置导航条的样式
    nc.navigationBar.barStyle = UIBarStyleBlack;
 
//    //白
//    UIBarStyleDefault          = 0,
//    //黑
//    UIBarStyleBlack            = 1,
    
    //设置导航条镂空颜色
    nc.navigationBar.tintColor = [UIColor yellowColor];
    
    //判断当前设备的系统版本号
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7) {
        //设置导航条的颜色
        nc.navigationBar.barTintColor = [UIColor purpleColor];
    }
    
    
    //设置导航条图片
    [nc.navigationBar setBackgroundImage:[UIImage imageNamed:@"header_bg64.png"] forBarMetrics:UIBarMetricsDefault];
    //一个导航条可以同时设置四个图片
    
//    UIBarMetricsDefault,
    //竖屏
//    UIBarMetricsLandscapePhone,
    //横屏
//    UIBarMetricsDefaultPrompt = 101,
    //竖屏带详情
//    UIBarMetricsLandscapePhonePrompt
    //横屏带详情
    
    //【注】
    //iOS中经常看到图片素材有button.png和button@2x.png双版本素材
    //创建UIImage对象时，名字只需写button.png。如果当前设备是普通屏，自动载入button.png。如果当前设备是retina屏，自动载入button@2x.png。
    //当然如果button.png和button@2x.png缺少一个，无论普通屏，retina屏都用另一个代替。
    
    //【注】
    //屏幕最上端的透明条是statusBar 状态条 20个坐标高
    //iOS7以前statusBar不透明
    //iOS7中如果添加的导航图片像素高度正好44或88，则图片添加在状态条下面
    //iOS7中如果导航条图片像素高度多于或少于44/88哪怕一个像素，导航条会被添加到状态条下层。导航条的起始位置，紧贴屏幕的上端
    //iOS6以前只能添加44/88像素高度的导航条图片，iOS7开始也可以添加64/128像素高度的。
    
    //导航条的告诉是44坐标，支持44像素或88像素高度的图片
    //iOS7则支持64/128像素高度
    
//    320X480   640X960
    
    //设置隐藏显示导航条
//    [nc setNavigationBarHidden:YES animated:YES];
    //导航条只有一个，隐藏就每页全隐藏
    
}

#pragma mark - UIApplicationdelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self createViewControllers];
    [self customNavigationBar];
    
    [self.window makeKeyAndVisible];
    return YES;
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
