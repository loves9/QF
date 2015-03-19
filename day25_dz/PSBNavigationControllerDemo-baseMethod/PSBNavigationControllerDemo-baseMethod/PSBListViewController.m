//
//  PSBListViewController.m
//  PSBNavigationControllerDemo-baseMethod
//
//  Created by 潘松彪 on 15/3/16.
//  Copyright (c) 2015年 PSB. All rights reserved.
//

#import "PSBListViewController.h"
#import "PSBDetailViewController.h"
#import "UIView+PSBTransitionAnimation.h"

@interface PSBListViewController ()

@end

@implementation PSBListViewController

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
    
    //设置背景色
    self.view.backgroundColor = [UIColor yellowColor];
    
    //设置标题
    self.title = @"列表页";
    
    
    //添加button
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 40, 40)];
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    button.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:button];
    [button release];
    
}

- (void)onClick:(UIButton *)button
{
    //栈结构，推出时创建
    PSBDetailViewController * dvc = [[PSBDetailViewController alloc] init];
    
    
    [self.navigationController.view setTransitionAnimationType:PSBTransitionAnimationTypeCube toward:PSBTransitionAnimationTowardFromTop duration:0.5];
    
    
    //使用导航，推出dvc
    [self.navigationController pushViewController:dvc animated:YES];
    //当使用导航推出dvc时，dvc就被添加到导航上了
    //推出的视图控制器不会消失，知道返回
    [dvc release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
