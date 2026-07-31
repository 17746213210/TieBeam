#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBMSliderChain : NSObject

@property (nonatomic, weak, readonly) UISlider *tbm_slider;

- (TBMSliderChain *)tbm_value:(float)value;
- (TBMSliderChain *)tbm_min:(float)value;
- (TBMSliderChain *)tbm_max:(float)value;
- (TBMSliderChain *)tbm_continuous:(BOOL)value;
- (TBMSliderChain *)tbm_minTint:(UIColor *)color;
- (TBMSliderChain *)tbm_maxTint:(UIColor *)color;
- (TBMSliderChain *)tbm_thumbTint:(UIColor *)color;
- (TBMSliderChain *)tbm_tint:(UIColor *)color;
- (TBMSliderChain *)tbm_enabled:(BOOL)value;
- (TBMSliderChain *)tbm_alpha:(CGFloat)value;
- (TBMSliderChain *)tbm_hidden:(BOOL)value;
- (TBMSliderChain *)tbm_tag:(NSInteger)value;
- (TBMSliderChain *)tbm_action:(id)target selector:(SEL)selector;
- (TBMSliderChain *)tbm_actionBlock:(void (^)(void))block;
- (TBMSliderChain *)tbm_valueBlock:(void (^)(float value))block;

- (TBMSliderChain *)tbm_size:(CGSize)size;
- (TBMSliderChain *)tbm_pinEdgesTo:(UIView *)parent inset:(UIEdgeInsets)insets;
- (TBMSliderChain *)tbm_addTo:(UIView *)parent;

@end

@interface TBMSlider : UISlider

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMSliderChain *chain))block;

@end

NS_ASSUME_NONNULL_END
