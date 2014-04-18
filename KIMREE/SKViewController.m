//
//  SKViewController.m
//  SpriteKit
//
//  Created by Ray on 14-1-20.
//  Copyright (c) 2014年 CpSoft. All rights reserved.
//

#import "SKViewController.h"
#import "SKMainScene.h"

#import <QuartzCore/QuartzCore.h>

@implementation SKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    SKScene * scene = [SKMainScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
    
    UIImage *image = [UIImage imageNamed:@"BurstAircraftPause"];
    UIButton *button = [[UIButton alloc]init];
    [button setFrame:CGRectMake(10, 25, image.size.width,image.size.height)];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(gameOver) name:@"gameOverNotification" object:nil];
}

- (void)gameOver{
    
    UIView *backgroundView =  [[UIView alloc]initWithFrame:self.view.bounds];
    
    UIButton *button = [[UIButton alloc]init];
    [button setBounds:CGRectMake(0,0,200,30)];
    [button setCenter:backgroundView.center];
    [button setTitle:@"重新开始" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button.layer setBorderWidth:2.0];
    [button.layer setCornerRadius:15.0];
    [button.layer setBorderColor:[[UIColor grayColor] CGColor]];
    [button addTarget:self action:@selector(restart:) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:button];
    [backgroundView setCenter:self.view.center];
    
    
    UIButton *exitBtn = [[UIButton alloc]init];
    [exitBtn setBounds:CGRectMake(0,0,200,30)];
    
    if (IS_INCH4) {
        [exitBtn setCenter:CGPointMake(160, 280+50)];
    }else{
       [exitBtn setCenter:CGPointMake(160, 280)];
    
    }
    [exitBtn setTitle:@"退出游戏" forState:UIControlStateNormal];
    [exitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [exitBtn.layer setBorderWidth:2.0];
    [exitBtn.layer setCornerRadius:15.0];
    [exitBtn.layer setBorderColor:[[UIColor grayColor] CGColor]];
    [exitBtn addTarget:self action:@selector(exit:) forControlEvents:UIControlEventTouchUpInside];
    [backgroundView addSubview:exitBtn];
    [backgroundView setCenter:self.view.center];
    
    
    
    [self.view addSubview:backgroundView];
}




- (void)pause{
    
    ((SKView *)self.view).paused = YES;
    
    UIView *pauseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 200)];
    
    UIButton *button1 = [[UIButton alloc]init];
    [button1 setFrame:CGRectMake(CGRectGetWidth(self.view.frame) / 2 - 100,50,200,30)];
    [button1 setTitle:@"继续" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1.layer setBorderWidth:2.0];
    [button1.layer setCornerRadius:15.0];
    [button1.layer setBorderColor:[[UIColor grayColor] CGColor]];
    [button1 addTarget:self action:@selector(continueGame:) forControlEvents:UIControlEventTouchUpInside];
    [pauseView addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc]init];
    [button2 setFrame:CGRectMake(CGRectGetWidth(self.view.frame) / 2 - 100,100,200,30)];
    [button2 setTitle:@"重新开始" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2.layer setBorderWidth:2.0];
    [button2.layer setCornerRadius:15.0];
    [button2.layer setBorderColor:[[UIColor grayColor] CGColor]];
    [button2 addTarget:self action:@selector(restart:) forControlEvents:UIControlEventTouchUpInside];
    [pauseView addSubview:button2];
    
    
    UIButton *exitBtn = [[UIButton alloc]init];
    [exitBtn setBounds:CGRectMake(0,0,200,30)];
    
    if (IS_INCH4) {
        [exitBtn setCenter:CGPointMake(160, 120+50)];
    }else{
        [exitBtn setCenter:CGPointMake(160, 120)];
        
    }
    [exitBtn setTitle:@"退出游戏" forState:UIControlStateNormal];
    [exitBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [exitBtn.layer setBorderWidth:2.0];
    [exitBtn.layer setCornerRadius:15.0];
    [exitBtn.layer setBorderColor:[[UIColor grayColor] CGColor]];
    [exitBtn addTarget:self action:@selector(exit:) forControlEvents:UIControlEventTouchUpInside];
    [pauseView addSubview:exitBtn];
    
    pauseView.center = self.view.center;
    
    [self.view addSubview:pauseView];
    
}


- (void)exit:(UIButton *)button{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}




- (void)restart:(UIButton *)button{
    [button.superview removeFromSuperview];
    ((SKView *)self.view).paused = NO;
    [[NSNotificationCenter defaultCenter]postNotificationName:@"restartNotification" object:nil];
}

- (void)continueGame:(UIButton *)button{
    [button.superview removeFromSuperview];
    ((SKView *)self.view).paused = NO;
}


- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
