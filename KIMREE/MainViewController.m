//
//  MainViewController.m
//  KIMREE
//
//  Created by JIRUI on 14-4-7.
//  Copyright (c) 2014年 JIRUI. All rights reserved.
//


#import "MainViewController.h"


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
    
    //设置新闻
    [self creatNews];

    /*
     NSLog(@"%f, %f, %f, %f ",_newsView.frame.origin.x, _newsView.frame.origin.y, _newsView.bounds.size.width, _newsView.bounds.size.height);
     */
    CGPoint bottomOffset = CGPointMake(self.funcScroller.contentOffset.x, self.funcScroller.contentSize.height - self.funcScroller.frame.size.height);
    
    [self.funcScroller setContentOffset:bottomOffset animated:NO];
    
  
    
    if (IS_IPHONE5) {
        
        
        UIButton *productBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        productBtn.frame = CGRectMake(50.0, 200.0, 80.0, 80.0);
        [productBtn setBackgroundImage:[UIImage imageNamed:@"blue_90.png"] forState:UIControlStateNormal];
        [productBtn addTarget:self action:@selector(product:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *productlabel=[[UILabel alloc] initWithFrame:CGRectMake(55.0, 290.0, 70.0, 15.0)];
        productlabel.text=@"产品";
        productlabel.textColor=[UIColor whiteColor];
        productlabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        [self.view addSubview:productlabel];
        [self.view addSubview:productBtn];
        
        
        UIButton *gameBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        gameBtn.frame = CGRectMake(190.0, 200.0, 80.0, 80.0);
        [gameBtn setBackgroundImage:[UIImage imageNamed:@"red_90.png"] forState:UIControlStateNormal];
        [gameBtn addTarget:self action:@selector(game:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *gamelabel=[[UILabel alloc] initWithFrame:CGRectMake(195.0, 290.0, 70.0, 15.0)];
        gamelabel.text=@"酷玩";
        gamelabel.textColor=[UIColor whiteColor];
        gamelabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        [self.view addSubview:gamelabel];
        [self.view addSubview:gameBtn];
        
        
        UIButton *postbarBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        postbarBtn.frame = CGRectMake(50.0, 320.0, 80.0, 80.0);
        [postbarBtn setBackgroundImage:[UIImage imageNamed:@"yellow_90.png"] forState:UIControlStateNormal];
        [postbarBtn addTarget:self action:@selector(PostBar:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *postbarlabel=[[UILabel alloc] initWithFrame:CGRectMake(55.0, 410, 70.0, 15.0)];
        postbarlabel.text=@"贴吧";
        postbarlabel.textColor=[UIColor whiteColor];
        postbarlabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        [self.view addSubview:postbarlabel];
        [self.view addSubview:postbarBtn];
        
        
        UIButton *kimreeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        kimreeBtn.frame = CGRectMake(190.0, 320.0, 80.0, 80.0);
        [kimreeBtn setBackgroundImage:[UIImage imageNamed:@"ye90.png"] forState:UIControlStateNormal];
        [kimreeBtn addTarget:self action:@selector(KIMREE:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *kimreelabel=[[UILabel alloc] initWithFrame:CGRectMake(195.0, 410.0, 70.0, 15.0)];
        kimreelabel.text=@"KIMREE";
        kimreelabel.textColor=[UIColor whiteColor];
        kimreelabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        [self.view addSubview:kimreelabel];
        [self.view addSubview:kimreeBtn];
        
        
        UIButton *nearbyBtn= [UIButton buttonWithType:UIButtonTypeRoundedRect];
        nearbyBtn.frame = CGRectMake(50.0, 440.0, 80.0, 80.0);
        [nearbyBtn setBackgroundImage:[UIImage imageNamed:@"green_90.png"] forState:UIControlStateNormal];
        [nearbyBtn addTarget:self action:@selector(nearby:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *nearbylabel=[[UILabel alloc] initWithFrame:CGRectMake(55.0, 530.0, 70.0, 15.0)];
        nearbylabel.text=@"附近";
        nearbylabel.textColor=[UIColor whiteColor];
        nearbylabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        [self.view addSubview:nearbylabel];
        [self.view addSubview:nearbyBtn];
        
        UIButton *memberBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        memberBtn.frame = CGRectMake(190.0, 440.0, 80.0, 80);
        [memberBtn setBackgroundImage:[UIImage imageNamed:@"gray_90.png"] forState:UIControlStateNormal];
        [memberBtn addTarget:self action:@selector(member:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *memberlabel=[[UILabel alloc] initWithFrame:CGRectMake(195.0, 530, 70.0, 15.0)];
        memberlabel.text=@"会员";
        memberlabel.textColor=[UIColor whiteColor];
        memberlabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        [self.view addSubview:memberlabel];
        [self.view addSubview:memberBtn];
    }
    
    //fit 3.5inch
    
    else{
        
        UIButton *productBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        productBtn.frame = CGRectMake(55.0, 183.0, 75.0, 75.0);
        [productBtn setBackgroundImage:[UIImage imageNamed:@"blue_90.png"] forState:UIControlStateNormal];
        [productBtn addTarget:self action:@selector(product:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *productlabel=[[UILabel alloc] initWithFrame:CGRectMake(60.0, 262.0, 70.0, 15.0)];
        productlabel.text=@"产品";
        productlabel.font = [UIFont systemFontOfSize:16];
        productlabel.backgroundColor=[UIColor clearColor];
        productlabel.textColor=[UIColor whiteColor];
        productlabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        [self.view addSubview:productlabel];
        [self.view addSubview:productBtn];
        
        
        UIButton *gameBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        gameBtn.frame = CGRectMake(190.0, 183.0, 75.0, 75.0);
        [gameBtn setBackgroundImage:[UIImage imageNamed:@"red_90.png"] forState:UIControlStateNormal];
        [gameBtn addTarget:self action:@selector(game:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *gamelabel=[[UILabel alloc] initWithFrame:CGRectMake(195.0, 262.0, 70.0, 15.0)];
        gamelabel.text=@"酷玩";
        gamelabel.font = [UIFont systemFontOfSize:16];
        gamelabel.backgroundColor=[UIColor clearColor];
        gamelabel.textColor=[UIColor whiteColor];
        gamelabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        [self.view addSubview:gamelabel];
        [self.view addSubview:gameBtn];
        
        
        UIButton *postbarBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        postbarBtn.frame = CGRectMake(55.0, 282.0, 75.0, 75.0);
        [postbarBtn setBackgroundImage:[UIImage imageNamed:@"yellow_90.png"] forState:UIControlStateNormal];
        [postbarBtn addTarget:self action:@selector(PostBar:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *postbarlabel=[[UILabel alloc] initWithFrame:CGRectMake(60.0, 361.0, 70.0, 15.0)];
        postbarlabel.text=@"贴吧";
        postbarlabel.font = [UIFont systemFontOfSize:16];
        postbarlabel.backgroundColor=[UIColor clearColor];
        postbarlabel.textColor=[UIColor whiteColor];
        postbarlabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        [self.view addSubview:postbarlabel];
        [self.view addSubview:postbarBtn];
        
        
        UIButton *kimreeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        kimreeBtn.frame = CGRectMake(190.0, 282.0, 75.0, 75.0);
        [kimreeBtn setBackgroundImage:[UIImage imageNamed:@"ye90.png"] forState:UIControlStateNormal];
        [kimreeBtn addTarget:self action:@selector(KIMREE:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *kimreelabel=[[UILabel alloc] initWithFrame:CGRectMake(195.0, 361.0, 70.0, 15.0)];
        kimreelabel.text=@"KIMREE";
        kimreelabel.font = [UIFont systemFontOfSize:16];
        kimreelabel.backgroundColor=[UIColor clearColor];
        kimreelabel.textColor=[UIColor whiteColor];
        kimreelabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        [self.view addSubview:kimreelabel];
        [self.view addSubview:kimreeBtn];
        
        
        UIButton *nearbyBtn= [UIButton buttonWithType:UIButtonTypeRoundedRect];
        nearbyBtn.frame = CGRectMake(55.0, 379.0, 75.0, 75.0);
        [nearbyBtn setBackgroundImage:[UIImage imageNamed:@"green_90.png"] forState:UIControlStateNormal];
        [nearbyBtn addTarget:self action:@selector(nearby:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *nearbylabel=[[UILabel alloc] initWithFrame:CGRectMake(60.0, 458.0, 70.0, 15.0)];
        nearbylabel.text=@"附近";
        nearbylabel.font = [UIFont systemFontOfSize:16];
        nearbylabel.backgroundColor=[UIColor clearColor];
        nearbylabel.textColor=[UIColor whiteColor];
        nearbylabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        [self.view addSubview:nearbylabel];
        [self.view addSubview:nearbyBtn];
        
        UIButton *memberBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        memberBtn.frame = CGRectMake(190.0, 379.0, 75.0, 75.0);
        [memberBtn setBackgroundImage:[UIImage imageNamed:@"gray_90.png"] forState:UIControlStateNormal];
        [memberBtn addTarget:self action:@selector(member:) forControlEvents:UIControlEventTouchUpInside];
        UILabel *memberlabel=[[UILabel alloc] initWithFrame:CGRectMake(195.0, 458.0, 70.0, 15.0)];
        memberlabel.text=@"会员";
        memberlabel.font = [UIFont systemFontOfSize:16];
        memberlabel.backgroundColor=[UIColor clearColor];
        memberlabel.textColor=[UIColor whiteColor];
        memberlabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        [self.view addSubview:memberlabel];
        [self.view addSubview:memberBtn];
    }
    
    
}



- (void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidAppear:(BOOL)animated

{
    [super viewDidAppear:animated];
    
    
    //设置功能按钮偏移动画
    if (_funcScroller.scrollEnabled) {
        CGPoint newOffset = self.funcScroller.contentOffset;
        newOffset.y = 0;
        [self.funcScroller setContentOffset:newOffset animated:YES];
        _funcScroller.scrollEnabled = NO;
        
    }
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
    
    self.navigationController.navigationBar.hidden = NO;
    tabBarController = [[TabBarController alloc]init];
    [self.navigationController pushViewController:tabBarController animated:YES];
}

- (IBAction)game:(id)sender {
    self.navigationController.navigationBar.hidden = NO;
    GameViewController *gameView = [[GameViewController alloc] init];
    [self.navigationController pushViewController:gameView animated:YES];
    
}

- (IBAction)KIMREE:(id)sender {
    
    self.navigationController.navigationBar.hidden = NO;
    KIMREEViewController   *KIMREEView = [[KIMREEViewController alloc] init];
    [self.navigationController pushViewController:KIMREEView animated:YES];
}

- (IBAction)member:(id)sender {
}

- (IBAction)PostBar:(id)sender {
    PostBarViewController *postBar = [[PostBarViewController alloc]init];
    postBar.view.backgroundColor = [UIColor grayColor];
    [self.navigationController pushViewController:postBar animated:YES];
    
}

- (IBAction)product:(id)sender {
    self.navigationController.navigationBar.hidden = NO;
    ProductViewController  *secondVC = [[ProductViewController  alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}
@end
