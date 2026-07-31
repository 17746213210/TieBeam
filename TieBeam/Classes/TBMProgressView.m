#import "TBMProgressView.h"
#import "UIView+TBMStyle.h"
#import "UIView+TBMPin.h"

@implementation TBMProgressViewChain

- (instancetype)initWithProgressView:(UIProgressView *)progressView {
    self = [super init];
    if (self) {
        _tbm_progressView = progressView;
    }
    return self;
}

- (TBMProgressViewChain *)tbm_progress:(float)value {
    self.tbm_progressView.progress = value;
    return self;
}

- (TBMProgressViewChain *)tbm_progressStyle:(UIProgressViewStyle)style {
    (void)style;
    return self;
}

- (TBMProgressViewChain *)tbm_tint:(UIColor *)color {
    self.tbm_progressView.progressTintColor = color;
    return self;
}

- (TBMProgressViewChain *)tbm_trackTint:(UIColor *)color {
    self.tbm_progressView.trackTintColor = color;
    return self;
}

- (TBMProgressViewChain *)tbm_alpha:(CGFloat)value {
    [[self.tbm_progressView tbm_style] tbm_alpha:value];
    return self;
}

- (TBMProgressViewChain *)tbm_hidden:(BOOL)value {
    [[self.tbm_progressView tbm_style] tbm_hidden:value];
    return self;
}

- (TBMProgressViewChain *)tbm_tag:(NSInteger)value {
    [[self.tbm_progressView tbm_style] tbm_tag:value];
    return self;
}

- (TBMProgressViewChain *)tbm_size:(CGSize)size {
    [[self.tbm_progressView tbm_style] tbm_size:size];
    return self;
}

- (TBMProgressViewChain *)tbm_pinEdgesTo:(UIView *)parent inset:(UIEdgeInsets)insets {
    [[self.tbm_progressView tbm_style] tbm_pinEdgesTo:parent inset:insets];
    return self;
}

- (TBMProgressViewChain *)tbm_addTo:(UIView *)parent {
    [parent addSubview:self.tbm_progressView];
    return self;
}

@end

@implementation TBMProgressView

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMProgressViewChain *))block {
    TBMProgressView *progressView = [[TBMProgressView alloc] initWithFrame:CGRectZero];
    progressView.translatesAutoresizingMaskIntoConstraints = NO;
    if (block) {
        TBMProgressViewChain *chain = [[TBMProgressViewChain alloc] initWithProgressView:progressView];
        block(chain);
    }
    return progressView;
}

- (TBMProgressView *)tbm_setProgress:(float)value {
    self.progress = value;
    return self;
}

@end
