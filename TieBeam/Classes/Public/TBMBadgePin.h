#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBMBadgePin : UIView

+ (instancetype)tbm_pinOnView:(UIView *)anchor text:(NSString *)text;

- (TBMBadgePin *)tbm_text:(NSString *)text;
- (TBMBadgePin *)tbm_font:(UIFont *)font;
- (TBMBadgePin *)tbm_fill:(UIColor *)color;
- (TBMBadgePin *)tbm_textColor:(UIColor *)color;
- (TBMBadgePin *)tbm_radius:(CGFloat)value;
- (TBMBadgePin *)tbm_borderColor:(UIColor *)color width:(CGFloat)width;
- (TBMBadgePin *)tbm_alpha:(CGFloat)value;
- (TBMBadgePin *)tbm_hidden:(BOOL)value;
- (TBMBadgePin *)tbm_clips:(BOOL)value;
- (TBMBadgePin *)tbm_userInteraction:(BOOL)value;
- (TBMBadgePin *)tbm_size:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
