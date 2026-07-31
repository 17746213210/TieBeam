#import "TBMSlider.h"
#import "TBMBlockTarget.h"
#import "UIView+TBMStyle.h"
#import "UIView+TBMPin.h"
#import <objc/runtime.h>

static char kTBMSliderBlockTargetKey;
static char kTBMSliderValueTargetKey;

@interface TBMSliderValueTarget : NSObject
@property (nonatomic, weak) UISlider *tbm_slider;
@property (nonatomic, copy) void (^tbm_block)(float value);
- (void)tbm_changed;
@end

@implementation TBMSliderValueTarget

- (void)tbm_changed {
    if (self.tbm_block && self.tbm_slider) {
        self.tbm_block(self.tbm_slider.value);
    }
}

@end

@implementation TBMSliderChain

- (instancetype)initWithSlider:(UISlider *)slider {
    self = [super init];
    if (self) {
        _tbm_slider = slider;
    }
    return self;
}

- (TBMSliderChain *)tbm_value:(float)value {
    self.tbm_slider.value = value;
    return self;
}

- (TBMSliderChain *)tbm_min:(float)value {
    self.tbm_slider.minimumValue = value;
    return self;
}

- (TBMSliderChain *)tbm_max:(float)value {
    self.tbm_slider.maximumValue = value;
    return self;
}

- (TBMSliderChain *)tbm_continuous:(BOOL)value {
    self.tbm_slider.continuous = value;
    return self;
}

- (TBMSliderChain *)tbm_minTint:(UIColor *)color {
    self.tbm_slider.minimumTrackTintColor = color;
    return self;
}

- (TBMSliderChain *)tbm_maxTint:(UIColor *)color {
    self.tbm_slider.maximumTrackTintColor = color;
    return self;
}

- (TBMSliderChain *)tbm_thumbTint:(UIColor *)color {
    self.tbm_slider.thumbTintColor = color;
    return self;
}

- (TBMSliderChain *)tbm_tint:(UIColor *)color {
    self.tbm_slider.tintColor = color;
    return self;
}

- (TBMSliderChain *)tbm_enabled:(BOOL)value {
    self.tbm_slider.enabled = value;
    return self;
}

- (TBMSliderChain *)tbm_alpha:(CGFloat)value {
    [[self.tbm_slider tbm_style] tbm_alpha:value];
    return self;
}

- (TBMSliderChain *)tbm_hidden:(BOOL)value {
    [[self.tbm_slider tbm_style] tbm_hidden:value];
    return self;
}

- (TBMSliderChain *)tbm_tag:(NSInteger)value {
    [[self.tbm_slider tbm_style] tbm_tag:value];
    return self;
}

- (TBMSliderChain *)tbm_action:(id)target selector:(SEL)selector {
    [self.tbm_slider addTarget:target action:selector forControlEvents:UIControlEventValueChanged];
    return self;
}

- (TBMSliderChain *)tbm_actionBlock:(void (^)(void))block {
    TBMBlockTarget *target = [[TBMBlockTarget alloc] init];
    target.tbm_block = block;
    objc_setAssociatedObject(self.tbm_slider, &kTBMSliderBlockTargetKey, target, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self.tbm_slider addTarget:target action:@selector(tbm_invoke) forControlEvents:UIControlEventValueChanged];
    return self;
}

- (TBMSliderChain *)tbm_valueBlock:(void (^)(float))block {
    TBMSliderValueTarget *target = [[TBMSliderValueTarget alloc] init];
    target.tbm_slider = self.tbm_slider;
    target.tbm_block = block;
    objc_setAssociatedObject(self.tbm_slider, &kTBMSliderValueTargetKey, target, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self.tbm_slider addTarget:target action:@selector(tbm_changed) forControlEvents:UIControlEventValueChanged];
    return self;
}

- (TBMSliderChain *)tbm_size:(CGSize)size {
    [[self.tbm_slider tbm_style] tbm_size:size];
    return self;
}

- (TBMSliderChain *)tbm_pinEdgesTo:(UIView *)parent inset:(UIEdgeInsets)insets {
    [[self.tbm_slider tbm_style] tbm_pinEdgesTo:parent inset:insets];
    return self;
}

- (TBMSliderChain *)tbm_addTo:(UIView *)parent {
    [parent addSubview:self.tbm_slider];
    return self;
}

@end

@implementation TBMSlider

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMSliderChain *))block {
    TBMSlider *slider = [[TBMSlider alloc] initWithFrame:CGRectZero];
    slider.translatesAutoresizingMaskIntoConstraints = NO;
    if (block) {
        TBMSliderChain *chain = [[TBMSliderChain alloc] initWithSlider:slider];
        block(chain);
    }
    return slider;
}

@end
