#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBMStackHub : UIStackView

+ (instancetype)tbm_vertical:(void (NS_NOESCAPE ^)(TBMStackHub *stack))block;
+ (instancetype)tbm_horizontal:(void (NS_NOESCAPE ^)(TBMStackHub *stack))block;

- (TBMStackHub *)tbm_axis:(UILayoutConstraintAxis)axis;
- (TBMStackHub *)tbm_spacing:(CGFloat)value;
- (TBMStackHub *)tbm_padding:(UIEdgeInsets)insets;
- (TBMStackHub *)tbm_alignment:(UIStackViewAlignment)value;
- (TBMStackHub *)tbm_distribution:(UIStackViewDistribution)value;
- (TBMStackHub *)tbm_baselineRelative:(BOOL)value;
- (TBMStackHub *)tbm_customSpacing:(CGFloat)spacing afterView:(UIView *)view API_AVAILABLE(ios(11.0));
- (TBMStackHub *)tbm_bg:(UIColor *)color;
- (TBMStackHub *)tbm_radius:(CGFloat)value;
- (TBMStackHub *)tbm_borderColor:(UIColor *)color width:(CGFloat)width;
- (TBMStackHub *)tbm_shadow:(UIColor *)color;
- (TBMStackHub *)tbm_alpha:(CGFloat)value;
- (TBMStackHub *)tbm_hidden:(BOOL)value;
- (TBMStackHub *)tbm_height:(CGFloat)value;
- (TBMStackHub *)tbm_clips:(BOOL)value;
- (TBMStackHub *)tbm_userInteraction:(BOOL)value;
- (TBMStackHub *)tbm_tag:(NSInteger)value;
- (TBMStackHub *)tbm_addTo:(UIView *)parent;
- (TBMStackHub *)tbm_arranged:(UIView *)view;
- (TBMStackHub *)tbm_views:(NSArray<UIView *> *)views;
- (TBMStackHub *)tbm_pinScrollContent:(UIScrollView *)scrollView;

@end

NS_ASSUME_NONNULL_END
