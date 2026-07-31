#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBMLoadingHub : UIView

+ (instancetype)tbm_showInView:(UIView *)view text:(nullable NSString *)text;
+ (void)tbm_hideFromView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
