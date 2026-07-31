#import "TBMIndicator.h"
#import "UIView+TBMStyle.h"
#import "UIView+TBMPin.h"

@implementation TBMIndicatorChain

- (instancetype)initWithIndicator:(UIActivityIndicatorView *)indicator {
    self = [super init];
    if (self) {
        _tbm_indicator = indicator;
    }
    return self;
}

- (TBMIndicatorChain *)tbm_style:(UIActivityIndicatorViewStyle)style {
    if (@available(iOS 13.0, *)) {
        self.tbm_indicator.activityIndicatorViewStyle = style;
    } else {
        self.tbm_indicator.activityIndicatorViewStyle = style;
    }
    return self;
}

- (TBMIndicatorChain *)tbm_color:(UIColor *)color {
    self.tbm_indicator.color = color;
    return self;
}

- (TBMIndicatorChain *)tbm_hidesWhenStopped:(BOOL)value {
    self.tbm_indicator.hidesWhenStopped = value;
    return self;
}

- (TBMIndicatorChain *)tbm_start {
    [self.tbm_indicator startAnimating];
    return self;
}

- (TBMIndicatorChain *)tbm_stop {
    [self.tbm_indicator stopAnimating];
    return self;
}

- (TBMIndicatorChain *)tbm_alpha:(CGFloat)value {
    [[self.tbm_indicator tbm_style] tbm_alpha:value];
    return self;
}

- (TBMIndicatorChain *)tbm_hidden:(BOOL)value {
    [[self.tbm_indicator tbm_style] tbm_hidden:value];
    return self;
}

- (TBMIndicatorChain *)tbm_tag:(NSInteger)value {
    [[self.tbm_indicator tbm_style] tbm_tag:value];
    return self;
}

- (TBMIndicatorChain *)tbm_size:(CGSize)size {
    [[self.tbm_indicator tbm_style] tbm_size:size];
    return self;
}

- (TBMIndicatorChain *)tbm_pinCenterIn:(UIView *)parent {
    [[self.tbm_indicator tbm_style] tbm_pinCenterIn:parent];
    return self;
}

- (TBMIndicatorChain *)tbm_addTo:(UIView *)parent {
    [parent addSubview:self.tbm_indicator];
    return self;
}

@end

@implementation TBMIndicator

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMIndicatorChain *))block {
    UIActivityIndicatorViewStyle style;
    if (@available(iOS 13.0, *)) {
        style = UIActivityIndicatorViewStyleMedium;
    } else {
        style = UIActivityIndicatorViewStyleGray;
    }
    TBMIndicator *indicator = [[TBMIndicator alloc] initWithActivityIndicatorStyle:style];
    indicator.translatesAutoresizingMaskIntoConstraints = NO;
    if (block) {
        TBMIndicatorChain *chain = [[TBMIndicatorChain alloc] initWithIndicator:indicator];
        block(chain);
    }
    return indicator;
}

@end
