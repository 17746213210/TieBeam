#import "TBMTextView.h"
#import "UIView+TBMStyle.h"
#import "UIView+TBMPin.h"

@implementation TBMTextViewChain

- (instancetype)initWithTextView:(UITextView *)textView {
    self = [super init];
    if (self) {
        _tbm_textView = textView;
    }
    return self;
}

- (TBMTextViewChain *)tbm_text:(NSString *)text {
    self.tbm_textView.text = text;
    return self;
}

- (TBMTextViewChain *)tbm_attributed:(NSAttributedString *)text {
    self.tbm_textView.attributedText = text;
    return self;
}

- (TBMTextViewChain *)tbm_font:(UIFont *)font {
    self.tbm_textView.font = font;
    return self;
}

- (TBMTextViewChain *)tbm_color:(UIColor *)color {
    self.tbm_textView.textColor = color;
    return self;
}

- (TBMTextViewChain *)tbm_align:(NSTextAlignment)alignment {
    self.tbm_textView.textAlignment = alignment;
    return self;
}

- (TBMTextViewChain *)tbm_editable:(BOOL)value {
    self.tbm_textView.editable = value;
    return self;
}

- (TBMTextViewChain *)tbm_selectable:(BOOL)value {
    self.tbm_textView.selectable = value;
    return self;
}

- (TBMTextViewChain *)tbm_scrollEnabled:(BOOL)value {
    self.tbm_textView.scrollEnabled = value;
    return self;
}

- (TBMTextViewChain *)tbm_insets:(UIEdgeInsets)insets {
    self.tbm_textView.textContainerInset = insets;
    return self;
}

- (TBMTextViewChain *)tbm_keyboard:(UIKeyboardType)type {
    self.tbm_textView.keyboardType = type;
    return self;
}

- (TBMTextViewChain *)tbm_autocapitalization:(UITextAutocapitalizationType)type {
    self.tbm_textView.autocapitalizationType = type;
    return self;
}

- (TBMTextViewChain *)tbm_autocorrection:(UITextAutocorrectionType)type {
    self.tbm_textView.autocorrectionType = type;
    return self;
}

- (TBMTextViewChain *)tbm_delegate:(id<UITextViewDelegate>)delegate {
    self.tbm_textView.delegate = delegate;
    return self;
}

- (TBMTextViewChain *)tbm_focus:(BOOL)value {
    if (value) {
        [self.tbm_textView becomeFirstResponder];
    } else {
        [self.tbm_textView resignFirstResponder];
    }
    return self;
}

- (TBMTextViewChain *)tbm_bg:(UIColor *)color {
    [[self.tbm_textView tbm_style] tbm_bg:color];
    return self;
}

- (TBMTextViewChain *)tbm_radius:(CGFloat)value {
    [[self.tbm_textView tbm_style] tbm_radius:value];
    return self;
}

- (TBMTextViewChain *)tbm_borderColor:(UIColor *)color width:(CGFloat)width {
    [[self.tbm_textView tbm_style] tbm_borderColor:color width:width];
    return self;
}

- (TBMTextViewChain *)tbm_alpha:(CGFloat)value {
    [[self.tbm_textView tbm_style] tbm_alpha:value];
    return self;
}

- (TBMTextViewChain *)tbm_hidden:(BOOL)value {
    [[self.tbm_textView tbm_style] tbm_hidden:value];
    return self;
}

- (TBMTextViewChain *)tbm_clips:(BOOL)value {
    [[self.tbm_textView tbm_style] tbm_clips:value];
    return self;
}

- (TBMTextViewChain *)tbm_tag:(NSInteger)value {
    [[self.tbm_textView tbm_style] tbm_tag:value];
    return self;
}

- (TBMTextViewChain *)tbm_size:(CGSize)size {
    [[self.tbm_textView tbm_style] tbm_size:size];
    return self;
}

- (TBMTextViewChain *)tbm_pinEdgesTo:(UIView *)parent inset:(UIEdgeInsets)insets {
    [[self.tbm_textView tbm_style] tbm_pinEdgesTo:parent inset:insets];
    return self;
}

- (TBMTextViewChain *)tbm_addTo:(UIView *)parent {
    [parent addSubview:self.tbm_textView];
    return self;
}

@end

@implementation TBMTextView

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMTextViewChain *))block {
    TBMTextView *textView = [[TBMTextView alloc] initWithFrame:CGRectZero];
    textView.translatesAutoresizingMaskIntoConstraints = NO;
    if (block) {
        TBMTextViewChain *chain = [[TBMTextViewChain alloc] initWithTextView:textView];
        block(chain);
    }
    return textView;
}

@end
