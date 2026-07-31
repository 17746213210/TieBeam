#import "TBMButton.h"
#import "TBMBlockTarget.h"
#import "UIView+TBMStyle.h"
#import "UIView+TBMPin.h"
#import <objc/runtime.h>

static char kTBMButtonBlockTargetKey;

@interface TBMButton (TBMPrivate)
+ (void)tbm_applyBackgroundColor:(UIColor *)color toButton:(UIButton *)button;
+ (void)tbm_applyBackgroundColor:(UIColor *)color toButton:(UIButton *)button forState:(UIControlState)state;
@end

@implementation TBMButtonChain

- (instancetype)initWithButton:(UIButton *)button {
    self = [super init];
    if (self) {
        _tbm_button = button;
    }
    return self;
}

- (TBMButtonChain *)tbm_title:(NSString *)title {
    [self.tbm_button setTitle:title forState:UIControlStateNormal];
    [self.tbm_button setTitle:title forState:UIControlStateHighlighted];
    [self.tbm_button setTitle:title forState:UIControlStateSelected];
    [self.tbm_button setTitle:title forState:UIControlStateDisabled];
    return self;
}

- (TBMButtonChain *)tbm_titleColor:(UIColor *)color {
    [self.tbm_button setTitleColor:color forState:UIControlStateNormal];
    [self.tbm_button setTitleColor:color forState:UIControlStateHighlighted];
    [self.tbm_button setTitleColor:color forState:UIControlStateSelected];
    [self.tbm_button setTitleColor:color forState:UIControlStateDisabled];
    return self;
}

- (TBMButtonChain *)tbm_selectedTitle:(NSString *)title {
    [self.tbm_button setTitle:title forState:UIControlStateSelected];
    return self;
}

- (TBMButtonChain *)tbm_selectedTitleColor:(UIColor *)color {
    [self.tbm_button setTitleColor:color forState:UIControlStateSelected];
    return self;
}

- (TBMButtonChain *)tbm_highlightedTitle:(NSString *)title {
    [self.tbm_button setTitle:title forState:UIControlStateHighlighted];
    return self;
}

- (TBMButtonChain *)tbm_highlightedTitleColor:(UIColor *)color {
    [self.tbm_button setTitleColor:color forState:UIControlStateHighlighted];
    return self;
}

- (TBMButtonChain *)tbm_disabledTitle:(NSString *)title {
    [self.tbm_button setTitle:title forState:UIControlStateDisabled];
    return self;
}

- (TBMButtonChain *)tbm_disabledTitleColor:(UIColor *)color {
    [self.tbm_button setTitleColor:color forState:UIControlStateDisabled];
    return self;
}

- (TBMButtonChain *)tbm_font:(UIFont *)font {
    self.tbm_button.titleLabel.font = font;
    return self;
}

- (TBMButtonChain *)tbm_image:(UIImage *)image {
    [self.tbm_button setImage:image forState:UIControlStateNormal];
    return self;
}

- (TBMButtonChain *)tbm_selectedImage:(UIImage *)image {
    [self.tbm_button setImage:image forState:UIControlStateSelected];
    return self;
}

- (TBMButtonChain *)tbm_highlightedImage:(UIImage *)image {
    [self.tbm_button setImage:image forState:UIControlStateHighlighted];
    return self;
}

- (TBMButtonChain *)tbm_disabledImage:(UIImage *)image {
    [self.tbm_button setImage:image forState:UIControlStateDisabled];
    return self;
}

- (TBMButtonChain *)tbm_bg:(UIColor *)color {
    [TBMButton tbm_applyBackgroundColor:color toButton:self.tbm_button];
    return self;
}

- (TBMButtonChain *)tbm_selectedBg:(UIColor *)color {
    [TBMButton tbm_applyBackgroundColor:color toButton:self.tbm_button forState:UIControlStateSelected];
    return self;
}

- (TBMButtonChain *)tbm_highlightedBg:(UIColor *)color {
    [TBMButton tbm_applyBackgroundColor:color toButton:self.tbm_button forState:UIControlStateHighlighted];
    return self;
}

- (TBMButtonChain *)tbm_disabledBg:(UIColor *)color {
    [TBMButton tbm_applyBackgroundColor:color toButton:self.tbm_button forState:UIControlStateDisabled];
    return self;
}

- (TBMButtonChain *)tbm_radius:(CGFloat)value {
    self.tbm_button.layer.cornerRadius = value;
    self.tbm_button.layer.masksToBounds = YES;
    return self;
}

- (TBMButtonChain *)tbm_borderColor:(UIColor *)color width:(CGFloat)width {
    [[self.tbm_button tbm_style] tbm_borderColor:color width:width];
    return self;
}

- (TBMButtonChain *)tbm_shadow:(UIColor *)color {
    [[self.tbm_button tbm_style] tbm_shadow:color];
    return self;
}

- (TBMButtonChain *)tbm_alpha:(CGFloat)value {
    [[self.tbm_button tbm_style] tbm_alpha:value];
    return self;
}

- (TBMButtonChain *)tbm_hidden:(BOOL)value {
    [[self.tbm_button tbm_style] tbm_hidden:value];
    return self;
}

- (TBMButtonChain *)tbm_clips:(BOOL)value {
    [[self.tbm_button tbm_style] tbm_clips:value];
    return self;
}

- (TBMButtonChain *)tbm_userInteraction:(BOOL)value {
    [[self.tbm_button tbm_style] tbm_userInteraction:value];
    return self;
}

- (TBMButtonChain *)tbm_tag:(NSInteger)value {
    [[self.tbm_button tbm_style] tbm_tag:value];
    return self;
}

- (TBMButtonChain *)tbm_tint:(UIColor *)color {
    [[self.tbm_button tbm_style] tbm_tint:color];
    return self;
}

- (TBMButtonChain *)tbm_enabled:(BOOL)value {
    self.tbm_button.enabled = value;
    return self;
}

- (TBMButtonChain *)tbm_selected:(BOOL)value {
    self.tbm_button.selected = value;
    return self;
}

- (TBMButtonChain *)tbm_contentInset:(UIEdgeInsets)insets {
    self.tbm_button.contentEdgeInsets = insets;
    return self;
}

- (TBMButtonChain *)tbm_imageInset:(UIEdgeInsets)insets {
    self.tbm_button.imageEdgeInsets = insets;
    return self;
}

- (TBMButtonChain *)tbm_titleInset:(UIEdgeInsets)insets {
    self.tbm_button.titleEdgeInsets = insets;
    return self;
}

- (TBMButtonChain *)tbm_size:(CGSize)size {
    [[self.tbm_button tbm_style] tbm_size:size];
    return self;
}

- (TBMButtonChain *)tbm_pinEdgesTo:(UIView *)parent inset:(UIEdgeInsets)insets {
    [[self.tbm_button tbm_style] tbm_pinEdgesTo:parent inset:insets];
    return self;
}

- (TBMButtonChain *)tbm_pinCenterIn:(UIView *)parent {
    [[self.tbm_button tbm_style] tbm_pinCenterIn:parent];
    return self;
}

- (TBMButtonChain *)tbm_action:(id)target selector:(SEL)selector {
    [self.tbm_button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    return self;
}

- (TBMButtonChain *)tbm_actionBlock:(void (^)(void))block {
    TBMBlockTarget *target = [[TBMBlockTarget alloc] init];
    target.tbm_block = block;
    objc_setAssociatedObject(self.tbm_button, &kTBMButtonBlockTargetKey, target, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self.tbm_button addTarget:target action:@selector(tbm_invoke) forControlEvents:UIControlEventTouchUpInside];
    return self;
}

- (TBMButtonChain *)tbm_addTo:(UIView *)parent {
    [parent addSubview:self.tbm_button];
    return self;
}

@end

@implementation TBMButton

+ (UIImage *)tbm_solidImageWithColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(2, 2), NO, 0);
    [color setFill];
    UIRectFill(CGRectMake(0, 0, 2, 2));
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

+ (void)tbm_applyBackgroundColor:(UIColor *)color toButton:(UIButton *)button {
    [self tbm_applyBackgroundColor:color toButton:button forState:UIControlStateNormal];
    [self tbm_applyBackgroundColor:color toButton:button forState:UIControlStateHighlighted];
    [self tbm_applyBackgroundColor:color toButton:button forState:UIControlStateSelected];
    [self tbm_applyBackgroundColor:color toButton:button forState:UIControlStateDisabled];
    button.backgroundColor = UIColor.clearColor;
}

+ (void)tbm_applyBackgroundColor:(UIColor *)color toButton:(UIButton *)button forState:(UIControlState)state {
    UIImage *image = [self tbm_solidImageWithColor:color];
    [button setBackgroundImage:image forState:state];
    button.backgroundColor = UIColor.clearColor;
}

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMButtonChain *))block {
    TBMButton *button = [TBMButton buttonWithType:UIButtonTypeCustom];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    button.adjustsImageWhenHighlighted = NO;
    button.showsTouchWhenHighlighted = NO;
    if (@available(iOS 15.0, *)) {
        button.configuration = nil;
    }
    if (block) {
        TBMButtonChain *chain = [[TBMButtonChain alloc] initWithButton:button];
        block(chain);
    }
    return button;
}

- (void)setHighlighted:(BOOL)highlighted {
    [super setHighlighted:highlighted];
    self.alpha = 1.0;
}

@end
