#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBMCardView : UIView

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMCardView *card))block;

- (TBMCardView *)tbm_fill:(UIColor *)color;
- (TBMCardView *)tbm_radius:(CGFloat)value;
- (TBMCardView *)tbm_padding:(CGFloat)value;
- (TBMCardView *)tbm_paddingInsets:(UIEdgeInsets)insets;
- (TBMCardView *)tbm_borderColor:(UIColor *)color width:(CGFloat)width;
- (TBMCardView *)tbm_shadow:(UIColor *)color;
- (TBMCardView *)tbm_alpha:(CGFloat)value;
- (TBMCardView *)tbm_hidden:(BOOL)value;
- (TBMCardView *)tbm_clips:(BOOL)value;
- (TBMCardView *)tbm_userInteraction:(BOOL)value;
- (TBMCardView *)tbm_tag:(NSInteger)value;
- (TBMCardView *)tbm_size:(CGSize)size;
- (TBMCardView *)tbm_pinEdgesTo:(UIView *)parent inset:(UIEdgeInsets)insets;
- (TBMCardView *)tbm_addTo:(UIView *)parent;
- (TBMCardView *)tbm_content:(UIView *)child;

@property (nonatomic, readonly) UIView *tbm_contentView;

@end

NS_ASSUME_NONNULL_END
