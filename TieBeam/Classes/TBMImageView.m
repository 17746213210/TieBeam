#import "TBMImageView.h"
#import "UIView+TBMStyle.h"
#import "UIView+TBMPin.h"

@implementation TBMImageViewChain

- (instancetype)initWithImageView:(UIImageView *)imageView {
    self = [super init];
    if (self) {
        _tbm_imageView = imageView;
    }
    return self;
}

- (TBMImageViewChain *)tbm_image:(UIImage *)image {
    self.tbm_imageView.image = image;
    return self;
}

- (TBMImageViewChain *)tbm_highlightedImage:(UIImage *)image {
    self.tbm_imageView.highlightedImage = image;
    return self;
}

- (TBMImageViewChain *)tbm_highlighted:(BOOL)value {
    self.tbm_imageView.highlighted = value;
    return self;
}

- (TBMImageViewChain *)tbm_tint:(UIColor *)color {
    self.tbm_imageView.tintColor = color;
    return self;
}

- (TBMImageViewChain *)tbm_mode:(UIViewContentMode)mode {
    self.tbm_imageView.contentMode = mode;
    return self;
}

- (TBMImageViewChain *)tbm_radius:(CGFloat)value {
    [[self.tbm_imageView tbm_style] tbm_radius:value];
    return self;
}

- (TBMImageViewChain *)tbm_bg:(UIColor *)color {
    [[self.tbm_imageView tbm_style] tbm_bg:color];
    return self;
}

- (TBMImageViewChain *)tbm_borderColor:(UIColor *)color width:(CGFloat)width {
    [[self.tbm_imageView tbm_style] tbm_borderColor:color width:width];
    return self;
}

- (TBMImageViewChain *)tbm_shadow:(UIColor *)color {
    [[self.tbm_imageView tbm_style] tbm_shadow:color];
    return self;
}

- (TBMImageViewChain *)tbm_alpha:(CGFloat)value {
    [[self.tbm_imageView tbm_style] tbm_alpha:value];
    return self;
}

- (TBMImageViewChain *)tbm_hidden:(BOOL)value {
    [[self.tbm_imageView tbm_style] tbm_hidden:value];
    return self;
}

- (TBMImageViewChain *)tbm_clips:(BOOL)value {
    [[self.tbm_imageView tbm_style] tbm_clips:value];
    return self;
}

- (TBMImageViewChain *)tbm_userInteraction:(BOOL)value {
    [[self.tbm_imageView tbm_style] tbm_userInteraction:value];
    return self;
}

- (TBMImageViewChain *)tbm_tag:(NSInteger)value {
    [[self.tbm_imageView tbm_style] tbm_tag:value];
    return self;
}

- (TBMImageViewChain *)tbm_size:(CGSize)size {
    [[self.tbm_imageView tbm_style] tbm_size:size];
    return self;
}

- (TBMImageViewChain *)tbm_pinEdgesTo:(UIView *)parent inset:(UIEdgeInsets)insets {
    [[self.tbm_imageView tbm_style] tbm_pinEdgesTo:parent inset:insets];
    return self;
}

- (TBMImageViewChain *)tbm_pinCenterIn:(UIView *)parent {
    [[self.tbm_imageView tbm_style] tbm_pinCenterIn:parent];
    return self;
}

- (TBMImageViewChain *)tbm_addTo:(UIView *)parent {
    [parent addSubview:self.tbm_imageView];
    return self;
}

@end

@implementation TBMImageView

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMImageViewChain *))block {
    TBMImageView *imageView = [[TBMImageView alloc] initWithFrame:CGRectZero];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    if (block) {
        TBMImageViewChain *chain = [[TBMImageViewChain alloc] initWithImageView:imageView];
        block(chain);
    }
    return imageView;
}

@end
