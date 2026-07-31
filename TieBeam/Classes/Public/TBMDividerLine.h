#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBMDividerLine : UIView

+ (instancetype)tbm_defaultLine NS_SWIFT_NAME(tbm_line());
+ (instancetype)tbm_lineColor:(UIColor *)color height:(CGFloat)height;

- (TBMDividerLine *)tbm_color:(UIColor *)color;
- (TBMDividerLine *)tbm_thickness:(CGFloat)height;
- (TBMDividerLine *)tbm_alpha:(CGFloat)value;
- (TBMDividerLine *)tbm_hidden:(BOOL)value;
- (TBMDividerLine *)tbm_addTo:(UIView *)parent;

@end

NS_ASSUME_NONNULL_END
