//
//  PSBDetailViewController.m
//  PSBNavigationControllerDemo-baseMethod
//
//  Created by 潘松彪 on 15/3/16.
//  Copyright (c) 2015年 PSB. All rights reserved.
//

#import "PSBDetailViewController.h"

@interface PSBDetailViewController ()

@end

@implementation PSBDetailViewController

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
    self.view.backgroundColor = [UIColor purpleColor];
    
    //设置标题
    self.title = @"详情页";
    
    
    //添加button
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(200, 300, 40, 40)];
    
    button.backgroundColor = [UIColor blackColor];
    
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    [button release];
}
- (void)onClick:(UIButton *)button
{
    //返回到上一级
//    [self.navigationController popViewControllerAnimated:YES];
    //发挥到第一栈
//    [self.navigationController popToRootViewControllerAnimated:YES];

    //取出栈中的每个视图控制器的地址，栈从入口开始到每一级，依次对应数组的index
    NSArray * viewControllers = self.navigationController.viewControllers;
    //返回到某一页，必须在栈里
    [self.navigationController popToViewController:viewControllers[0] animated:YES];

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
