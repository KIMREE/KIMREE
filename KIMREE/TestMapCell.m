



#import "TestMapCell.h"
#import "AppDelegate.h"

@implementation TestMapCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    
    }
    return self;
}



- (IBAction)display:(id)sender {
    
     UIApplication *app =[UIApplication sharedApplication];
    AppDelegate *app2 = app.delegate;
    //app2.window.rootViewController = self;
     DisplayViewController  *displayView = [[DisplayViewController alloc] init] ;
    app2.window.rootViewController = displayView;

}

@end
