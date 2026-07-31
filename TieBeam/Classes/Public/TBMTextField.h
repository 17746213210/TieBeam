#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBMTextFieldChain : NSObject

@property (nonatomic, weak, readonly) UITextField *tbm_field;

- (TBMTextFieldChain *)tbm_text:(NSString *)text;
- (TBMTextFieldChain *)tbm_placeholder:(NSString *)text;
- (TBMTextFieldChain *)tbm_placeholderColor:(UIColor *)color;
- (TBMTextFieldChain *)tbm_font:(UIFont *)font;
- (TBMTextFieldChain *)tbm_color:(UIColor *)color;
- (TBMTextFieldChain *)tbm_align:(NSTextAlignment)alignment;
- (TBMTextFieldChain *)tbm_keyboard:(UIKeyboardType)type;
- (TBMTextFieldChain *)tbm_returnKey:(UIReturnKeyType)type;
- (TBMTextFieldChain *)tbm_borderStyle:(UITextBorderStyle)style;
- (TBMTextFieldChain *)tbm_secure:(BOOL)value;
- (TBMTextFieldChain *)tbm_clearButton:(UITextFieldViewMode)mode;
- (TBMTextFieldChain *)tbm_autocapitalization:(UITextAutocapitalizationType)type;
- (TBMTextFieldChain *)tbm_autocorrection:(UITextAutocorrectionType)type;
- (TBMTextFieldChain *)tbm_spellChecking:(UITextSpellCheckingType)type;
- (TBMTextFieldChain *)tbm_enablesReturnKey:(BOOL)value;
- (TBMTextFieldChain *)tbm_clearsOnBeginEditing:(BOOL)value;
- (TBMTextFieldChain *)tbm_clearsOnInsertion:(BOOL)value;
- (TBMTextFieldChain *)tbm_delegate:(id<UITextFieldDelegate>)delegate;
- (TBMTextFieldChain *)tbm_leftView:(nullable UIView *)view mode:(UITextFieldViewMode)mode;
- (TBMTextFieldChain *)tbm_rightView:(nullable UIView *)view mode:(UITextFieldViewMode)mode;
- (TBMTextFieldChain *)tbm_inputView:(nullable UIView *)view;
- (TBMTextFieldChain *)tbm_inputAccessory:(nullable UIView *)view;
- (TBMTextFieldChain *)tbm_focus:(BOOL)value;

- (TBMTextFieldChain *)tbm_bg:(UIColor *)color;
- (TBMTextFieldChain *)tbm_radius:(CGFloat)value;
- (TBMTextFieldChain *)tbm_borderColor:(UIColor *)color width:(CGFloat)width;
- (TBMTextFieldChain *)tbm_shadow:(UIColor *)color;
- (TBMTextFieldChain *)tbm_alpha:(CGFloat)value;
- (TBMTextFieldChain *)tbm_hidden:(BOOL)value;
- (TBMTextFieldChain *)tbm_clips:(BOOL)value;
- (TBMTextFieldChain *)tbm_userInteraction:(BOOL)value;
- (TBMTextFieldChain *)tbm_tag:(NSInteger)value;
- (TBMTextFieldChain *)tbm_tint:(UIColor *)color;

- (TBMTextFieldChain *)tbm_size:(CGSize)size;
- (TBMTextFieldChain *)tbm_height:(CGFloat)value;
- (TBMTextFieldChain *)tbm_pinEdgesTo:(UIView *)parent inset:(UIEdgeInsets)insets;
- (TBMTextFieldChain *)tbm_pinCenterIn:(UIView *)parent;
- (TBMTextFieldChain *)tbm_addTo:(UIView *)parent;

@end

@interface TBMTextField : UITextField

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMTextFieldChain *chain))block;

@end

NS_ASSUME_NONNULL_END
