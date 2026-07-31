#import "UIView+TBMStyle.h"

NS_ASSUME_NONNULL_BEGIN

@interface TBMViewChain (TBMPin)

- (TBMViewChain *)tbm_pinCenterIn:(UIView *)parent;
- (TBMViewChain *)tbm_pinCenterIn:(UIView *)parent offsetY:(CGFloat)offsetY;
- (TBMViewChain *)tbm_pinTopInSafeArea:(UIView *)parent offset:(CGFloat)offset;
- (TBMViewChain *)tbm_pinBottomInSafeArea:(UIView *)parent offset:(CGFloat)offset;
- (TBMViewChain *)tbm_pinCenterInSafeArea:(UIView *)parent offsetY:(CGFloat)offsetY;
- (TBMViewChain *)tbm_pinEdgesTo:(UIView *)parent inset:(UIEdgeInsets)insets;
- (TBMViewChain *)tbm_pinSafeAreaTo:(UIView *)parent inset:(UIEdgeInsets)insets;
- (TBMViewChain *)tbm_pinBelow:(UIView *)anchor constant:(CGFloat)constant;
- (TBMViewChain *)tbm_pinCenterXIn:(UIView *)parent;
- (TBMViewChain *)tbm_pinTopTrailingOf:(UIView *)anchor top:(CGFloat)top trailing:(CGFloat)trailing;
- (TBMViewChain *)tbm_maxWidthIn:(UIView *)parent inset:(CGFloat)inset;
- (TBMViewChain *)tbm_minWidth:(CGFloat)width;
- (TBMViewChain *)tbm_minHeight:(CGFloat)height;
- (TBMViewChain *)tbm_height:(CGFloat)height;
- (TBMViewChain *)tbm_width:(CGFloat)width;
- (TBMViewChain *)tbm_size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
