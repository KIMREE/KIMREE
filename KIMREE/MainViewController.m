//
//  MainViewController.m
//  KIMREE
//
//  Created by JIRUI on 14-4-7.
//  Copyright (c) 2014年 JIRUI. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "NearbyViewController.h"
#import "ProductViewController.h"
#import "KIMREEViewController.h"

@interface MainViewController ()
@property (strong, nonatomic) IBOutlet UIScrollView *funcScroller;
@property (strong, nonatomic) IBOutlet EScrollerView *newsView;

@end


@implementation MainViewController
@synthesize newsView = _newsView;
@synthesize funcScroller = _funcScroller;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        UIImage*img =[UIImage imageNamed:@"bg-body.jpg"];
        self.view.backgroundColor=[UIColor colorWithPatternImage:img];
    
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*
    NSLog(@"%f, %f, %f, %f ",_newsView.frame.origin.x, _newsView.frame.origin.y, _newsView.bounds.size.width, _newsView.bounds.size.height);
     */
    //设置新闻
    [self creatNews];
    

    
   
    
}

- (void)viewDidAppear:(BOOL)animated

{
    [super viewDidAppear:animated];
    
    //设置功能按钮偏移动画
    CGPoint bottomOffset = CGPointMake(self.funcScroller.contentOffset.x, self.funcScroller.contentSize.height - self.funcScroller.frame.size.height);
    _funcScroller.contentSize=CGSizeMake(_funcScroller.frame.size.width, S_SCREEN_SIZE.height-_newsView.frame.size.height-24);
    [self.funcScroller setContentOffset:bottomOffset animated:NO];
    CGPoint newOffset = self.funcScroller.contentOffset;
    newOffset.y = 20;
    if (S_SCREEN_SIZE.height > 480) {
        newOffset.y = -20;
    }
    _funcScroller.scrollEnabled = NO;
    [self.funcScroller setContentOffset:newOffset animated:YES];
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

//设置新闻栏
-(void)creatNews
{
    _newsView =[[EScrollerView alloc]
                    initWithFrameRect:CGRectMake(_newsView.frame.origin.x,
                                             _newsView.frame.origin.y,
                                             _newsView.frame.size.width,
                                             _newsView.frame.size.height)
                        ImageArray:[NSArray arrayWithObjects:@"01.jpg",@"02.jpg",@"03.jpg",nil]
                        TitleArray:[NSArray arrayWithObjects:@"这里没有新闻",@"谢谢",@"啦啦啦，你好啊，吉瑞。", nil]];
    _newsView.delegate = self;
    [self.view addSubview:_newsView];

}

//点击新闻图片触发的事件
#pragma EScrollerViewDelegate--
-(void)EScrollerViewDidClicked:(NSUInteger)index
{
    NSLog(@"你好，我是新闻 ：%d",index);
}
//功能菜单项
#pragma Methods you must add
// You need a method like this to setup your menu

- (IBAction)nearby:(id)sender {
    
    AppDelegate *delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    
    delegate.isRootView=NO;
    
    if (delegate.isRootView==NO) {
        self.navigationController.navigationBar.hidden = NO;
    }
   
    NearbyViewController *secondVC = [[NearbyViewController alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
    
}

- (IBAction)game:(id)sender {
}

- (IBAction)KIMREE:(id)sender {
    
    KIMREEViewController   *KIMREEView = [[KIMREEViewController alloc] init];
    [self.navigationController pushViewController:KIMREEView animated:YES];
}

- (IBAction)member:(id)sender {
}

- (IBAction)product:(id)sender {
    
    ProductViewController  *secondVC = [[ProductViewController  alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];}
@end
