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
        
        productLabel=[[UILabel alloc] init];
        gameLabel=[[UILabel alloc] init];
        postbarLabel=[[UILabel alloc] init];
        kimreeLabel=[[UILabel alloc] init];
        nearbyLabel=[[UILabel alloc] init];
        memberLabel=[[UILabel alloc] init];
        
        productBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [productBtn setBackgroundImage:[UIImage imageNamed:@"blue_90.png"] forState:UIControlStateNormal];
        [productBtn addTarget:self action:@selector(product:) forControlEvents:UIControlEventTouchUpInside];
        productLabel.text=@"产品";
        productLabel.backgroundColor=[UIColor clearColor];
        productLabel.textColor=[UIColor whiteColor];
        productLabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        
        gameBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [gameBtn setBackgroundImage:[UIImage imageNamed:@"red_90.png"] forState:UIControlStateNormal];
        [gameBtn addTarget:self action:@selector(game:) forControlEvents:UIControlEventTouchUpInside];
        gameLabel.text=@"酷玩";
        gameLabel.backgroundColor=[UIColor clearColor];
        gameLabel.textColor=[UIColor whiteColor];
        gameLabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        
        postbarBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [postbarBtn setBackgroundImage:[UIImage imageNamed:@"yellow_90.png"] forState:UIControlStateNormal];
        [postbarBtn addTarget:self action:@selector(PostBar:) forControlEvents:UIControlEventTouchUpInside];
        postbarLabel.text=@"贴吧";
        postbarLabel.backgroundColor=[UIColor clearColor];
        postbarLabel.textColor=[UIColor whiteColor];
        postbarLabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        
        kimreeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [kimreeBtn setBackgroundImage:[UIImage imageNamed:@"ye90.png"] forState:UIControlStateNormal];
        [kimreeBtn addTarget:self action:@selector(KIMREE:) forControlEvents:UIControlEventTouchUpInside];
        kimreeLabel.text=@"KIMREE";
        kimreeLabel.backgroundColor=[UIColor clearColor];
        kimreeLabel.textColor=[UIColor whiteColor];
        kimreeLabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        
        nearbyBtn= [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [nearbyBtn setBackgroundImage:[UIImage imageNamed:@"green_90.png"] forState:UIControlStateNormal];
        [nearbyBtn addTarget:self action:@selector(nearby:) forControlEvents:UIControlEventTouchUpInside];
        nearbyLabel.text=@"附近";
        nearbyLabel.backgroundColor=[UIColor clearColor];
        nearbyLabel.textColor=[UIColor whiteColor];
        nearbyLabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        memberBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [memberBtn setBackgroundImage:[UIImage imageNamed:@"gray_90.png"] forState:UIControlStateNormal];
        [memberBtn addTarget:self action:@selector(member:) forControlEvents:UIControlEventTouchUpInside];
        memberLabel.text=@"会员";
        memberLabel.backgroundColor=[UIColor clearColor];
        memberLabel.textColor=[UIColor whiteColor];
        memberLabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        if (IOS7) {
            //the first row
            productBtn.frame = CGRectMake(INCH4_LEFT_BTN_X, INCH4_FIRST_ROW_BTN_Y, INCH4_BTN_W, INCH4_BTN_H);
            productLabel.frame=CGRectMake(INCH4_LEFT_BTN_X, INCH4_FIRST_ROW_BTN_Y+INCH4_BTN_H+10, INCH4_BTN_W, LABEL_H);
            
            gameBtn.frame = CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W, INCH4_FIRST_ROW_BTN_Y, INCH4_BTN_W, INCH4_BTN_H);
            gameLabel.frame=CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W, INCH4_FIRST_ROW_BTN_Y+INCH4_BTN_H+10, INCH4_BTN_W, LABEL_H);
            
            //the secend row
            postbarBtn.frame = CGRectMake(INCH4_LEFT_BTN_X, INCH4_FIRST_ROW_BTN_Y+INCH4_BTN_H+INCH4_BTN_INTERVAL, INCH4_BTN_W, INCH4_BTN_H);
            postbarLabel.frame=CGRectMake(INCH4_LEFT_BTN_X, INCH4_FIRST_ROW_BTN_Y+2*INCH4_BTN_H+INCH4_BTN_INTERVAL+10, INCH4_BTN_W, LABEL_H);
            
            kimreeBtn.frame = CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W, INCH4_FIRST_ROW_BTN_Y+INCH4_BTN_H+INCH4_BTN_INTERVAL, INCH4_BTN_W, INCH4_BTN_H);
            kimreeLabel.frame=CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W, INCH4_FIRST_ROW_BTN_Y+2*INCH4_BTN_H+INCH4_BTN_INTERVAL+10, INCH4_BTN_W, LABEL_H);
            //the third row
            nearbyBtn.frame = CGRectMake(INCH4_LEFT_BTN_X,INCH4_FIRST_ROW_BTN_Y+2*(INCH4_BTN_H+INCH4_BTN_INTERVAL), INCH4_BTN_W, INCH4_BTN_H);
            nearbyLabel.frame=CGRectMake(INCH4_LEFT_BTN_X, INCH4_FIRST_ROW_BTN_Y+3*INCH4_BTN_H+2*INCH4_BTN_INTERVAL+10, INCH4_BTN_W, LABEL_H);
            
            memberBtn.frame = CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W, INCH4_FIRST_ROW_BTN_Y+2*(INCH4_BTN_H+INCH4_BTN_INTERVAL), INCH4_BTN_W, INCH4_BTN_H);
            memberLabel.frame=CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W,  INCH4_FIRST_ROW_BTN_Y+3*INCH4_BTN_H+2*INCH4_BTN_INTERVAL+10, INCH4_BTN_W, LABEL_H);
            
        }else {
            //the first row
            productBtn.frame = CGRectMake(INCH4_LEFT_BTN_X, INCH4_FIRST_ROW_BTN_Y-STATUS_BAR, INCH4_BTN_W, INCH4_BTN_H);
            productLabel.frame=CGRectMake(INCH4_LEFT_BTN_X, INCH4_FIRST_ROW_BTN_Y+INCH4_BTN_H+10-STATUS_BAR, INCH4_BTN_W, LABEL_H);
            
            gameBtn.frame = CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W, INCH4_FIRST_ROW_BTN_Y-STATUS_BAR, INCH4_BTN_W, INCH4_BTN_H);
            gameLabel.frame=CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W, INCH4_FIRST_ROW_BTN_Y+INCH4_BTN_H+10-STATUS_BAR, INCH4_BTN_W, LABEL_H);
            
            //the secend row
            postbarBtn.frame = CGRectMake(INCH4_LEFT_BTN_X, INCH4_FIRST_ROW_BTN_Y+INCH4_BTN_H+INCH4_BTN_INTERVAL-STATUS_BAR, INCH4_BTN_W, INCH4_BTN_H);
            postbarLabel.frame=CGRectMake(INCH4_LEFT_BTN_X, INCH4_FIRST_ROW_BTN_Y+2*INCH4_BTN_H+INCH4_BTN_INTERVAL+10-STATUS_BAR, INCH4_BTN_W, LABEL_H);
            
            kimreeBtn.frame = CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W, INCH4_FIRST_ROW_BTN_Y+INCH4_BTN_H+INCH4_BTN_INTERVAL-STATUS_BAR, INCH4_BTN_W, INCH4_BTN_H);
            kimreeLabel.frame=CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W, INCH4_FIRST_ROW_BTN_Y+2*INCH4_BTN_H+INCH4_BTN_INTERVAL+10-STATUS_BAR, INCH4_BTN_W, LABEL_H);
            //the third row
            nearbyBtn.frame = CGRectMake(INCH4_LEFT_BTN_X,INCH4_FIRST_ROW_BTN_Y+2*(INCH4_BTN_H+INCH4_BTN_INTERVAL)-STATUS_BAR, INCH4_BTN_W, INCH4_BTN_H);
            nearbyLabel.frame=CGRectMake(INCH4_LEFT_BTN_X, INCH4_FIRST_ROW_BTN_Y+3*INCH4_BTN_H+2*INCH4_BTN_INTERVAL+10-STATUS_BAR, INCH4_BTN_W, LABEL_H);
            
            memberBtn.frame = CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W, INCH4_FIRST_ROW_BTN_Y+2*(INCH4_BTN_H+INCH4_BTN_INTERVAL)-STATUS_BAR, INCH4_BTN_W, INCH4_BTN_H);
            memberLabel.frame=CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W,  INCH4_FIRST_ROW_BTN_Y+3*INCH4_BTN_H+2*INCH4_BTN_INTERVAL+10-STATUS_BAR, INCH4_BTN_W, LABEL_H);
        }
        
        
        [self.view addSubview:productLabel];
        [self.view addSubview:productBtn];
        [self.view addSubview:gameLabel];
        [self.view addSubview:gameBtn];
        [self.view addSubview:postbarLabel];
        [self.view addSubview:postbarBtn];
        [self.view addSubview:kimreeLabel];
        [self.view addSubview:kimreeBtn];
        [self.view addSubview:nearbyLabel];
        [self.view addSubview:nearbyBtn];
        [self.view addSubview:memberLabel];
        [self.view addSubview:memberBtn];
    }
    
    //fit 3.5inch
    
    else{
        productLabel=[[UILabel alloc] init];
        gameLabel=[[UILabel alloc] init];
        postbarLabel=[[UILabel alloc] init];
        kimreeLabel=[[UILabel alloc] init];
        nearbyLabel=[[UILabel alloc] init];
        memberLabel=[[UILabel alloc] init];
        
        productBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [productBtn setBackgroundImage:[UIImage imageNamed:@"blue_90.png"] forState:UIControlStateNormal];
        [productBtn addTarget:self action:@selector(product:) forControlEvents:UIControlEventTouchUpInside];
        productLabel.text=@"产品";
        productLabel.font = [UIFont systemFontOfSize:16];
        productLabel.backgroundColor=[UIColor clearColor];
        productLabel.textColor=[UIColor whiteColor];
        productLabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        
        gameBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [gameBtn setBackgroundImage:[UIImage imageNamed:@"red_90.png"] forState:UIControlStateNormal];
        [gameBtn addTarget:self action:@selector(game:) forControlEvents:UIControlEventTouchUpInside];
        gameLabel.text=@"酷玩";
        gameLabel.font = [UIFont systemFontOfSize:16];
        gameLabel.backgroundColor=[UIColor clearColor];
        gameLabel.textColor=[UIColor whiteColor];
        gameLabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        
        postbarBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [postbarBtn setBackgroundImage:[UIImage imageNamed:@"yellow_90.png"] forState:UIControlStateNormal];
        [postbarBtn addTarget:self action:@selector(PostBar:) forControlEvents:UIControlEventTouchUpInside];
        postbarLabel.text=@"贴吧";
        postbarLabel.font = [UIFont systemFontOfSize:16];
        postbarLabel.backgroundColor=[UIColor clearColor];
        postbarLabel.textColor=[UIColor whiteColor];
        postbarLabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        
        kimreeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [kimreeBtn setBackgroundImage:[UIImage imageNamed:@"ye90.png"] forState:UIControlStateNormal];
        [kimreeBtn addTarget:self action:@selector(KIMREE:) forControlEvents:UIControlEventTouchUpInside];
        kimreeLabel.text=@"KIMREE";
        kimreeLabel.font = [UIFont systemFontOfSize:16];
        kimreeLabel.backgroundColor=[UIColor clearColor];
        kimreeLabel.textColor=[UIColor whiteColor];
        kimreeLabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        
        nearbyBtn= [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [nearbyBtn setBackgroundImage:[UIImage imageNamed:@"green_90.png"] forState:UIControlStateNormal];
        [nearbyBtn addTarget:self action:@selector(nearby:) forControlEvents:UIControlEventTouchUpInside];
        nearbyLabel.text=@"附近";
        nearbyLabel.font = [UIFont systemFontOfSize:16];
        nearbyLabel.backgroundColor=[UIColor clearColor];
        nearbyLabel.textColor=[UIColor whiteColor];
        nearbyLabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        memberBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [memberBtn setBackgroundImage:[UIImage imageNamed:@"gray_90.png"] forState:UIControlStateNormal];
        [memberBtn addTarget:self action:@selector(member:) forControlEvents:UIControlEventTouchUpInside];
        memberLabel.text=@"会员";
        memberLabel.font = [UIFont systemFontOfSize:16];
        memberLabel.backgroundColor=[UIColor clearColor];
        memberLabel.textColor=[UIColor whiteColor];
        memberLabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        
        
        if (IOS7) {
            
       //the first row
        productBtn.frame = CGRectMake(INCH35_LEFT_BTN_X, INCH35_FIRST_ROW_BTN_Y, INCH35_BTN_W, INCH35_BTN_H);
        productLabel.frame=CGRectMake(INCH35_LEFT_BTN_X, INCH35_FIRST_ROW_BTN_Y+INCH35_BTN_H+4, INCH35_BTN_W, LABEL_H);
        
        gameBtn.frame = CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W, INCH35_FIRST_ROW_BTN_Y, INCH35_BTN_W, INCH35_BTN_H);
        gameLabel.frame=CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W, INCH35_FIRST_ROW_BTN_Y+INCH35_BTN_H+4, INCH35_BTN_W, LABEL_H);
        
        //the secend row
        postbarBtn.frame = CGRectMake(INCH35_LEFT_BTN_X, INCH35_FIRST_ROW_BTN_Y+INCH35_BTN_H+INCH35_BTN_INTERVAL, INCH35_BTN_W, INCH35_BTN_H);
        postbarLabel.frame=CGRectMake(INCH35_LEFT_BTN_X, INCH35_FIRST_ROW_BTN_Y+2*INCH35_BTN_H+INCH35_BTN_INTERVAL+4, INCH35_BTN_W, LABEL_H);
        
        kimreeBtn.frame = CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W, INCH35_FIRST_ROW_BTN_Y+INCH35_BTN_H+INCH35_BTN_INTERVAL, INCH35_BTN_W, INCH35_BTN_H);
        kimreeLabel.frame=CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W, INCH35_FIRST_ROW_BTN_Y+2*INCH35_BTN_H+INCH35_BTN_INTERVAL+4, INCH35_BTN_W, LABEL_H);
        //the third row
        nearbyBtn.frame = CGRectMake(INCH35_LEFT_BTN_X,INCH35_FIRST_ROW_BTN_Y+2*(INCH35_BTN_H+INCH35_BTN_INTERVAL), INCH35_BTN_W, INCH35_BTN_H);
        nearbyLabel.frame=CGRectMake(INCH35_LEFT_BTN_X, INCH35_FIRST_ROW_BTN_Y+3*INCH35_BTN_H+2*INCH35_BTN_INTERVAL+4, INCH35_BTN_W, LABEL_H);
        
        memberBtn.frame = CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W, INCH35_FIRST_ROW_BTN_Y+2*(INCH35_BTN_H+INCH35_BTN_INTERVAL), INCH35_BTN_W, INCH35_BTN_H);
        memberLabel.frame=CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W,  INCH35_FIRST_ROW_BTN_Y+3*INCH35_BTN_H+2*INCH35_BTN_INTERVAL+4, INCH35_BTN_W, LABEL_H);
        
    }
    else
    
    {
     //the first row
        productBtn.frame = CGRectMake(INCH35_LEFT_BTN_X, INCH35_FIRST_ROW_BTN_Y-STATUS_BAR, INCH35_BTN_W, INCH35_BTN_H);
        productLabel.frame=CGRectMake(INCH35_LEFT_BTN_X, INCH35_FIRST_ROW_BTN_Y+INCH35_BTN_H+4-STATUS_BAR, INCH35_BTN_W, LABEL_H);
        
        gameBtn.frame = CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W, INCH35_FIRST_ROW_BTN_Y-STATUS_BAR, INCH35_BTN_W, INCH35_BTN_H);
        gameLabel.frame=CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W, INCH35_FIRST_ROW_BTN_Y+INCH35_BTN_H+4-STATUS_BAR, INCH35_BTN_W, LABEL_H);
        
        //the secend row
        postbarBtn.frame = CGRectMake(INCH35_LEFT_BTN_X, INCH35_FIRST_ROW_BTN_Y+INCH35_BTN_H+INCH35_BTN_INTERVAL-STATUS_BAR, INCH35_BTN_W, INCH35_BTN_H);
        postbarLabel.frame=CGRectMake(INCH35_LEFT_BTN_X, INCH35_FIRST_ROW_BTN_Y+2*INCH35_BTN_H+INCH35_BTN_INTERVAL+4-STATUS_BAR, INCH35_BTN_W, LABEL_H);
        
        kimreeBtn.frame = CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W, INCH35_FIRST_ROW_BTN_Y+INCH35_BTN_H+INCH35_BTN_INTERVAL-STATUS_BAR, INCH35_BTN_W, INCH35_BTN_H);
        kimreeLabel.frame=CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W, INCH35_FIRST_ROW_BTN_Y+2*INCH35_BTN_H+INCH35_BTN_INTERVAL+4-STATUS_BAR, INCH35_BTN_W, LABEL_H);
        //the third row
        nearbyBtn.frame = CGRectMake(INCH35_LEFT_BTN_X,INCH35_FIRST_ROW_BTN_Y+2*(INCH35_BTN_H+INCH35_BTN_INTERVAL)-STATUS_BAR, INCH35_BTN_W, INCH35_BTN_H);
        nearbyLabel.frame=CGRectMake(INCH35_LEFT_BTN_X, INCH35_FIRST_ROW_BTN_Y+3*INCH35_BTN_H+2*INCH35_BTN_INTERVAL+4-STATUS_BAR, INCH35_BTN_W, LABEL_H);
        
        memberBtn.frame = CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W, INCH35_FIRST_ROW_BTN_Y+2*(INCH35_BTN_H+INCH35_BTN_INTERVAL)-STATUS_BAR, INCH35_BTN_W, INCH35_BTN_H);
        memberLabel.frame=CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W,  INCH35_FIRST_ROW_BTN_Y+3*INCH35_BTN_H+2*INCH35_BTN_INTERVAL+4-STATUS_BAR, INCH35_BTN_W, LABEL_H);
    }
 
    [self.view addSubview:productLabel];
    [self.view addSubview:productBtn];
    [self.view addSubview:gameLabel];
    [self.view addSubview:gameBtn];
    [self.view addSubview:postbarLabel];
    [self.view addSubview:postbarBtn];
    [self.view addSubview:kimreeLabel];
    [self.view addSubview:kimreeBtn];
    [self.view addSubview:nearbyLabel];
    [self.view addSubview:nearbyBtn];
    [self.view addSubview:memberLabel];
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
    
    self.navigationController.navigationBar.hidden = NO;
    MemberViewController *memberView = [[MemberViewController alloc] init];
    [self.navigationController pushViewController:memberView animated:YES];
    
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
