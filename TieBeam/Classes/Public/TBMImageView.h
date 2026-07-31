#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBMImageViewChain : NSObject

@property (nonatomic, weak, readonly) UIImageView *tbm_imageView;

- (TBMImageViewChain *)tbm_image:(UIImage *)image;
- (TBMImageViewChain *)tbm_highlightedImage:(UIImage *)image;
- (TBMImageViewChain *)tbm_highlighted:(BOOL)value;
- (TBMImageViewChain *)tbm_tint:(UIColor *)color;
- (TBMImageViewChain *)tbm_mode:(UIViewContentMode)mode;
- (TBMImageViewChain *)tbm_radius:(CGFloat)value;
- (TBMImageViewChain *)tbm_bg:(UIColor *)color;
- (TBMImageViewChain *)tbm_borderColor:(UIColor *)color width:(CGFloat)width;
- (TBMImageViewChain *)tbm_shadow:(UIColor *)color;
- (TBMImageViewChain *)tbm_alpha:(CGFloat)value;
- (TBMImageViewChain *)tbm_hidden:(BOOL)value;
- (TBMImageViewChain *)tbm_clips:(BOOL)value;
- (TBMImageViewChain *)tbm_userInteraction:(BOOL)value;
- (TBMImageViewChain *)tbm_tag:(NSInteger)value;

- (TBMImageViewChain *)tbm_size:(CGSize)size;
- (TBMImageViewChain *)tbm_pinEdgesTo:(UIView *)parent inset:(UIEdgeInsets)insets;
- (TBMImageViewChain *)tbm_pinCenterIn:(UIView *)parent;
- (TBMImageViewChain *)tbm_addTo:(UIView *)parent;

@end

@interface TBMImageView : UIImageView

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMImageViewChain *chain))block;

@end

NS_ASSUME_NONNULL_END
