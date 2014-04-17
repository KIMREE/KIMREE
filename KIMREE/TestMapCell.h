





#import <UIKit/UIKit.h>


#import <Foundation/Foundation.h>

@protocol TestMapCellDelegate <NSObject>

- (void)MapViewCellClicked;

@end

@interface TestMapCell : UIView

{
  id<TestMapCellDelegate> delegate;

}

@property(nonatomic, strong) id<TestMapCellDelegate> delegate;
@property (nonatomic,strong)IBOutlet UILabel *title;
@property (nonatomic,strong)IBOutlet UILabel *subtitle;
- (IBAction)display:(id)sender;


@end
