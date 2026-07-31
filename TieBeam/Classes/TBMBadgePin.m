#import "TBMBadgePin.h"
#import "TBMLabel.h"
#import "UIView+TBMPin.h"
#import "UIView+TBMStyle.h"

@interface TBMBadgePin ()
@property (nonatomic, strong) TBMLabel *tbm_label;
@end

@implementation TBMBadgePin

+ (instancetype)tbm_pinOnView:(UIView *)anchor text:(NSString *)text {
    TBMBadgePin *badge = [[TBMBadgePin alloc] initWithFrame:CGRectZero];
    badge.translatesAutoresizingMaskIntoConstraints = NO;
    [[[[badge tbm_style]
        tbm_bg:[UIColor redColor]]
        tbm_radius:9]
        tbm_addTo:anchor];

    badge.tbm_label = [TBMLabel tbm_make:^(TBMLabelChain *chain) {
        [[[[[chain tbm_text:text]
            tbm_color:UIColor.whiteColor]
            tbm_font:[UIFont systemFontOfSize:11 weight:UIFontWeightBold]]
            tbm_align:NSTextAlignmentCenter]
            tbm_addTo:badge];
    }];
    [[badge.tbm_label tbm_style]
        tbm_pinEdgesTo:badge inset:UIEdgeInsetsMake(4, 4, 4, 4)];
    [[[[badge tbm_style]
        tbm_pinTopTrailingOf:anchor top:-4 trailing:4]
        tbm_minWidth:18]
        tbm_minHeight:18];
    return badge;
}

- (TBMBadgePin *)tbm_text:(NSString *)text {
    self.tbm_label.text = text;
    return self;
}

- (TBMBadgePin *)tbm_font:(UIFont *)font {
    self.tbm_label.font = font;
    return self;
}

- (TBMBadgePin *)tbm_fill:(UIColor *)color {
    [[self tbm_style] tbm_bg:color];
    return self;
}

- (TBMBadgePin *)tbm_textColor:(UIColor *)color {
    self.tbm_label.textColor = color;
    return self;
}

- (TBMBadgePin *)tbm_radius:(CGFloat)value {
    [[self tbm_style] tbm_radius:value];
    return self;
}

- (TBMBadgePin *)tbm_borderColor:(UIColor *)color width:(CGFloat)width {
    [[self tbm_style] tbm_borderColor:color width:width];
    return self;
}

- (TBMBadgePin *)tbm_alpha:(CGFloat)value {
    [[self tbm_style] tbm_alpha:value];
    return self;
}

- (TBMBadgePin *)tbm_hidden:(BOOL)value {
    [[self tbm_style] tbm_hidden:value];
    return self;
}

- (TBMBadgePin *)tbm_clips:(BOOL)value {
    [[self tbm_style] tbm_clips:value];
    return self;
}

- (TBMBadgePin *)tbm_userInteraction:(BOOL)value {
    [[self tbm_style] tbm_userInteraction:value];
    return self;
}

- (TBMBadgePin *)tbm_size:(CGSize)size {
    [[self tbm_style] tbm_size:size];
    return self;
}

@end
