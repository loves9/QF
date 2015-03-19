//
//  PSBSecondViewController.m
//  day17-UINavigationController-baseTransition
//
//  Created by 潘松彪 on 14-8-29.
//  Copyright (c) 2014年 PSB. All rights reserved.
//

#import "PSBSecondViewController.h"
#import "PSBThirdViewController.h"

@interface PSBSecondViewController ()

@end

@implementation PSBSecondViewController

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
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.title = @"第二页";
    
    [self createButtons];
    [self customNavigationItem];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - button
//创建两个button
- (void)createButtons
{
    NSArray * titles = @[@"下一页", @"上一页"];
    
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
            [self pushNextViewController];
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
    [self.navigationController popViewControllerAnimated:YES];
    
    //当前页返回，当前页释放
}

//推出下一页
- (void)pushNextViewController
{
    PSBThirdViewController * tvc = [[PSBThirdViewController alloc] init];
    [self.navigationController pushViewController:tvc animated:YES];
    [tvc release];
}

#pragma mark - NavigationItem定制
- (void)customNavigationItem
{
    //一个导航条可以添加多个左右BarButtonItem
    
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:nil action:nil];
    UIBarButtonItem * item2 = [[UIBarButtonItem alloc] initWithTitle:@"OK" style:UIBarButtonItemStyleBordered target:nil action:nil];
    
    //使用自定义视图，创建barButtonItem
    UISwitch * sw = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [sw addTarget:self action:@selector(pushNextViewController) forControlEvents:UIControlEventValueChanged];
    
    //barButton官方推荐大小是20X20
    UIBarButtonItem * item3 = [[UIBarButtonItem alloc] initWithCustomView:sw];
    [sw release];
    
    
    //将多个item添加到右侧
    self.navigationItem.rightBarButtonItems = @[item1, item2, item3];
    
    [item1 release];
    [item2 release];
    [item3 release];
    
    
    //设置返回键隐藏
    self.navigationItem.hidesBackButton = YES;
    
    
    
    //设置当前视图控制器的返回键样式，在下一级视图控制器上生效
    self.navigationItem.backBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil] autorelease];
    //事件不用添加
}

#pragma mark - 生命周期方法

//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//}
//
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
//}


@end








