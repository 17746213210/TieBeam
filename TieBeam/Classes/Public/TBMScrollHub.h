#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBMScrollHub : UIScrollView

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMScrollHub *scroll))block;

- (TBMScrollHub *)tbm_paging:(BOOL)value;
- (TBMScrollHub *)tbm_showsVerticalIndicator:(BOOL)value;
- (TBMScrollHub *)tbm_showsHorizontalIndicator:(BOOL)value;
- (TBMScrollHub *)tbm_bg:(UIColor *)color;
- (TBMScrollHub *)tbm_radius:(CGFloat)value;
- (TBMScrollHub *)tbm_alpha:(CGFloat)value;
- (TBMScrollHub *)tbm_hidden:(BOOL)value;
- (TBMScrollHub *)tbm_tag:(NSInteger)value;
- (TBMScrollHub *)tbm_pinEdgesTo:(UIView *)parent inset:(UIEdgeInsets)insets;
- (TBMScrollHub *)tbm_pinSafeAreaTo:(UIView *)parent inset:(UIEdgeInsets)insets;
- (TBMScrollHub *)tbm_addTo:(UIView *)parent;

@end

NS_ASSUME_NONNULL_END
