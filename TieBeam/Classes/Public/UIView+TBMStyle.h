#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBMViewChain : NSObject

@property (nonatomic, weak, readonly) UIView *tbm_view;

- (TBMViewChain *)tbm_bg:(UIColor *)color;
- (TBMViewChain *)tbm_radius:(CGFloat)value;
- (TBMViewChain *)tbm_borderColor:(UIColor *)color width:(CGFloat)width;
- (TBMViewChain *)tbm_shadow:(UIColor *)color;
- (TBMViewChain *)tbm_alpha:(CGFloat)value;
- (TBMViewChain *)tbm_hidden:(BOOL)value;
- (TBMViewChain *)tbm_clips:(BOOL)value;
- (TBMViewChain *)tbm_userInteraction:(BOOL)value;
- (TBMViewChain *)tbm_tag:(NSInteger)value;
- (TBMViewChain *)tbm_tint:(UIColor *)color;
- (TBMViewChain *)tbm_contentMode:(UIViewContentMode)mode;
- (TBMViewChain *)tbm_exclusiveTouch:(BOOL)value;
- (TBMViewChain *)tbm_addTo:(UIView *)parent;

@end

@interface UIView (TBMStyle)

- (TBMViewChain *)tbm_style;

@end

NS_ASSUME_NONNULL_END
