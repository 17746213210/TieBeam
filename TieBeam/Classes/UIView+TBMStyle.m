#import "UIView+TBMStyle.h"
#import "TBMStyleRotor.h"

@implementation TBMViewChain

- (instancetype)initWithView:(UIView *)view {
    self = [super init];
    if (self) {
        _tbm_view = view;
    }
    return self;
}

- (TBMViewChain *)tbm_bg:(UIColor *)color {
    self.tbm_view.backgroundColor = color;
    return self;
}

- (TBMViewChain *)tbm_radius:(CGFloat)value {
    self.tbm_view.layer.cornerRadius = value;
    self.tbm_view.layer.masksToBounds = value > 0;
    return self;
}

- (TBMViewChain *)tbm_borderColor:(UIColor *)color width:(CGFloat)width {
    self.tbm_view.layer.borderColor = color.CGColor;
    self.tbm_view.layer.borderWidth = width;
    return self;
}

- (TBMViewChain *)tbm_shadow:(UIColor *)color {
    self.tbm_view.layer.shadowColor = color.CGColor;
    self.tbm_view.layer.shadowOpacity = 0.18;
    self.tbm_view.layer.shadowRadius = 8;
    self.tbm_view.layer.shadowOffset = CGSizeMake(0, 4);
    return self;
}

- (TBMViewChain *)tbm_alpha:(CGFloat)value {
    self.tbm_view.alpha = value;
    return self;
}

- (TBMViewChain *)tbm_hidden:(BOOL)value {
    self.tbm_view.hidden = value;
    return self;
}

- (TBMViewChain *)tbm_clips:(BOOL)value {
    self.tbm_view.clipsToBounds = value;
    return self;
}

- (TBMViewChain *)tbm_userInteraction:(BOOL)value {
    self.tbm_view.userInteractionEnabled = value;
    return self;
}

- (TBMViewChain *)tbm_tag:(NSInteger)value {
    self.tbm_view.tag = value;
    return self;
}

- (TBMViewChain *)tbm_tint:(UIColor *)color {
    self.tbm_view.tintColor = color;
    return self;
}

- (TBMViewChain *)tbm_contentMode:(UIViewContentMode)mode {
    self.tbm_view.contentMode = mode;
    return self;
}

- (TBMViewChain *)tbm_exclusiveTouch:(BOOL)value {
    self.tbm_view.exclusiveTouch = value;
    return self;
}

- (TBMViewChain *)tbm_addTo:(UIView *)parent {
    [parent addSubview:self.tbm_view];
    [TBMStyleRotor tbm_touchView:self.tbm_view];
    return self;
}

@end

@implementation UIView (TBMStyle)

- (TBMViewChain *)tbm_style {
    return [[TBMViewChain alloc] initWithView:self];
}

@end
