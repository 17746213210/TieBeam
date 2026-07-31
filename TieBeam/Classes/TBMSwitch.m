#import "TBMSwitch.h"
#import "TBMBlockTarget.h"
#import "UIView+TBMStyle.h"
#import "UIView+TBMPin.h"
#import <objc/runtime.h>

static char kTBMSwitchBlockTargetKey;
static char kTBMSwitchValueTargetKey;

@interface TBMSwitchValueTarget : NSObject
@property (nonatomic, weak) UISwitch *tbm_switch;
@property (nonatomic, copy) void (^tbm_block)(BOOL isOn);
- (void)tbm_changed;
@end

@implementation TBMSwitchValueTarget

- (void)tbm_changed {
    if (self.tbm_block && self.tbm_switch) {
        self.tbm_block(self.tbm_switch.isOn);
    }
}

@end

@implementation TBMSwitchChain

- (instancetype)initWithSwitch:(UISwitch *)switchControl {
    self = [super init];
    if (self) {
        _tbm_switch = switchControl;
    }
    return self;
}

- (TBMSwitchChain *)tbm_switchOn:(BOOL)value {
    self.tbm_switch.on = value;
    return self;
}

- (TBMSwitchChain *)tbm_switchOnTint:(UIColor *)color {
    self.tbm_switch.onTintColor = color;
    return self;
}

- (TBMSwitchChain *)tbm_thumbTint:(UIColor *)color {
    self.tbm_switch.thumbTintColor = color;
    return self;
}

- (TBMSwitchChain *)tbm_tint:(UIColor *)color {
    self.tbm_switch.tintColor = color;
    return self;
}

- (TBMSwitchChain *)tbm_enabled:(BOOL)value {
    self.tbm_switch.enabled = value;
    return self;
}

- (TBMSwitchChain *)tbm_alpha:(CGFloat)value {
    [[self.tbm_switch tbm_style] tbm_alpha:value];
    return self;
}

- (TBMSwitchChain *)tbm_hidden:(BOOL)value {
    [[self.tbm_switch tbm_style] tbm_hidden:value];
    return self;
}

- (TBMSwitchChain *)tbm_tag:(NSInteger)value {
    [[self.tbm_switch tbm_style] tbm_tag:value];
    return self;
}

- (TBMSwitchChain *)tbm_action:(id)target selector:(SEL)selector {
    [self.tbm_switch addTarget:target action:selector forControlEvents:UIControlEventValueChanged];
    return self;
}

- (TBMSwitchChain *)tbm_actionBlock:(void (^)(void))block {
    TBMBlockTarget *target = [[TBMBlockTarget alloc] init];
    target.tbm_block = block;
    objc_setAssociatedObject(self.tbm_switch, &kTBMSwitchBlockTargetKey, target, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self.tbm_switch addTarget:target action:@selector(tbm_invoke) forControlEvents:UIControlEventValueChanged];
    return self;
}

- (TBMSwitchChain *)tbm_valueBlock:(void (^)(BOOL))block {
    TBMSwitchValueTarget *target = [[TBMSwitchValueTarget alloc] init];
    target.tbm_switch = self.tbm_switch;
    target.tbm_block = block;
    objc_setAssociatedObject(self.tbm_switch, &kTBMSwitchValueTargetKey, target, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self.tbm_switch addTarget:target action:@selector(tbm_changed) forControlEvents:UIControlEventValueChanged];
    return self;
}

- (TBMSwitchChain *)tbm_size:(CGSize)size {
    [[self.tbm_switch tbm_style] tbm_size:size];
    return self;
}

- (TBMSwitchChain *)tbm_pinCenterIn:(UIView *)parent {
    [[self.tbm_switch tbm_style] tbm_pinCenterIn:parent];
    return self;
}

- (TBMSwitchChain *)tbm_addTo:(UIView *)parent {
    [parent addSubview:self.tbm_switch];
    return self;
}

@end

@implementation TBMSwitch

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMSwitchChain *))block {
    TBMSwitch *switchControl = [[TBMSwitch alloc] initWithFrame:CGRectZero];
    switchControl.translatesAutoresizingMaskIntoConstraints = NO;
    if (block) {
        TBMSwitchChain *chain = [[TBMSwitchChain alloc] initWithSwitch:switchControl];
        block(chain);
    }
    return switchControl;
}

@end
