#import "TBMDividerLine.h"
#import "UIView+TBMStyle.h"

@interface TBMDividerLine ()
@property (nonatomic, strong) NSLayoutConstraint *tbm_heightConstraint;
@end

@implementation TBMDividerLine

+ (instancetype)tbm_defaultLine {
    return [self tbm_lineColor:[UIColor colorWithWhite:0.85 alpha:1.0] height:1.0 / UIScreen.mainScreen.scale];
}

+ (instancetype)tbm_lineColor:(UIColor *)color height:(CGFloat)height {
    TBMDividerLine *line = [[TBMDividerLine alloc] initWithFrame:CGRectZero];
    line.translatesAutoresizingMaskIntoConstraints = NO;
    line.backgroundColor = color;
    line.tbm_heightConstraint = [line.heightAnchor constraintEqualToConstant:height];
    line.tbm_heightConstraint.active = YES;
    return line;
}

- (TBMDividerLine *)tbm_color:(UIColor *)color {
    self.backgroundColor = color;
    return self;
}

- (TBMDividerLine *)tbm_thickness:(CGFloat)height {
    self.tbm_heightConstraint.constant = height;
    return self;
}

- (TBMDividerLine *)tbm_alpha:(CGFloat)value {
    [[self tbm_style] tbm_alpha:value];
    return self;
}

- (TBMDividerLine *)tbm_hidden:(BOOL)value {
    [[self tbm_style] tbm_hidden:value];
    return self;
}

- (TBMDividerLine *)tbm_addTo:(UIView *)parent {
    [parent addSubview:self];
    return self;
}

@end
