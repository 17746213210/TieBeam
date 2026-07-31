#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBMSwitchChain : NSObject

@property (nonatomic, weak, readonly) UISwitch *tbm_switch;

- (TBMSwitchChain *)tbm_switchOn:(BOOL)value;
- (TBMSwitchChain *)tbm_switchOnTint:(UIColor *)color;
- (TBMSwitchChain *)tbm_thumbTint:(UIColor *)color;
- (TBMSwitchChain *)tbm_tint:(UIColor *)color;
- (TBMSwitchChain *)tbm_enabled:(BOOL)value;
- (TBMSwitchChain *)tbm_alpha:(CGFloat)value;
- (TBMSwitchChain *)tbm_hidden:(BOOL)value;
- (TBMSwitchChain *)tbm_tag:(NSInteger)value;
- (TBMSwitchChain *)tbm_action:(id)target selector:(SEL)selector;
- (TBMSwitchChain *)tbm_actionBlock:(void (^)(void))block;
- (TBMSwitchChain *)tbm_valueBlock:(void (^)(BOOL isOn))block;

- (TBMSwitchChain *)tbm_size:(CGSize)size;
- (TBMSwitchChain *)tbm_pinCenterIn:(UIView *)parent;
- (TBMSwitchChain *)tbm_addTo:(UIView *)parent;

@end

@interface TBMSwitch : UISwitch

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMSwitchChain *chain))block;

@end

NS_ASSUME_NONNULL_END
