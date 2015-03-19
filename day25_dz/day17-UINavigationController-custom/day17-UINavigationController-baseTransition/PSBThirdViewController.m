//
//  PSBThirdViewController.m
//  day17-UINavigationController-baseTransition
//
//  Created by 潘松彪 on 14-8-29.
//  Copyright (c) 2014年 PSB. All rights reserved.
//

#import "PSBThirdViewController.h"

@interface PSBThirdViewController ()

@end

@implementation PSBThirdViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    self.title = @"第三页";
    [self createButtons];
    [self customToolBar];
    [self customToolBarItem];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Buttons

//创建两个button
- (void)createButtons
{
    NSArray * titles = @[@"首页", @"上一页"];
    
    for (NSInteger i = 0; i < 2; i++) {
        UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100 + 60 * i, 100, 40)];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blackColor];
        button.tag = 10 + i;
        [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        [button release];
    }
}

- (void)onClick:(UIButton *)button
{
    switch (button.tag - 10) {
        case 0:
            [self popToRootViewController];
            break;
        case 1:
            [self popToPrevViewController];
            break;
        default:
            break;
    }
}

//返回上一级
- (void)popToPrevViewController
{
//    [self.navigationController popViewControllerAnimated:YES];
    
    //当前页返回，当前页释放
    
    
    
    //返回到某个指定的页面，但是这个页面必须在nc的序列中
    //取得nc的视图控制器序列
    NSArray * viewControllers = self.navigationController.viewControllers;
    //数组中装有序列上每个视图控制器
    //数组元素的顺序，就是视图控制器序列的顺序
    
    [self.navigationController popToViewController:viewControllers[1] animated:YES];
    //当我们退回到某个视图控制器，那么序列中排在其后的视图控制器都释放。
    
}


//返回首页
- (void)popToRootViewController
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    //这里的rvc只导航控制器序列上的rvc。
}

#pragma mark - 定制工具条

- (void)customToolBar
{
    UINavigationController * nc = self.navigationController;
    //设置透明
    nc.toolbar.translucent = NO;
    //设置样式
    nc.toolbar.barStyle = UIBarStyleBlack;
    //设置tintColor
    nc.toolbar.tintColor = [UIColor redColor];
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7) {
        nc.toolbar.barTintColor = [UIColor orangeColor];
    }
    
    //设置图片
//    [nc.toolbar setBackgroundImage:[UIImage imageNamed:@"toolBar.png"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    //Position就设为0.
}

- (void)customToolBarItem
{
    //添加BarButtonItem
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:nil action:nil];
    UIBarButtonItem * item3 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:nil action:nil];

#if 0
    //空间占位符
    UIBarButtonItem * spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    //宽度
    spaceItem.width = 40;
#else
    //空间占位符
    UIBarButtonItem * spaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];

#endif
    //添加给toolBarItem
    self.toolbarItems = @[item1, spaceItem, item2, spaceItem, item3];
    
    [item1 release];
    [item2 release];
    [item3 release];
    [spaceItem release];
}


#pragma mark - 生命周期

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setToolbarHidden:NO animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setToolbarHidden:YES animated:NO];
}


@end






