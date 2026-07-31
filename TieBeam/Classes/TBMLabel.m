#import "TBMLabel.h"
#import "UIView+TBMStyle.h"
#import "UIView+TBMPin.h"

@implementation TBMLabelChain

- (instancetype)initWithLabel:(UILabel *)label {
    self = [super init];
    if (self) {
        _tbm_label = label;
    }
    return self;
}

- (TBMLabelChain *)tbm_text:(NSString *)text {
    self.tbm_label.text = text;
    return self;
}

- (TBMLabelChain *)tbm_attributed:(NSAttributedString *)text {
    self.tbm_label.attributedText = text;
    return self;
}

- (TBMLabelChain *)tbm_color:(UIColor *)color {
    self.tbm_label.textColor = color;
    return self;
}

- (TBMLabelChain *)tbm_highlightedColor:(UIColor *)color {
    self.tbm_label.highlightedTextColor = color;
    return self;
}

- (TBMLabelChain *)tbm_font:(UIFont *)font {
    self.tbm_label.font = font;
    return self;
}

- (TBMLabelChain *)tbm_align:(NSTextAlignment)alignment {
    self.tbm_label.textAlignment = alignment;
    return self;
}

- (TBMLabelChain *)tbm_lines:(NSInteger)lines {
    self.tbm_label.numberOfLines = lines;
    return self;
}

- (TBMLabelChain *)tbm_lineBreak:(NSLineBreakMode)mode {
    self.tbm_label.lineBreakMode = mode;
    return self;
}

- (TBMLabelChain *)tbm_baseline:(UIBaselineAdjustment)adjustment {
    self.tbm_label.baselineAdjustment = adjustment;
    return self;
}

- (TBMLabelChain *)tbm_adjustsFont:(BOOL)value {
    self.tbm_label.adjustsFontSizeToFitWidth = value;
    return self;
}

- (TBMLabelChain *)tbm_minScale:(CGFloat)value {
    self.tbm_label.minimumScaleFactor = value;
    return self;
}

- (TBMLabelChain *)tbm_preferredWidth:(CGFloat)value {
    self.tbm_label.preferredMaxLayoutWidth = value;
    return self;
}

- (TBMLabelChain *)tbm_textShadow:(UIColor *)color offset:(CGSize)offset {
    self.tbm_label.shadowColor = color;
    self.tbm_label.shadowOffset = offset;
    return self;
}

- (TBMLabelChain *)tbm_bg:(UIColor *)color {
    [[self.tbm_label tbm_style] tbm_bg:color];
    return self;
}

- (TBMLabelChain *)tbm_radius:(CGFloat)value {
    [[self.tbm_label tbm_style] tbm_radius:value];
    return self;
}

- (TBMLabelChain *)tbm_borderColor:(UIColor *)color width:(CGFloat)width {
    [[self.tbm_label tbm_style] tbm_borderColor:color width:width];
    return self;
}

- (TBMLabelChain *)tbm_shadow:(UIColor *)color {
    [[self.tbm_label tbm_style] tbm_shadow:color];
    return self;
}

- (TBMLabelChain *)tbm_alpha:(CGFloat)value {
    [[self.tbm_label tbm_style] tbm_alpha:value];
    return self;
}

- (TBMLabelChain *)tbm_hidden:(BOOL)value {
    [[self.tbm_label tbm_style] tbm_hidden:value];
    return self;
}

- (TBMLabelChain *)tbm_clips:(BOOL)value {
    [[self.tbm_label tbm_style] tbm_clips:value];
    return self;
}

- (TBMLabelChain *)tbm_userInteraction:(BOOL)value {
    [[self.tbm_label tbm_style] tbm_userInteraction:value];
    return self;
}

- (TBMLabelChain *)tbm_tag:(NSInteger)value {
    [[self.tbm_label tbm_style] tbm_tag:value];
    return self;
}

- (TBMLabelChain *)tbm_tint:(UIColor *)color {
    [[self.tbm_label tbm_style] tbm_tint:color];
    return self;
}

- (TBMLabelChain *)tbm_size:(CGSize)size {
    [[self.tbm_label tbm_style] tbm_size:size];
    return self;
}

- (TBMLabelChain *)tbm_pinEdgesTo:(UIView *)parent inset:(UIEdgeInsets)insets {
    [[self.tbm_label tbm_style] tbm_pinEdgesTo:parent inset:insets];
    return self;
}

- (TBMLabelChain *)tbm_pinCenterIn:(UIView *)parent {
    [[self.tbm_label tbm_style] tbm_pinCenterIn:parent];
    return self;
}

- (TBMLabelChain *)tbm_addTo:(UIView *)parent {
    [parent addSubview:self.tbm_label];
    return self;
}

@end

@implementation TBMLabel

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMLabelChain *))block {
    TBMLabel *label = [[TBMLabel alloc] initWithFrame:CGRectZero];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    if (block) {
        TBMLabelChain *chain = [[TBMLabelChain alloc] initWithLabel:label];
        block(chain);
    }
    return label;
}

@end
