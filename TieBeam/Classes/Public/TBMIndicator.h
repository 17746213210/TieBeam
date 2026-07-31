#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBMIndicatorChain : NSObject

@property (nonatomic, weak, readonly) UIActivityIndicatorView *tbm_indicator;

- (TBMIndicatorChain *)tbm_style:(UIActivityIndicatorViewStyle)style;
- (TBMIndicatorChain *)tbm_color:(UIColor *)color;
- (TBMIndicatorChain *)tbm_hidesWhenStopped:(BOOL)value;
- (TBMIndicatorChain *)tbm_start;
- (TBMIndicatorChain *)tbm_stop;
- (TBMIndicatorChain *)tbm_alpha:(CGFloat)value;
- (TBMIndicatorChain *)tbm_hidden:(BOOL)value;
- (TBMIndicatorChain *)tbm_tag:(NSInteger)value;

- (TBMIndicatorChain *)tbm_size:(CGSize)size;
- (TBMIndicatorChain *)tbm_pinCenterIn:(UIView *)parent;
- (TBMIndicatorChain *)tbm_addTo:(UIView *)parent;

@end

@interface TBMIndicator : UIActivityIndicatorView

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMIndicatorChain *chain))block;

@end

NS_ASSUME_NONNULL_END
