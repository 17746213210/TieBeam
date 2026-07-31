#import "TBMScrollHub.h"
#import "UIView+TBMStyle.h"
#import "UIView+TBMPin.h"
#import "UIView+TBMPin.h"

@implementation TBMScrollHub

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMScrollHub *))block {
    TBMScrollHub *scroll = [[TBMScrollHub alloc] initWithFrame:CGRectZero];
    scroll.translatesAutoresizingMaskIntoConstraints = NO;
    if (block) {
        block(scroll);
    }
    return scroll;
}

- (TBMScrollHub *)tbm_paging:(BOOL)value {
    self.pagingEnabled = value;
    return self;
}

- (TBMScrollHub *)tbm_showsVerticalIndicator:(BOOL)value {
    self.showsVerticalScrollIndicator = value;
    return self;
}

- (TBMScrollHub *)tbm_showsHorizontalIndicator:(BOOL)value {
    self.showsHorizontalScrollIndicator = value;
    return self;
}

- (TBMScrollHub *)tbm_bg:(UIColor *)color {
    [[self tbm_style] tbm_bg:color];
    return self;
}

- (TBMScrollHub *)tbm_radius:(CGFloat)value {
    [[self tbm_style] tbm_radius:value];
    return self;
}

- (TBMScrollHub *)tbm_alpha:(CGFloat)value {
    [[self tbm_style] tbm_alpha:value];
    return self;
}

- (TBMScrollHub *)tbm_hidden:(BOOL)value {
    [[self tbm_style] tbm_hidden:value];
    return self;
}

- (TBMScrollHub *)tbm_tag:(NSInteger)value {
    [[self tbm_style] tbm_tag:value];
    return self;
}

- (TBMScrollHub *)tbm_pinEdgesTo:(UIView *)parent inset:(UIEdgeInsets)insets {
    [[self tbm_style] tbm_pinEdgesTo:parent inset:insets];
    return self;
}

- (TBMScrollHub *)tbm_pinSafeAreaTo:(UIView *)parent inset:(UIEdgeInsets)insets {
    [[self tbm_style] tbm_pinSafeAreaTo:parent inset:insets];
    return self;
}

- (TBMScrollHub *)tbm_addTo:(UIView *)parent {
    [parent addSubview:self];
    return self;
}

@end
