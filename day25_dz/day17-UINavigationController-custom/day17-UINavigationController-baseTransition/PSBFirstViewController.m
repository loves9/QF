//
//  PSBFirstViewController.m
//  day17-UINavigationController-baseTransition
//
//  Created by 潘松彪 on 14-8-29.
//  Copyright (c) 2014年 PSB. All rights reserved.
//

#import "PSBFirstViewController.h"
#import "PSBSecondViewController.h"

@interface PSBFirstViewController ()

@end

@implementation PSBFirstViewController

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
    self.view.backgroundColor = [UIColor redColor];
    
    //设置视图控制器的标题，标题可以显示在导航条或者分栏条上
    self.title = @"第一页";
    
    [self createButtons];
    [self customItem];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - button

//创建button
- (void)createButtons
{
    UIButton * button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    [button setTitle:@"下一页" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blackColor];
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [button release];
}

- (void)onClick:(UIButton *)button
{
    //推出第二页
    PSBSecondViewController * svc = [[PSBSecondViewController alloc] init];
    
    //如果当前视图控制器被添加到导航序列中，self.navigationController返回所在的nc，如果当前视图控制器没有添加到导航中，该属性为nil
    [self.navigationController pushViewController:svc animated:YES];
    
    //被推出的视图控制器会添加到导航序列中
    //fvc --- >  svc
    //添加到导航序列中，svc不会消失
    [svc release];
}


#pragma mark - 定制NavigationItem

- (void)customItem
{
    //设置NavigationItem标题
    //这个标题缺省使用self.title,如果设置了，会替换掉self.title.
    self.navigationItem.title = @"首页";
    
    
    
    //item.title字体无法修改
    //可以添加自定义titleView
    UISlider * slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
    //宽度会自适应导航条
    self.navigationItem.titleView = slider;
    [slider release];
    //【注】设置了titleView，title自然就不显示了。
    
    
    //设置左右BarButtonItem
    UIBarButtonItem * barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(onClick:)];
    self.navigationItem.rightBarButtonItem = barButtonItem;
    [barButtonItem release];
    
    //使用系统的barButton样式
//    UIBarButtonSystemItemDone,
    //【完成】 编辑结束，保存数据
//    UIBarButtonSystemItemCancel,
    //【取消】
//    UIBarButtonSystemItemEdit,
    //【编辑】
//    UIBarButtonSystemItemSave,
    //【存储】
//    UIBarButtonSystemItemAdd,
    //加号
//    UIBarButtonSystemItemFlexibleSpace
    //空间占位符
//    UIBarButtonSystemItemFixedSpace
    //空间占位符
//    UIBarButtonSystemItemCompose
    //新建
//    UIBarButtonSystemItemReply
    //回复
//    UIBarButtonSystemItemAction
    //打开其他应用程序
//    UIBarButtonSystemItemOrganize
    //保存到某路径
//    UIBarButtonSystemItemBookmarks
    //图书馆
//    UIBarButtonSystemItemSearch
    //放大镜，表示搜索
//    UIBarButtonSystemItemRefresh
    //刷新
//    UIBarButtonSystemItemStop
    //叉子
//    UIBarButtonSystemItemCamera
    //照相机 只用于引用照相机
//    UIBarButtonSystemItemTrash
    //删除
//    UIBarButtonSystemItemPlay
    //播放
//    UIBarButtonSystemItemPause
    //暂停
//    UIBarButtonSystemItemRewind
    //上一曲
//    UIBarButtonSystemItemFastForward
    //下一曲
//
//    UIBarButtonSystemItemUndo
    //取消操作
//    UIBarButtonSystemItemRedo
    //重复操作
//
//    UIBarButtonSystemItemPageCurl
    //翻页
    
    //使用文字创建barButtonItem
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithTitle:@"左键" style:UIBarButtonItemStyleDone target:nil action:nil] autorelease];
    
    //文字样式
    //平铺
//    UIBarButtonItemStylePlain,
    //加粗(没有明显区别)
//    UIBarButtonItemStyleBordered,
    //在iOS6以前是高亮，iOS7以后稍微加粗一点
//    UIBarButtonItemStyleDone,
    
    //【注】如果设置了leftBarButtonItem，默认的返回键就会不显示
    
    
    //创建image
    UIImage * image = [UIImage imageNamed:@"itemImage.png"];
    
    //设置image保留原色，iOS6以前，默认就显示原色，iOS7开始默认显示轮廓
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7){
        //设置图片保留原色
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    //重设rightBarButtonItem
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(onClick:)];
    //barButton设置图片，只能显示轮廓，即凡是非镂空处显示tintColor颜色
    
    //重设leftBarButtonItem
    self.navigationItem.leftBarButtonItem = [[[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"itemImage"] landscapeImagePhone:[UIImage imageNamed:@"itemImage2"] style:UIBarButtonItemStyleBordered target:nil action:nil] autorelease];
    //设置横纵屏两种图片

    
}

#pragma mark - 生命周期
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    //添加prompt（提示）
//    self.navigationItem.prompt = @"这是头一页";
//    //添加了这个，导航条会增加30的高度，变成74.
//}
//
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    self.navigationItem.prompt = nil;
//    //取消prompt，导航条恢复44高度
//}


@end






