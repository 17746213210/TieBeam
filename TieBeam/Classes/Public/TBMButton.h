#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBMButtonChain : NSObject

@property (nonatomic, weak, readonly) UIButton *tbm_button;

- (TBMButtonChain *)tbm_title:(NSString *)title;
- (TBMButtonChain *)tbm_titleColor:(UIColor *)color;
- (TBMButtonChain *)tbm_selectedTitle:(NSString *)title;
- (TBMButtonChain *)tbm_selectedTitleColor:(UIColor *)color;
- (TBMButtonChain *)tbm_highlightedTitle:(NSString *)title;
- (TBMButtonChain *)tbm_highlightedTitleColor:(UIColor *)color;
- (TBMButtonChain *)tbm_disabledTitle:(NSString *)title;
- (TBMButtonChain *)tbm_disabledTitleColor:(UIColor *)color;
- (TBMButtonChain *)tbm_font:(UIFont *)font;
- (TBMButtonChain *)tbm_image:(UIImage *)image;
- (TBMButtonChain *)tbm_selectedImage:(UIImage *)image;
- (TBMButtonChain *)tbm_highlightedImage:(UIImage *)image;
- (TBMButtonChain *)tbm_disabledImage:(UIImage *)image;
- (TBMButtonChain *)tbm_bg:(UIColor *)color;
- (TBMButtonChain *)tbm_selectedBg:(UIColor *)color;
- (TBMButtonChain *)tbm_highlightedBg:(UIColor *)color;
- (TBMButtonChain *)tbm_disabledBg:(UIColor *)color;
- (TBMButtonChain *)tbm_radius:(CGFloat)value;
- (TBMButtonChain *)tbm_borderColor:(UIColor *)color width:(CGFloat)width;
- (TBMButtonChain *)tbm_shadow:(UIColor *)color;
- (TBMButtonChain *)tbm_alpha:(CGFloat)value;
- (TBMButtonChain *)tbm_hidden:(BOOL)value;
- (TBMButtonChain *)tbm_clips:(BOOL)value;
- (TBMButtonChain *)tbm_userInteraction:(BOOL)value;
- (TBMButtonChain *)tbm_tag:(NSInteger)value;
- (TBMButtonChain *)tbm_tint:(UIColor *)color;
- (TBMButtonChain *)tbm_enabled:(BOOL)value;
- (TBMButtonChain *)tbm_selected:(BOOL)value;
- (TBMButtonChain *)tbm_contentInset:(UIEdgeInsets)insets;
- (TBMButtonChain *)tbm_imageInset:(UIEdgeInsets)insets;
- (TBMButtonChain *)tbm_titleInset:(UIEdgeInsets)insets;

- (TBMButtonChain *)tbm_size:(CGSize)size;
- (TBMButtonChain *)tbm_pinEdgesTo:(UIView *)parent inset:(UIEdgeInsets)insets;
- (TBMButtonChain *)tbm_pinCenterIn:(UIView *)parent;
- (TBMButtonChain *)tbm_action:(id)target selector:(SEL)selector;
- (TBMButtonChain *)tbm_actionBlock:(void (^)(void))block;
- (TBMButtonChain *)tbm_addTo:(UIView *)parent;

@end

@interface TBMButton : UIButton

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMButtonChain *chain))block;

@end

NS_ASSUME_NONNULL_END
