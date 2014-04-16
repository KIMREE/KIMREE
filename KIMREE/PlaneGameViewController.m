//
//  PlaneGameViewController.m
//
//
//  Created by mac on 13-11-26.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "PlaneGameViewController.h"
#import "FirstScence.h"
@interface GameViewController ()

@end

@implementation PlaneGameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden=NO;
    self.title=@"游戏界面";
    SKView* view=[[SKView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor=[UIColor redColor];
    [self.view addSubview:view];
    
    FirstScence* fistScence=[FirstScence sceneWithSize:view.bounds.size];
    fistScence.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [view presentScene:fistScence];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
