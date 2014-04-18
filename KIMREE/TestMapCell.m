



#import "TestMapCell.h"
#import "AppDelegate.h"

@implementation TestMapCell

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
 
    }
    return self;
}



- (IBAction)display:(id)sender {
    

    
    if ([delegate respondsToSelector:@selector(MapViewCellClicked)]) {
        
        [delegate MapViewCellClicked];
    
  }

  
    
}

@end
