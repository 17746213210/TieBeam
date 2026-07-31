#import "TBMTextField.h"
#import "UIView+TBMStyle.h"
#import "UIView+TBMPin.h"

@implementation TBMTextFieldChain

- (instancetype)initWithField:(UITextField *)field {
    self = [super init];
    if (self) {
        _tbm_field = field;
    }
    return self;
}

- (TBMTextFieldChain *)tbm_text:(NSString *)text {
    self.tbm_field.text = text;
    return self;
}

- (TBMTextFieldChain *)tbm_placeholder:(NSString *)text {
    self.tbm_field.placeholder = text;
    return self;
}

- (TBMTextFieldChain *)tbm_placeholderColor:(UIColor *)color {
    NSString *placeholder = self.tbm_field.placeholder ?: @"";
    self.tbm_field.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder
                                                                             attributes:@{NSForegroundColorAttributeName: color}];
    return self;
}

- (TBMTextFieldChain *)tbm_font:(UIFont *)font {
    self.tbm_field.font = font;
    return self;
}

- (TBMTextFieldChain *)tbm_color:(UIColor *)color {
    self.tbm_field.textColor = color;
    return self;
}

- (TBMTextFieldChain *)tbm_align:(NSTextAlignment)alignment {
    self.tbm_field.textAlignment = alignment;
    return self;
}

- (TBMTextFieldChain *)tbm_keyboard:(UIKeyboardType)type {
    self.tbm_field.keyboardType = type;
    return self;
}

- (TBMTextFieldChain *)tbm_returnKey:(UIReturnKeyType)type {
    self.tbm_field.returnKeyType = type;
    return self;
}

- (TBMTextFieldChain *)tbm_borderStyle:(UITextBorderStyle)style {
    self.tbm_field.borderStyle = style;
    return self;
}

- (TBMTextFieldChain *)tbm_secure:(BOOL)value {
    self.tbm_field.secureTextEntry = value;
    return self;
}

- (TBMTextFieldChain *)tbm_clearButton:(UITextFieldViewMode)mode {
    self.tbm_field.clearButtonMode = mode;
    return self;
}

- (TBMTextFieldChain *)tbm_autocapitalization:(UITextAutocapitalizationType)type {
    self.tbm_field.autocapitalizationType = type;
    return self;
}

- (TBMTextFieldChain *)tbm_autocorrection:(UITextAutocorrectionType)type {
    self.tbm_field.autocorrectionType = type;
    return self;
}

- (TBMTextFieldChain *)tbm_spellChecking:(UITextSpellCheckingType)type {
    self.tbm_field.spellCheckingType = type;
    return self;
}

- (TBMTextFieldChain *)tbm_enablesReturnKey:(BOOL)value {
    self.tbm_field.enablesReturnKeyAutomatically = value;
    return self;
}

- (TBMTextFieldChain *)tbm_clearsOnBeginEditing:(BOOL)value {
    self.tbm_field.clearsOnBeginEditing = value;
    return self;
}

- (TBMTextFieldChain *)tbm_clearsOnInsertion:(BOOL)value {
    self.tbm_field.clearsOnInsertion = value;
    return self;
}

- (TBMTextFieldChain *)tbm_delegate:(id<UITextFieldDelegate>)delegate {
    self.tbm_field.delegate = delegate;
    return self;
}

- (TBMTextFieldChain *)tbm_leftView:(UIView *)view mode:(UITextFieldViewMode)mode {
    self.tbm_field.leftView = view;
    self.tbm_field.leftViewMode = mode;
    return self;
}

- (TBMTextFieldChain *)tbm_rightView:(UIView *)view mode:(UITextFieldViewMode)mode {
    self.tbm_field.rightView = view;
    self.tbm_field.rightViewMode = mode;
    return self;
}

- (TBMTextFieldChain *)tbm_inputView:(UIView *)view {
    self.tbm_field.inputView = view;
    return self;
}

- (TBMTextFieldChain *)tbm_inputAccessory:(UIView *)view {
    self.tbm_field.inputAccessoryView = view;
    return self;
}

- (TBMTextFieldChain *)tbm_focus:(BOOL)value {
    if (value) {
        [self.tbm_field becomeFirstResponder];
    } else {
        [self.tbm_field resignFirstResponder];
    }
    return self;
}

- (TBMTextFieldChain *)tbm_bg:(UIColor *)color {
    [[self.tbm_field tbm_style] tbm_bg:color];
    return self;
}

- (TBMTextFieldChain *)tbm_radius:(CGFloat)value {
    [[self.tbm_field tbm_style] tbm_radius:value];
    return self;
}

- (TBMTextFieldChain *)tbm_borderColor:(UIColor *)color width:(CGFloat)width {
    [[self.tbm_field tbm_style] tbm_borderColor:color width:width];
    return self;
}

- (TBMTextFieldChain *)tbm_shadow:(UIColor *)color {
    [[self.tbm_field tbm_style] tbm_shadow:color];
    return self;
}

- (TBMTextFieldChain *)tbm_alpha:(CGFloat)value {
    [[self.tbm_field tbm_style] tbm_alpha:value];
    return self;
}

- (TBMTextFieldChain *)tbm_hidden:(BOOL)value {
    [[self.tbm_field tbm_style] tbm_hidden:value];
    return self;
}

- (TBMTextFieldChain *)tbm_clips:(BOOL)value {
    [[self.tbm_field tbm_style] tbm_clips:value];
    return self;
}

- (TBMTextFieldChain *)tbm_userInteraction:(BOOL)value {
    [[self.tbm_field tbm_style] tbm_userInteraction:value];
    return self;
}

- (TBMTextFieldChain *)tbm_tag:(NSInteger)value {
    [[self.tbm_field tbm_style] tbm_tag:value];
    return self;
}

- (TBMTextFieldChain *)tbm_tint:(UIColor *)color {
    [[self.tbm_field tbm_style] tbm_tint:color];
    return self;
}

- (TBMTextFieldChain *)tbm_size:(CGSize)size {
    [[self.tbm_field tbm_style] tbm_size:size];
    return self;
}

- (TBMTextFieldChain *)tbm_height:(CGFloat)value {
    [[self.tbm_field tbm_style] tbm_height:value];
    return self;
}

- (TBMTextFieldChain *)tbm_pinEdgesTo:(UIView *)parent inset:(UIEdgeInsets)insets {
    [[self.tbm_field tbm_style] tbm_pinEdgesTo:parent inset:insets];
    return self;
}

- (TBMTextFieldChain *)tbm_pinCenterIn:(UIView *)parent {
    [[self.tbm_field tbm_style] tbm_pinCenterIn:parent];
    return self;
}

- (TBMTextFieldChain *)tbm_addTo:(UIView *)parent {
    [parent addSubview:self.tbm_field];
    return self;
}

@end

@implementation TBMTextField

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMTextFieldChain *))block {
    TBMTextField *field = [[TBMTextField alloc] initWithFrame:CGRectZero];
    field.translatesAutoresizingMaskIntoConstraints = NO;
    if (block) {
        TBMTextFieldChain *chain = [[TBMTextFieldChain alloc] initWithField:field];
        block(chain);
    }
    return field;
}

@end
