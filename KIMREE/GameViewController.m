//
//  GameViewController.m
//  KIMREE
//
//  Created by renchunyu on 14-4-15.
//  Copyright (c) 2014年 renchunyu. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController
@synthesize list=_list;

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
    // Do any additional setup after loading the view from its nib.
    NSArray *array = [[NSArray alloc] initWithObjects:@"打飞机", @"跑酷",
                      @"极品飞车", @"愤怒小鸟", @"植物大战僵尸", @"2048", @"糖果传奇",
                      @"我叫MT" , nil];
    self.list = array;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.list = nil;
    
}

#pragma mark -
#pragma mark Table View Data Source Methods
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [self.list count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *TableSampleIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             TableSampleIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleValue1
                reuseIdentifier:TableSampleIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [self.list objectAtIndex:row];
    UIImage *image = [UIImage imageNamed:@"pin"];
    cell.imageView.image = image;
    UIImage *highLighedImage = [UIImage imageNamed:@"youdao"];
    cell.imageView.highlightedImage = highLighedImage;
    cell.detailTextLabel.text = @"美女，玩哪个";
	return cell;
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *rowString = [self.list objectAtIndex:[indexPath row]];
    
    if ([rowString isEqualToString:@"打飞机"]) {
        
        PlaneGameViewController *planeVC = [[PlaneGameViewController alloc]init];
        
        [self.navigationController pushViewController:planeVC animated:YES];
        
    }else if([rowString isEqualToString:@"2048"]){
        
         self.navigationController.navigationBar.hidden = NO;
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@ "Main" bundle: nil ];
       [ self .navigationController pushViewController:storyboard.instantiateInitialViewController animated: YES ];
        
    }else{
    
   UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"选中的行信息" message:rowString delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alter show];
    }
}




@end
