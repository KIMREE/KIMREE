//
//  NearbyViewController.m
//  KIMREE
//
//  Created by cool on 14-4-8.
//  Copyright (c) 2014年 cool. All rights reserved.
//

#import "NearbyViewController.h"
#import "MapView.h"
#import "Item.h"
#import "TestMapCell.h"

@interface NearbyViewController ()

@property (nonatomic,strong)MapView *mapView;
@property (nonatomic,strong)NSArray *annotations;

@end

@implementation NearbyViewController

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
    self.annotations = @[@{@"latitude":@"30.281843",
                           @"longitude":@"120.102193",
                           @"title":@"test-title-1",
                           @"subtitle":@"test-sub-title-11"},
                         @{@"latitude":@"30.290144",
                           @"longitude":@"120.146696‎",
                           @"title":@"test-title-2",
                           @"subtitle":@"test-sub-title-22"},
                         @{@"latitude":@"30.248076",
                           @"longitude":@"120.164162‎",
                           @"title":@"test-title-3",
                           @"subtitle":@"test-sub-title-33"},
                         @{@"latitude":@"30.425622",
                           @"longitude":@"120.299605",
                           @"title":@"test-title-4",
                           @"subtitle":@"test-sub-title-44"}
                         ];
    

	self.mapView = [[MapView alloc] initWithDelegate:self];
    [self.view addSubview:_mapView];
    [_mapView setFrame:self.view.bounds];
    [_mapView beginLoad];
    
    
    //增加工具栏按钮
    [self.navigationController  setToolbarHidden:YES animated:YES];
    
    //UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:nil];
    
    UIBarButtonItem *one = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    UIBarButtonItem *two = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:nil action:nil];
    UIBarButtonItem *three = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil];
    UIBarButtonItem *four = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:nil action:nil];
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    
    toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0, self.view.frame.size.height - toolBar.frame.size.height - 44.0, self.view.frame.size.width, 44.0)];
    [toolBar setBarStyle:UIBarStyleDefault];
    toolBar.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    
    [toolBar setItems:[NSArray arrayWithObjects:flexItem, one, flexItem, two, flexItem, three, flexItem, four, flexItem, nil] animated:YES];
    
    [self.view addSubview:toolBar];
    
    
    
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark -
#pragma mark delegate

- (NSInteger)numbersWithCalloutViewForMapView
{
    return _annotations.count;
}

- (CLLocationCoordinate2D)coordinateForMapViewWithIndex:(NSInteger)index
{
    Item *item = [[Item alloc] initWithDictionary:[_annotations objectAtIndex:index]];
    CLLocationCoordinate2D coordinate;
	coordinate.latitude = [item.latitude doubleValue];
	coordinate.longitude = [item.longitude doubleValue];
    return coordinate;
}

- (UIImage *)baseMKAnnotationViewImageWithIndex:(NSInteger)index
{
    return [UIImage imageNamed:@"pin"];
}

- (UIView *)mapViewCalloutContentViewWithIndex:(NSInteger)index
{
    Item *item = [[Item alloc] initWithDictionary:[_annotations objectAtIndex:index]];
    TestMapCell  *cell = [[[NSBundle mainBundle] loadNibNamed:@"TestMapCell" owner:self options:nil] objectAtIndex:0];
    cell.title.text = item.title;
    cell.subtitle.text = item.subtitle;
    return cell;
}

- (void)calloutViewDidSelectedWithIndex:(NSInteger)index
{
    NSLog(@"%@",[_annotations objectAtIndex:index]);
}

@end
