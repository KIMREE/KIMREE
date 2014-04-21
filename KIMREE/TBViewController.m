//
//  TBViewController.m
//  KIMREE
//
//  Created by JIRUI on 14-4-14.
//  Copyright (c) 2014年 JIRUI. All rights reserved.
//

#import "TBViewController.h"
#import "PullingRefreshTableView.h"

@interface TBViewController ()<
PullingRefreshTableViewDelegate>

@property (retain,nonatomic) PullingRefreshTableView *mytableView;
@property (nonatomic) BOOL refreshing;

@end

@implementation TBViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"pic_background"]];
    
//    [self.tableView registerNib:[UINib nibWithNibName:@"TBCell" bundle:nil]forCellReuseIdentifier:@"TBCell"];
    
//    CGRect bounds = self.view.bounds;
//    bounds.size.height -= 44.f;
    CGRect bounds = CGRectMake(0, 28, self.view.bounds.size.width, self.view.bounds.size.height);
    _mytableView = [[PullingRefreshTableView alloc] initWithFrame:bounds pullingDelegate:self];
    self.tableView = _mytableView;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData{
    [self.mytableView tableViewDidFinishedLoading];
}

#pragma mark - PullingRefreshTableViewDelegate
- (void)pullingTableViewDidStartRefreshing:(PullingRefreshTableView *)tableView{
    self.refreshing = YES;
    [self performSelector:@selector(loadData) withObject:nil afterDelay:1.f];
}

- (NSDate *)pullingTableViewRefreshingFinishedDate{
    NSDateFormatter *df = [[NSDateFormatter alloc] init ];
    df.dateFormat = @"yyyy-MM-dd HH:mm";
    NSDate *date = [df dateFromString:@"2012-05-03 10:10"];
    return date;
}

- (void)pullingTableViewDidStartLoading:(PullingRefreshTableView *)tableView{
    [self performSelector:@selector(loadData) withObject:nil afterDelay:1.f];
}

#pragma mark - Scroll

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [self.mytableView tableViewDidScroll:scrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self.mytableView tableViewDidEndDragging:scrollView];
}


#pragma mark - Table view data source
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"你现在选择了第%i行", indexPath.row);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return 12;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        return 127;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TBCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil){
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"TBCell" owner:self options:nil];
        cell = (UITableViewCell *)[nibArray objectAtIndex:0];
    }

    // Configure the cell...
    return cell;
}



@end
