//
//  PostBarViewController.m
//  KIMREE
//
//  Created by JIRUI on 14-4-9.
//  Copyright (c) 2014年 JIRUI. All rights reserved.
//  、  

#import "PostBarViewController.h"

@interface PostBarViewController () {
    NSMutableArray *_testArray;
}

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation PostBarViewController
@synthesize tableView = _tableView;
- (void)viewDidLoad{
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 90;
    self.tableView.allowsSelection = NO; // We essentially implement our own selection
    self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0); // Makes the horizontal row seperator stretch the entire length of the table view
    _testArray = [[NSMutableArray alloc] init];
    
    // Add test data to our test array
    [_testArray addObject:S_POSTBAR_SELL];
    [_testArray addObject:S_POSTBAR_BUY];
    [_testArray addObject:S_POSTBAR_INVITE];
    [_testArray addObject:S_POSTBAR_MORE];
}

- (void)viewWillAppear:(BOOL)animated{
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _testArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"cell selected at index path %d", indexPath.row);
    HZWebViewController *webViewController = [HZWebViewController new];
    //    webViewController.mode = HZWebBrowserModeNavigation;
    webViewController.mode = HZWebBrowserModeModal;
    webViewController.URL = [NSURL URLWithString:@"http://192.168.1.168/~renchunyu/forum.php?mod=forumdisplay&fid=39"];
    [self presentViewController:webViewController animated:YES completion:^{}];
    switch (indexPath.row) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            
        default:
            break;
    }
  }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    JRTableViewCell *cell = (JRTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        NSMutableArray *leftUtilityButtons = [NSMutableArray new];
        NSMutableArray *rightUtilityButtons = [NSMutableArray new];
        
        [leftUtilityButtons addUtilityButtonWithColor:
         [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                 title:@"发帖"];
        [leftUtilityButtons addUtilityButtonWithColor:
         [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                 title:@"消息"];
        /*
        [leftUtilityButtons addUtilityButtonWithColor:
         [UIColor colorWithRed:1.0f green:0.231f blue:0.188f alpha:1.0]
                                                 icon:[UIImage imageNamed:@"cross.png"]];
        [leftUtilityButtons addUtilityButtonWithColor:
         [UIColor colorWithRed:0.55f green:0.27f blue:0.07f alpha:1.0]
                                                 icon:[UIImage imageNamed:@"list.png"]];

         */
        [rightUtilityButtons addUtilityButtonWithColor:
         [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                 title:@"消息"];
        [rightUtilityButtons addUtilityButtonWithColor:
         [UIColor colorWithRed:0.78f green:0.78f blue:0.8f alpha:1.0]
                                                 title:@"发帖"];
     /*
        [rightUtilityButtons addUtilityButtonWithColor:
         [UIColor colorWithRed:1.0f green:0.231f blue:0.188f alpha:1.0]
                                                  icon:[UIImage imageNamed:@"cross.png"]];
        [rightUtilityButtons addUtilityButtonWithColor:
         [UIColor colorWithRed:0.07 green:0.75f blue:0.16f alpha:1.0]
                                                  icon:[UIImage imageNamed:@"check.png"]];
      */
        cell = [[JRTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:cellIdentifier
                                  containingTableView:_tableView // Used for row height and selection
                                   leftUtilityButtons:leftUtilityButtons
                                  rightUtilityButtons:rightUtilityButtons];
        cell.delegate = self;
    }
    
//    NSDate *dateObject = _testArray[indexPath.row];
//    cell.textLabel.text = [dateObject description];
    //显示关注度和帖子数
//    cell.notePost.text = @"关注 999999  帖子 999999";
    cell.textLabel.text = _testArray[indexPath.row];
    switch (indexPath.row) {
        case 0:
            cell.detailTextLabel.text = @"指将企业经营所需的资源提供给企业中需要资源的部门的企业经营活动";
            break;
        case 1:
            cell.detailTextLabel.text = @"为您提供最新求购信息、买家信息,囊括了相关采购企业的采购计划、采购需求、采购产品等信息,是买家企业的权威数据库";
            break;
        case 2:
            cell.detailTextLabel.text = @"招揽商户，发包方将自己的服务、产品面向一定范围进行发布，以招募商户共同发展";
            break;
        case 3:
            cell.detailTextLabel.text = @"Some detail text";
        default:
            break;
    }
    return cell;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"scroll view did begin dragging");
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // Set background color of cell here if you don't want white
}

#pragma mark - SWTableViewDelegate
//从左往右滑
- (void)swippableTableViewCell:(JRTableViewCell *)cell didTriggerLeftUtilityButtonWithIndex:(NSInteger)index {
    NSIndexPath *cellIndexPath = [self.tableView indexPathForCell:cell];
    switch (cellIndexPath.row) {
        case 0:
            if (index) {
                HZWebViewController *webViewController = [HZWebViewController new];
                //    webViewController.mode = HZWebBrowserModeNavigation;
                webViewController.mode = HZWebBrowserModeModal;
                webViewController.URL = [NSURL URLWithString:@"http://192.168.1.168/~renchunyu/forum.php?mod=post&action=newthread&fid=39"];
                [self presentViewController:webViewController animated:YES completion:^{}];
             } else {
                 HZWebViewController *webViewController = [HZWebViewController new];
                 //    webViewController.mode = HZWebBrowserModeNavigation;
                 webViewController.mode = HZWebBrowserModeModal;
                 webViewController.URL = [NSURL URLWithString:@"http://192.168.1.168/~renchunyu/home.php?mod=space&do=pm"];
                 [self presentViewController:webViewController animated:YES completion:^{}];
            }
            break;
        case 1:
            if (index) {
                
             } else {
                 
            }
            break;
        case 2:
            if (index) {
                
             } else {
                
            }
            break;
        case 3:
            if (index) {
                
            } else {

            }
            break;
        default:
            break;
    }
    [cell hideUtilityButtonsAnimated:YES];
}

//从右往左滑
- (void)swippableTableViewCell:(JRTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    NSIndexPath *cellIndexPath = [self.tableView indexPathForCell:cell];
    switch (cellIndexPath.row) {
        case 0:
            if (index) {
                
            } else {
                
            }
            break;
        case 1:
            if (index) {
                
            } else {
                
            }
            break;
        case 2:
            if (index) {
                
            } else {
                
            }
            break;
        case 3:
            if (index) {
                
            } else {

            }
            break;
        default:
            break;
    }
    [cell hideUtilityButtonsAnimated:YES];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
        return YES;
}

@end
