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


    //设置新闻
    [self creatNews];

    
    
    if (IS_IPHONE5) {
        
        productlabel=[[UILabel alloc] init];
        gamelabel=[[UILabel alloc] init];
        postbarlabel=[[UILabel alloc] init];
        kimreelabel=[[UILabel alloc] init];
        nearbylabel=[[UILabel alloc] init];
        memberlabel=[[UILabel alloc] init];
        
    productBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [productBtn setBackgroundImage:[UIImage imageNamed:@"blue_90.png"] forState:UIControlStateNormal];
        [productBtn addTarget:self action:@selector(product:) forControlEvents:UIControlEventTouchUpInside];
        productlabel.text=@"产品";
        productlabel.backgroundColor=[UIColor clearColor];
        productlabel.textColor=[UIColor whiteColor];
        productlabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        
        gameBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [gameBtn setBackgroundImage:[UIImage imageNamed:@"red_90.png"] forState:UIControlStateNormal];
        [gameBtn addTarget:self action:@selector(game:) forControlEvents:UIControlEventTouchUpInside];
        gamelabel.text=@"酷玩";
        gamelabel.backgroundColor=[UIColor clearColor];
        gamelabel.textColor=[UIColor whiteColor];
        gamelabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        
        postbarBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [postbarBtn setBackgroundImage:[UIImage imageNamed:@"yellow_90.png"] forState:UIControlStateNormal];
        [postbarBtn addTarget:self action:@selector(PostBar:) forControlEvents:UIControlEventTouchUpInside];
        postbarlabel.text=@"贴吧";
        postbarlabel.backgroundColor=[UIColor clearColor];
        postbarlabel.textColor=[UIColor whiteColor];
        postbarlabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        
        kimreeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [kimreeBtn setBackgroundImage:[UIImage imageNamed:@"ye90.png"] forState:UIControlStateNormal];
        [kimreeBtn addTarget:self action:@selector(KIMREE:) forControlEvents:UIControlEventTouchUpInside];
        kimreelabel.text=@"KIMREE";
        kimreelabel.backgroundColor=[UIColor clearColor];
        kimreelabel.textColor=[UIColor whiteColor];
        kimreelabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        
        nearbyBtn= [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [nearbyBtn setBackgroundImage:[UIImage imageNamed:@"green_90.png"] forState:UIControlStateNormal];
        [nearbyBtn addTarget:self action:@selector(nearby:) forControlEvents:UIControlEventTouchUpInside];
        nearbylabel.text=@"附近";
        nearbylabel.backgroundColor=[UIColor clearColor];
        nearbylabel.textColor=[UIColor whiteColor];
        nearbylabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        memberBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [memberBtn setBackgroundImage:[UIImage imageNamed:@"gray_90.png"] forState:UIControlStateNormal];
        [memberBtn addTarget:self action:@selector(member:) forControlEvents:UIControlEventTouchUpInside];
        memberlabel.text=@"会员";
        memberlabel.backgroundColor=[UIColor clearColor];
        memberlabel.textColor=[UIColor whiteColor];
        memberlabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        if (IOS7) {
            //the first row
            productBtn.frame = CGRectMake(INCH4_LEFT_BTN_X, INCH4_FIRST_ROW_BTN_Y, INCH4_BTN_W, INCH4_BTN_H);
            productlabel.frame=CGRectMake(INCH4_LEFT_BTN_X, INCH4_FIRST_ROW_BTN_Y+INCH4_BTN_H+10, INCH4_BTN_W, LABEL_H);
            
            gameBtn.frame = CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W, INCH4_FIRST_ROW_BTN_Y, INCH4_BTN_W, INCH4_BTN_H);
            gamelabel.frame=CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W, INCH4_FIRST_ROW_BTN_Y+INCH4_BTN_H+10, INCH4_BTN_W, LABEL_H);
            
            //the secend row
            postbarBtn.frame = CGRectMake(INCH4_LEFT_BTN_X, INCH4_FIRST_ROW_BTN_Y+INCH4_BTN_H+INCH4_BTN_INTERVAL, INCH4_BTN_W, INCH4_BTN_H);
            postbarlabel.frame=CGRectMake(INCH4_LEFT_BTN_X, INCH4_FIRST_ROW_BTN_Y+2*INCH4_BTN_H+INCH4_BTN_INTERVAL+10, INCH4_BTN_W, LABEL_H);
            
            kimreeBtn.frame = CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W, INCH4_FIRST_ROW_BTN_Y+INCH4_BTN_H+INCH4_BTN_INTERVAL, INCH4_BTN_W, INCH4_BTN_H);
            kimreelabel.frame=CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W, INCH4_FIRST_ROW_BTN_Y+2*INCH4_BTN_H+INCH4_BTN_INTERVAL+10, INCH4_BTN_W, LABEL_H);
            //the third row
            nearbyBtn.frame = CGRectMake(INCH4_LEFT_BTN_X,INCH4_FIRST_ROW_BTN_Y+2*(INCH4_BTN_H+INCH4_BTN_INTERVAL), INCH4_BTN_W, INCH4_BTN_H);
            nearbylabel.frame=CGRectMake(INCH4_LEFT_BTN_X, INCH4_FIRST_ROW_BTN_Y+3*INCH4_BTN_H+2*INCH4_BTN_INTERVAL+10, INCH4_BTN_W, LABEL_H);
            
            memberBtn.frame = CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W, INCH4_FIRST_ROW_BTN_Y+2*(INCH4_BTN_H+INCH4_BTN_INTERVAL), INCH4_BTN_W, INCH4_BTN_H);
            memberlabel.frame=CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W,  INCH4_FIRST_ROW_BTN_Y+3*INCH4_BTN_H+2*INCH4_BTN_INTERVAL+10, INCH4_BTN_W, LABEL_H);
            
        }else {
            //the first row
            productBtn.frame = CGRectMake(INCH4_LEFT_BTN_X, INCH4_FIRST_ROW_BTN_Y-STATUS_BAR, INCH4_BTN_W, INCH4_BTN_H);
            productlabel.frame=CGRectMake(INCH4_LEFT_BTN_X, INCH4_FIRST_ROW_BTN_Y+INCH4_BTN_H+10-STATUS_BAR, INCH4_BTN_W, LABEL_H);
            
            gameBtn.frame = CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W, INCH4_FIRST_ROW_BTN_Y-STATUS_BAR, INCH4_BTN_W, INCH4_BTN_H);
            gamelabel.frame=CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W, INCH4_FIRST_ROW_BTN_Y+INCH4_BTN_H+10-STATUS_BAR, INCH4_BTN_W, LABEL_H);
            
            //the secend row
            postbarBtn.frame = CGRectMake(INCH4_LEFT_BTN_X, INCH4_FIRST_ROW_BTN_Y+INCH4_BTN_H+INCH4_BTN_INTERVAL-STATUS_BAR, INCH4_BTN_W, INCH4_BTN_H);
            postbarlabel.frame=CGRectMake(INCH4_LEFT_BTN_X, INCH4_FIRST_ROW_BTN_Y+2*INCH4_BTN_H+INCH4_BTN_INTERVAL+10-STATUS_BAR, INCH4_BTN_W, LABEL_H);
            
            kimreeBtn.frame = CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W, INCH4_FIRST_ROW_BTN_Y+INCH4_BTN_H+INCH4_BTN_INTERVAL-STATUS_BAR, INCH4_BTN_W, INCH4_BTN_H);
            kimreelabel.frame=CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W, INCH4_FIRST_ROW_BTN_Y+2*INCH4_BTN_H+INCH4_BTN_INTERVAL+10-STATUS_BAR, INCH4_BTN_W, LABEL_H);
            //the third row
            nearbyBtn.frame = CGRectMake(INCH4_LEFT_BTN_X,INCH4_FIRST_ROW_BTN_Y+2*(INCH4_BTN_H+INCH4_BTN_INTERVAL)-STATUS_BAR, INCH4_BTN_W, INCH4_BTN_H);
            nearbylabel.frame=CGRectMake(INCH4_LEFT_BTN_X, INCH4_FIRST_ROW_BTN_Y+3*INCH4_BTN_H+2*INCH4_BTN_INTERVAL+10-STATUS_BAR, INCH4_BTN_W, LABEL_H);
            
            memberBtn.frame = CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W, INCH4_FIRST_ROW_BTN_Y+2*(INCH4_BTN_H+INCH4_BTN_INTERVAL)-STATUS_BAR, INCH4_BTN_W, INCH4_BTN_H);
            memberlabel.frame=CGRectMake(kScreen_Width-INCH4_LEFT_BTN_X-INCH4_BTN_W,  INCH4_FIRST_ROW_BTN_Y+3*INCH4_BTN_H+2*INCH4_BTN_INTERVAL+10-STATUS_BAR, INCH4_BTN_W, LABEL_H);
        }
        
        
        [self.view addSubview:productlabel];
        [self.view addSubview:productBtn];
        [self.view addSubview:gamelabel];
        [self.view addSubview:gameBtn];
        [self.view addSubview:postbarlabel];
        [self.view addSubview:postbarBtn];
        [self.view addSubview:kimreelabel];
        [self.view addSubview:kimreeBtn];
        [self.view addSubview:nearbylabel];
        [self.view addSubview:nearbyBtn];
        [self.view addSubview:memberlabel];
        [self.view addSubview:memberBtn];
    }
    
    //fit 3.5inch
    
    else{
        productlabel=[[UILabel alloc] init];
        gamelabel=[[UILabel alloc] init];
        postbarlabel=[[UILabel alloc] init];
        kimreelabel=[[UILabel alloc] init];
        nearbylabel=[[UILabel alloc] init];
        memberlabel=[[UILabel alloc] init];
        
        productBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [productBtn setBackgroundImage:[UIImage imageNamed:@"blue_90.png"] forState:UIControlStateNormal];
        [productBtn addTarget:self action:@selector(product:) forControlEvents:UIControlEventTouchUpInside];
        productlabel.text=@"产品";
        productlabel.font = [UIFont systemFontOfSize:16];
        productlabel.backgroundColor=[UIColor clearColor];
        productlabel.textColor=[UIColor whiteColor];
        productlabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        
        gameBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [gameBtn setBackgroundImage:[UIImage imageNamed:@"red_90.png"] forState:UIControlStateNormal];
        [gameBtn addTarget:self action:@selector(game:) forControlEvents:UIControlEventTouchUpInside];
        gamelabel.text=@"酷玩";
        gamelabel.font = [UIFont systemFontOfSize:16];
        gamelabel.backgroundColor=[UIColor clearColor];
        gamelabel.textColor=[UIColor whiteColor];
        gamelabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        
        postbarBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [postbarBtn setBackgroundImage:[UIImage imageNamed:@"yellow_90.png"] forState:UIControlStateNormal];
        [postbarBtn addTarget:self action:@selector(PostBar:) forControlEvents:UIControlEventTouchUpInside];
        postbarlabel.text=@"贴吧";
        postbarlabel.font = [UIFont systemFontOfSize:16];
        postbarlabel.backgroundColor=[UIColor clearColor];
        postbarlabel.textColor=[UIColor whiteColor];
        postbarlabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        
        kimreeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [kimreeBtn setBackgroundImage:[UIImage imageNamed:@"ye90.png"] forState:UIControlStateNormal];
        [kimreeBtn addTarget:self action:@selector(KIMREE:) forControlEvents:UIControlEventTouchUpInside];
        kimreelabel.text=@"KIMREE";
        kimreelabel.font = [UIFont systemFontOfSize:16];
        kimreelabel.backgroundColor=[UIColor clearColor];
        kimreelabel.textColor=[UIColor whiteColor];
        kimreelabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        
        nearbyBtn= [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [nearbyBtn setBackgroundImage:[UIImage imageNamed:@"green_90.png"] forState:UIControlStateNormal];
        [nearbyBtn addTarget:self action:@selector(nearby:) forControlEvents:UIControlEventTouchUpInside];
        nearbylabel.text=@"附近";
        nearbylabel.font = [UIFont systemFontOfSize:16];
        nearbylabel.backgroundColor=[UIColor clearColor];
        nearbylabel.textColor=[UIColor whiteColor];
        nearbylabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        memberBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [memberBtn setBackgroundImage:[UIImage imageNamed:@"gray_90.png"] forState:UIControlStateNormal];
        [memberBtn addTarget:self action:@selector(member:) forControlEvents:UIControlEventTouchUpInside];
        memberlabel.text=@"会员";
        memberlabel.font = [UIFont systemFontOfSize:16];
        memberlabel.backgroundColor=[UIColor clearColor];
        memberlabel.textColor=[UIColor whiteColor];
        memberlabel.textAlignment=UIBaselineAdjustmentAlignCenters;
        
        
        
        
        if (IOS7) {
            
       //the first row
        productBtn.frame = CGRectMake(INCH35_LEFT_BTN_X, INCH35_FIRST_ROW_BTN_Y, INCH35_BTN_W, INCH35_BTN_H);
        productlabel.frame=CGRectMake(INCH35_LEFT_BTN_X, INCH35_FIRST_ROW_BTN_Y+INCH35_BTN_H+4, INCH35_BTN_W, LABEL_H);
        
        gameBtn.frame = CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W, INCH35_FIRST_ROW_BTN_Y, INCH35_BTN_W, INCH35_BTN_H);
        gamelabel.frame=CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W, INCH35_FIRST_ROW_BTN_Y+INCH35_BTN_H+4, INCH35_BTN_W, LABEL_H);
        
        //the secend row
        postbarBtn.frame = CGRectMake(INCH35_LEFT_BTN_X, INCH35_FIRST_ROW_BTN_Y+INCH35_BTN_H+INCH35_BTN_INTERVAL, INCH35_BTN_W, INCH35_BTN_H);
        postbarlabel.frame=CGRectMake(INCH35_LEFT_BTN_X, INCH35_FIRST_ROW_BTN_Y+2*INCH35_BTN_H+INCH35_BTN_INTERVAL+4, INCH35_BTN_W, LABEL_H);
        
        kimreeBtn.frame = CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W, INCH35_FIRST_ROW_BTN_Y+INCH35_BTN_H+INCH35_BTN_INTERVAL, INCH35_BTN_W, INCH35_BTN_H);
        kimreelabel.frame=CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W, INCH35_FIRST_ROW_BTN_Y+2*INCH35_BTN_H+INCH35_BTN_INTERVAL+4, INCH35_BTN_W, LABEL_H);
        //the third row
        nearbyBtn.frame = CGRectMake(INCH35_LEFT_BTN_X,INCH35_FIRST_ROW_BTN_Y+2*(INCH35_BTN_H+INCH35_BTN_INTERVAL), INCH35_BTN_W, INCH35_BTN_H);
        nearbylabel.frame=CGRectMake(INCH35_LEFT_BTN_X, INCH35_FIRST_ROW_BTN_Y+3*INCH35_BTN_H+2*INCH35_BTN_INTERVAL+4, INCH35_BTN_W, LABEL_H);
        
        memberBtn.frame = CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W, INCH35_FIRST_ROW_BTN_Y+2*(INCH35_BTN_H+INCH35_BTN_INTERVAL), INCH35_BTN_W, INCH35_BTN_H);
        memberlabel.frame=CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W,  INCH35_FIRST_ROW_BTN_Y+3*INCH35_BTN_H+2*INCH35_BTN_INTERVAL+4, INCH35_BTN_W, LABEL_H);
        
    }
    else
    
    {
     //the first row
        productBtn.frame = CGRectMake(INCH35_LEFT_BTN_X, INCH35_FIRST_ROW_BTN_Y-STATUS_BAR, INCH35_BTN_W, INCH35_BTN_H);
        productlabel.frame=CGRectMake(INCH35_LEFT_BTN_X, INCH35_FIRST_ROW_BTN_Y+INCH35_BTN_H+4-STATUS_BAR, INCH35_BTN_W, LABEL_H);
        
        gameBtn.frame = CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W, INCH35_FIRST_ROW_BTN_Y-STATUS_BAR, INCH35_BTN_W, INCH35_BTN_H);
        gamelabel.frame=CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W, INCH35_FIRST_ROW_BTN_Y+INCH35_BTN_H+4-STATUS_BAR, INCH35_BTN_W, LABEL_H);
        
        //the secend row
        postbarBtn.frame = CGRectMake(INCH35_LEFT_BTN_X, INCH35_FIRST_ROW_BTN_Y+INCH35_BTN_H+INCH35_BTN_INTERVAL-STATUS_BAR, INCH35_BTN_W, INCH35_BTN_H);
        postbarlabel.frame=CGRectMake(INCH35_LEFT_BTN_X, INCH35_FIRST_ROW_BTN_Y+2*INCH35_BTN_H+INCH35_BTN_INTERVAL+4-STATUS_BAR, INCH35_BTN_W, LABEL_H);
        
        kimreeBtn.frame = CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W, INCH35_FIRST_ROW_BTN_Y+INCH35_BTN_H+INCH35_BTN_INTERVAL-STATUS_BAR, INCH35_BTN_W, INCH35_BTN_H);
        kimreelabel.frame=CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W, INCH35_FIRST_ROW_BTN_Y+2*INCH35_BTN_H+INCH35_BTN_INTERVAL+4-STATUS_BAR, INCH35_BTN_W, LABEL_H);
        //the third row
        nearbyBtn.frame = CGRectMake(INCH35_LEFT_BTN_X,INCH35_FIRST_ROW_BTN_Y+2*(INCH35_BTN_H+INCH35_BTN_INTERVAL)-STATUS_BAR, INCH35_BTN_W, INCH35_BTN_H);
        nearbylabel.frame=CGRectMake(INCH35_LEFT_BTN_X, INCH35_FIRST_ROW_BTN_Y+3*INCH35_BTN_H+2*INCH35_BTN_INTERVAL+4-STATUS_BAR, INCH35_BTN_W, LABEL_H);
        
        memberBtn.frame = CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W, INCH35_FIRST_ROW_BTN_Y+2*(INCH35_BTN_H+INCH35_BTN_INTERVAL)-STATUS_BAR, INCH35_BTN_W, INCH35_BTN_H);
        memberlabel.frame=CGRectMake(kScreen_Width-INCH35_LEFT_BTN_X-INCH35_BTN_W,  INCH35_FIRST_ROW_BTN_Y+3*INCH35_BTN_H+2*INCH35_BTN_INTERVAL+4-STATUS_BAR, INCH35_BTN_W, LABEL_H);
    }
 
    [self.view addSubview:productlabel];
    [self.view addSubview:productBtn];
    [self.view addSubview:gamelabel];
    [self.view addSubview:gameBtn];
    [self.view addSubview:postbarlabel];
    [self.view addSubview:postbarBtn];
    [self.view addSubview:kimreelabel];
    [self.view addSubview:kimreeBtn];
    [self.view addSubview:nearbylabel];
    [self.view addSubview:nearbyBtn];
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



    [self.navigationController setNavigationBarHidden:YES animated:YES];
    //设置功能按钮偏移动画
    if (_funcScroller.scrollEnabled) {
        CGPoint bottomOffset = CGPointMake(self.funcScroller.contentOffset.x, self.funcScroller.contentSize.height - self.funcScroller.frame.size.height);
        _funcScroller.contentSize=CGSizeMake(_funcScroller.frame.size.width, S_SCREEN_SIZE.height-_newsView.frame.size.height-24);
        [self.funcScroller setContentOffset:bottomOffset animated:NO];
        CGPoint newOffset = self.funcScroller.contentOffset;
        newOffset.y = 20;
        if (S_SCREEN_SIZE.height > 480){
            newOffset.y = -20;
        }
        _funcScroller.scrollEnabled = NO;
        [self.funcScroller setContentOffset:newOffset animated:YES];
    }



   
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
    NSLog(@"你好，我是新闻 ：%i",index);
}


//功能菜单项
#pragma Methods you must add
//贴吧
- (IBAction)PostBar:(id)sender
{
    UIViewController *PostBar = [[UIViewController alloc]init];
    [self.navigationController pushViewController:PostBar animated:NO];
    [self.navigationController setNavigationBarHidden:NO animated:YES];

    
}

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


- (IBAction)product:(id)sender {
    self.navigationController.navigationBar.hidden = NO;
    ProductViewController  *secondVC = [[ProductViewController  alloc] init];
    [self.navigationController pushViewController:secondVC animated:YES];
}
@end
