#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBMTextViewChain : NSObject

@property (nonatomic, weak, readonly) UITextView *tbm_textView;

- (TBMTextViewChain *)tbm_text:(NSString *)text;
- (TBMTextViewChain *)tbm_attributed:(NSAttributedString *)text;
- (TBMTextViewChain *)tbm_font:(UIFont *)font;
- (TBMTextViewChain *)tbm_color:(UIColor *)color;
- (TBMTextViewChain *)tbm_align:(NSTextAlignment)alignment;
- (TBMTextViewChain *)tbm_editable:(BOOL)value;
- (TBMTextViewChain *)tbm_selectable:(BOOL)value;
- (TBMTextViewChain *)tbm_scrollEnabled:(BOOL)value;
- (TBMTextViewChain *)tbm_insets:(UIEdgeInsets)insets;
- (TBMTextViewChain *)tbm_keyboard:(UIKeyboardType)type;
- (TBMTextViewChain *)tbm_autocapitalization:(UITextAutocapitalizationType)type;
- (TBMTextViewChain *)tbm_autocorrection:(UITextAutocorrectionType)type;
- (TBMTextViewChain *)tbm_delegate:(id<UITextViewDelegate>)delegate;
- (TBMTextViewChain *)tbm_focus:(BOOL)value;

- (TBMTextViewChain *)tbm_bg:(UIColor *)color;
- (TBMTextViewChain *)tbm_radius:(CGFloat)value;
- (TBMTextViewChain *)tbm_borderColor:(UIColor *)color width:(CGFloat)width;
- (TBMTextViewChain *)tbm_alpha:(CGFloat)value;
- (TBMTextViewChain *)tbm_hidden:(BOOL)value;
- (TBMTextViewChain *)tbm_clips:(BOOL)value;
- (TBMTextViewChain *)tbm_tag:(NSInteger)value;

- (TBMTextViewChain *)tbm_size:(CGSize)size;
- (TBMTextViewChain *)tbm_pinEdgesTo:(UIView *)parent inset:(UIEdgeInsets)insets;
- (TBMTextViewChain *)tbm_addTo:(UIView *)parent;

@end

@interface TBMTextView : UITextView

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMTextViewChain *chain))block;

@end

NS_ASSUME_NONNULL_END
