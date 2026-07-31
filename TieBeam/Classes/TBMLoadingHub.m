#import "TBMLoadingHub.h"
#import "TBMLabel.h"
#import "UIView+TBMPin.h"

static NSInteger const kTBMLoadingHubTag = 92001;

@implementation TBMLoadingHub

+ (instancetype)tbm_showInView:(UIView *)view text:(NSString *)text {
    [self tbm_hideFromView:view];
    TBMLoadingHub *hub = [[TBMLoadingHub alloc] initWithFrame:view.bounds];
    hub.tag = kTBMLoadingHubTag;
    hub.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [[hub tbm_style] tbm_bg:[[UIColor blackColor] colorWithAlphaComponent:0.12]];
    [view addSubview:hub];

    UIActivityIndicatorViewStyle style;
    if (@available(iOS 13.0, *)) {
        style = UIActivityIndicatorViewStyleLarge;
    } else {
        style = UIActivityIndicatorViewStyleWhiteLarge;
    }
    UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];
    spinner.translatesAutoresizingMaskIntoConstraints = NO;
    [spinner startAnimating];
    [hub addSubview:spinner];

    CGFloat labelOffset = text.length > 0 ? -12 : 0;
    [[spinner tbm_style] tbm_pinCenterIn:hub offsetY:labelOffset];

    if (text.length > 0) {
        TBMLabel *label = [TBMLabel tbm_make:^(TBMLabelChain *chain) {
            [[[[[chain tbm_text:text]
                tbm_color:[UIColor darkTextColor]]
                tbm_font:[UIFont systemFontOfSize:14]]
                tbm_align:NSTextAlignmentCenter]
                tbm_addTo:hub];
        }];
        [[[label tbm_style]
            tbm_pinBelow:spinner constant:12]
            tbm_pinCenterXIn:hub];
    }
    return hub;
}

+ (void)tbm_hideFromView:(UIView *)view {
    UIView *hub = [view viewWithTag:kTBMLoadingHubTag];
    [hub removeFromSuperview];
}

@end
