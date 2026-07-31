#import "TBMStackHub.h"
#import "UIView+TBMStyle.h"
#import "UIView+TBMPin.h"

@implementation TBMStackHub

+ (instancetype)tbm_vertical:(void (NS_NOESCAPE ^)(TBMStackHub *))block {
    TBMStackHub *stack = [[TBMStackHub alloc] initWithFrame:CGRectZero];
    stack.axis = UILayoutConstraintAxisVertical;
    stack.translatesAutoresizingMaskIntoConstraints = NO;
    if (block) {
        block(stack);
    }
    return stack;
}

+ (instancetype)tbm_horizontal:(void (NS_NOESCAPE ^)(TBMStackHub *))block {
    TBMStackHub *stack = [[TBMStackHub alloc] initWithFrame:CGRectZero];
    stack.axis = UILayoutConstraintAxisHorizontal;
    stack.translatesAutoresizingMaskIntoConstraints = NO;
    if (block) {
        block(stack);
    }
    return stack;
}

- (TBMStackHub *)tbm_axis:(UILayoutConstraintAxis)axis {
    self.axis = axis;
    return self;
}

- (TBMStackHub *)tbm_spacing:(CGFloat)value {
    self.spacing = value;
    return self;
}

- (TBMStackHub *)tbm_padding:(UIEdgeInsets)insets {
    self.layoutMargins = insets;
    self.layoutMarginsRelativeArrangement = YES;
    return self;
}

- (TBMStackHub *)tbm_alignment:(UIStackViewAlignment)value {
    self.alignment = value;
    return self;
}

- (TBMStackHub *)tbm_distribution:(UIStackViewDistribution)value {
    self.distribution = value;
    return self;
}

- (TBMStackHub *)tbm_baselineRelative:(BOOL)value {
    self.baselineRelativeArrangement = value;
    return self;
}

- (TBMStackHub *)tbm_customSpacing:(CGFloat)spacing afterView:(UIView *)view {
    if (@available(iOS 11.0, *)) {
        [self setCustomSpacing:spacing afterView:view];
    }
    return self;
}

- (TBMStackHub *)tbm_bg:(UIColor *)color {
    [[self tbm_style] tbm_bg:color];
    return self;
}

- (TBMStackHub *)tbm_radius:(CGFloat)value {
    [[self tbm_style] tbm_radius:value];
    return self;
}

- (TBMStackHub *)tbm_borderColor:(UIColor *)color width:(CGFloat)width {
    [[self tbm_style] tbm_borderColor:color width:width];
    return self;
}

- (TBMStackHub *)tbm_shadow:(UIColor *)color {
    [[self tbm_style] tbm_shadow:color];
    return self;
}

- (TBMStackHub *)tbm_alpha:(CGFloat)value {
    [[self tbm_style] tbm_alpha:value];
    return self;
}

- (TBMStackHub *)tbm_hidden:(BOOL)value {
    [[self tbm_style] tbm_hidden:value];
    return self;
}

- (TBMStackHub *)tbm_height:(CGFloat)value {
    [[self tbm_style] tbm_height:value];
    return self;
}

- (TBMStackHub *)tbm_clips:(BOOL)value {
    [[self tbm_style] tbm_clips:value];
    return self;
}

- (TBMStackHub *)tbm_userInteraction:(BOOL)value {
    [[self tbm_style] tbm_userInteraction:value];
    return self;
}

- (TBMStackHub *)tbm_tag:(NSInteger)value {
    [[self tbm_style] tbm_tag:value];
    return self;
}

- (TBMStackHub *)tbm_addTo:(UIView *)parent {
    [parent addSubview:self];
    return self;
}

- (TBMStackHub *)tbm_arranged:(UIView *)view {
    [self addArrangedSubview:view];
    return self;
}

- (TBMStackHub *)tbm_views:(NSArray<UIView *> *)views {
    for (UIView *view in views) {
        [self addArrangedSubview:view];
    }
    return self;
}

- (TBMStackHub *)tbm_pinScrollContent:(UIScrollView *)scrollView {
    [scrollView addSubview:self];
    UILayoutGuide *content = scrollView.contentLayoutGuide;
    UILayoutGuide *frame = scrollView.frameLayoutGuide;
    [NSLayoutConstraint activateConstraints:@[
        [self.topAnchor constraintEqualToAnchor:content.topAnchor],
        [self.leadingAnchor constraintEqualToAnchor:content.leadingAnchor],
        [self.trailingAnchor constraintEqualToAnchor:content.trailingAnchor],
        [self.bottomAnchor constraintEqualToAnchor:content.bottomAnchor],
        [self.widthAnchor constraintEqualToAnchor:frame.widthAnchor],
    ]];
    return self;
}

@end
