#import "TBMCardView.h"
#import "UIView+TBMPin.h"
#import "UIView+TBMStyle.h"
#import <objc/runtime.h>

static char kTBMCardPaddingKey;

@interface TBMCardView ()
@property (nonatomic, strong) UIView *tbm_contentView;
@end

@implementation TBMCardView

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMCardView *))block {
    TBMCardView *card = [[TBMCardView alloc] initWithFrame:CGRectZero];
    card.translatesAutoresizingMaskIntoConstraints = NO;
    card.tbm_contentView = [[UIView alloc] initWithFrame:CGRectZero];
    card.tbm_contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [card addSubview:card.tbm_contentView];
    objc_setAssociatedObject(card, &kTBMCardPaddingKey, [NSValue valueWithUIEdgeInsets:UIEdgeInsetsZero], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [card tbm_applyContentInsets:UIEdgeInsetsZero];
    if (block) {
        block(card);
    }
    return card;
}

- (void)tbm_applyContentInsets:(UIEdgeInsets)padding {
    UIView *content = self.tbm_contentView;
    [NSLayoutConstraint deactivateConstraints:content.constraints];
    UILayoutGuide *guide = self.layoutMarginsGuide;
    self.layoutMargins = padding;
    self.preservesSuperviewLayoutMargins = NO;
    [NSLayoutConstraint activateConstraints:@[
        [content.topAnchor constraintEqualToAnchor:guide.topAnchor],
        [content.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor],
        [content.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor],
        [content.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor],
    ]];
}

- (TBMCardView *)tbm_fill:(UIColor *)color {
    self.backgroundColor = color;
    return self;
}

- (TBMCardView *)tbm_radius:(CGFloat)value {
    self.layer.cornerRadius = value;
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 0.08;
    self.layer.shadowRadius = 8;
    self.layer.shadowOffset = CGSizeMake(0, 4);
    return self;
}

- (TBMCardView *)tbm_padding:(CGFloat)value {
    return [self tbm_paddingInsets:UIEdgeInsetsMake(value, value, value, value)];
}

- (TBMCardView *)tbm_paddingInsets:(UIEdgeInsets)insets {
    objc_setAssociatedObject(self, &kTBMCardPaddingKey, [NSValue valueWithUIEdgeInsets:insets], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self tbm_applyContentInsets:insets];
    return self;
}

- (TBMCardView *)tbm_borderColor:(UIColor *)color width:(CGFloat)width {
    [[self tbm_style] tbm_borderColor:color width:width];
    return self;
}

- (TBMCardView *)tbm_shadow:(UIColor *)color {
    [[self tbm_style] tbm_shadow:color];
    return self;
}

- (TBMCardView *)tbm_alpha:(CGFloat)value {
    [[self tbm_style] tbm_alpha:value];
    return self;
}

- (TBMCardView *)tbm_hidden:(BOOL)value {
    [[self tbm_style] tbm_hidden:value];
    return self;
}

- (TBMCardView *)tbm_clips:(BOOL)value {
    [[self tbm_style] tbm_clips:value];
    return self;
}

- (TBMCardView *)tbm_userInteraction:(BOOL)value {
    [[self tbm_style] tbm_userInteraction:value];
    return self;
}

- (TBMCardView *)tbm_tag:(NSInteger)value {
    [[self tbm_style] tbm_tag:value];
    return self;
}

- (TBMCardView *)tbm_size:(CGSize)size {
    [[self tbm_style] tbm_size:size];
    return self;
}

- (TBMCardView *)tbm_pinEdgesTo:(UIView *)parent inset:(UIEdgeInsets)insets {
    [[self tbm_style] tbm_pinEdgesTo:parent inset:insets];
    return self;
}

- (TBMCardView *)tbm_addTo:(UIView *)parent {
    [parent addSubview:self];
    return self;
}

- (TBMCardView *)tbm_content:(UIView *)child {
    [self.tbm_contentView addSubview:child];
    [[child tbm_style] tbm_pinEdgesTo:self.tbm_contentView inset:UIEdgeInsetsZero];
    return self;
}

@end
