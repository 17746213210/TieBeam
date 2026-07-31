#import "UIView+TBMPin.h"

@implementation TBMViewChain (TBMPin)

- (TBMViewChain *)tbm_pinCenterIn:(UIView *)parent {
    return [self tbm_pinCenterIn:parent offsetY:0];
}

- (TBMViewChain *)tbm_pinCenterIn:(UIView *)parent offsetY:(CGFloat)offsetY {
    UIView *view = self.tbm_view;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [view.centerXAnchor constraintEqualToAnchor:parent.centerXAnchor],
        [view.centerYAnchor constraintEqualToAnchor:parent.centerYAnchor constant:offsetY],
    ]];
    return self;
}

- (TBMViewChain *)tbm_pinTopInSafeArea:(UIView *)parent offset:(CGFloat)offset {
    UIView *view = self.tbm_view;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [view.centerXAnchor constraintEqualToAnchor:parent.centerXAnchor],
        [view.topAnchor constraintEqualToAnchor:parent.safeAreaLayoutGuide.topAnchor constant:offset],
    ]];
    return self;
}

- (TBMViewChain *)tbm_pinBottomInSafeArea:(UIView *)parent offset:(CGFloat)offset {
    UIView *view = self.tbm_view;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [view.centerXAnchor constraintEqualToAnchor:parent.centerXAnchor],
        [view.bottomAnchor constraintEqualToAnchor:parent.safeAreaLayoutGuide.bottomAnchor constant:offset],
    ]];
    return self;
}

- (TBMViewChain *)tbm_pinCenterInSafeArea:(UIView *)parent offsetY:(CGFloat)offsetY {
    UIView *view = self.tbm_view;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [view.centerXAnchor constraintEqualToAnchor:parent.centerXAnchor],
        [view.centerYAnchor constraintEqualToAnchor:parent.safeAreaLayoutGuide.centerYAnchor constant:offsetY],
    ]];
    return self;
}

- (TBMViewChain *)tbm_pinEdgesTo:(UIView *)parent inset:(UIEdgeInsets)insets {
    UIView *view = self.tbm_view;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    if (view.superview != parent) {
        [parent addSubview:view];
    }
    [NSLayoutConstraint activateConstraints:@[
        [view.topAnchor constraintEqualToAnchor:parent.topAnchor constant:insets.top],
        [view.leadingAnchor constraintEqualToAnchor:parent.leadingAnchor constant:insets.left],
        [view.trailingAnchor constraintEqualToAnchor:parent.trailingAnchor constant:-insets.right],
        [view.bottomAnchor constraintEqualToAnchor:parent.bottomAnchor constant:-insets.bottom],
    ]];
    return self;
}

- (TBMViewChain *)tbm_pinSafeAreaTo:(UIView *)parent inset:(UIEdgeInsets)insets {
    UIView *view = self.tbm_view;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    if (view.superview != parent) {
        [parent addSubview:view];
    }
    UILayoutGuide *guide = parent.safeAreaLayoutGuide;
    [NSLayoutConstraint activateConstraints:@[
        [view.topAnchor constraintEqualToAnchor:guide.topAnchor constant:insets.top],
        [view.leadingAnchor constraintEqualToAnchor:guide.leadingAnchor constant:insets.left],
        [view.trailingAnchor constraintEqualToAnchor:guide.trailingAnchor constant:-insets.right],
        [view.bottomAnchor constraintEqualToAnchor:guide.bottomAnchor constant:-insets.bottom],
    ]];
    return self;
}

- (TBMViewChain *)tbm_pinBelow:(UIView *)anchor constant:(CGFloat)constant {
    UIView *view = self.tbm_view;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    UIView *parent = anchor.superview;
    [NSLayoutConstraint activateConstraints:@[
        [view.topAnchor constraintEqualToAnchor:anchor.bottomAnchor constant:constant],
        [view.centerXAnchor constraintEqualToAnchor:parent.centerXAnchor],
    ]];
    return self;
}

- (TBMViewChain *)tbm_pinCenterXIn:(UIView *)parent {
    UIView *view = self.tbm_view;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [view.centerXAnchor constraintEqualToAnchor:parent.centerXAnchor],
    ]];
    return self;
}

- (TBMViewChain *)tbm_pinTopTrailingOf:(UIView *)anchor top:(CGFloat)top trailing:(CGFloat)trailing {
    UIView *view = self.tbm_view;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [view.topAnchor constraintEqualToAnchor:anchor.topAnchor constant:top],
        [view.trailingAnchor constraintEqualToAnchor:anchor.trailingAnchor constant:trailing],
    ]];
    return self;
}

- (TBMViewChain *)tbm_maxWidthIn:(UIView *)parent inset:(CGFloat)inset {
    UIView *view = self.tbm_view;
    [NSLayoutConstraint activateConstraints:@[
        [view.widthAnchor constraintLessThanOrEqualToAnchor:parent.widthAnchor constant:-inset],
    ]];
    return self;
}

- (TBMViewChain *)tbm_minWidth:(CGFloat)width {
    [NSLayoutConstraint activateConstraints:@[
        [self.tbm_view.widthAnchor constraintGreaterThanOrEqualToConstant:width],
    ]];
    return self;
}

- (TBMViewChain *)tbm_minHeight:(CGFloat)height {
    [NSLayoutConstraint activateConstraints:@[
        [self.tbm_view.heightAnchor constraintGreaterThanOrEqualToConstant:height],
    ]];
    return self;
}

- (TBMViewChain *)tbm_height:(CGFloat)height {
    UIView *view = self.tbm_view;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [view.heightAnchor constraintEqualToConstant:height],
    ]];
    return self;
}

- (TBMViewChain *)tbm_width:(CGFloat)width {
    UIView *view = self.tbm_view;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [view.widthAnchor constraintEqualToConstant:width],
    ]];
    return self;
}

- (TBMViewChain *)tbm_size:(CGSize)size {
    UIView *view = self.tbm_view;
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[
        [view.widthAnchor constraintEqualToConstant:size.width],
        [view.heightAnchor constraintEqualToConstant:size.height],
    ]];
    return self;
}

@end
