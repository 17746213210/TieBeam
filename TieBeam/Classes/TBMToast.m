#import "TBMToast.h"
#import "TBMLabel.h"
#import "UIView+TBMPin.h"

static NSInteger const kTBMToastTag = 93001;

@implementation TBMToast

+ (void)tbm_showText:(NSString *)text inView:(UIView *)view {
    [self tbm_showText:text inView:view duration:2.0 position:TBMToastPositionBottom];
}

+ (void)tbm_showText:(NSString *)text inView:(UIView *)view duration:(NSTimeInterval)duration {
    [self tbm_showText:text inView:view duration:duration position:TBMToastPositionBottom];
}

+ (void)tbm_showText:(NSString *)text inView:(UIView *)view position:(TBMToastPosition)position {
    [self tbm_showText:text inView:view duration:2.0 position:position];
}

+ (void)tbm_showText:(NSString *)text inView:(UIView *)view duration:(NSTimeInterval)duration position:(TBMToastPosition)position {
    if (text.length == 0 || !view) {
        return;
    }

    UIView *existing = [view viewWithTag:kTBMToastTag];
    [existing removeFromSuperview];

    UIView *bubble = [[UIView alloc] initWithFrame:CGRectZero];
    bubble.tag = kTBMToastTag;
    bubble.translatesAutoresizingMaskIntoConstraints = NO;
    bubble.alpha = 0;
    [[[[bubble tbm_style]
        tbm_bg:[[UIColor blackColor] colorWithAlphaComponent:0.82]]
        tbm_radius:10]
        tbm_addTo:view];

    TBMLabel *label = [TBMLabel tbm_make:^(TBMLabelChain *chain) {
        [[[[[[chain tbm_text:text]
            tbm_color:UIColor.whiteColor]
            tbm_font:[UIFont systemFontOfSize:14 weight:UIFontWeightMedium]]
            tbm_align:NSTextAlignmentCenter]
            tbm_lines:0]
            tbm_addTo:bubble];
    }];
    [[label tbm_style]
        tbm_pinEdgesTo:bubble inset:UIEdgeInsetsMake(10, 16, 10, 16)];

    TBMViewChain *bubbleChain = [bubble tbm_style];
    [bubbleChain tbm_maxWidthIn:view inset:48];
    [bubbleChain tbm_minWidth:80];

    switch (position) {
        case TBMToastPositionTop:
            [bubbleChain tbm_pinTopInSafeArea:view offset:28];
            break;
        case TBMToastPositionCenter:
            [bubbleChain tbm_pinCenterInSafeArea:view offsetY:0];
            break;
        case TBMToastPositionBottom:
        default:
            [bubbleChain tbm_pinBottomInSafeArea:view offset:-28];
            break;
    }

    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        bubble.alpha = 1;
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.25 animations:^{
                bubble.alpha = 0;
            } completion:^(BOOL done) {
                [bubble removeFromSuperview];
            }];
        });
    }];
}

@end
