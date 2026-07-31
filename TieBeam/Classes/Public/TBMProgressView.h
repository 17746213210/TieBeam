#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBMProgressViewChain : NSObject

@property (nonatomic, weak, readonly) UIProgressView *tbm_progressView;

- (TBMProgressViewChain *)tbm_progress:(float)value;
- (TBMProgressViewChain *)tbm_progressStyle:(UIProgressViewStyle)style;
- (TBMProgressViewChain *)tbm_tint:(UIColor *)color;
- (TBMProgressViewChain *)tbm_trackTint:(UIColor *)color;
- (TBMProgressViewChain *)tbm_alpha:(CGFloat)value;
- (TBMProgressViewChain *)tbm_hidden:(BOOL)value;
- (TBMProgressViewChain *)tbm_tag:(NSInteger)value;

- (TBMProgressViewChain *)tbm_size:(CGSize)size;
- (TBMProgressViewChain *)tbm_pinEdgesTo:(UIView *)parent inset:(UIEdgeInsets)insets;
- (TBMProgressViewChain *)tbm_addTo:(UIView *)parent;

@end

@interface TBMProgressView : UIProgressView

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMProgressViewChain *chain))block;

- (TBMProgressView *)tbm_setProgress:(float)value;

@end

NS_ASSUME_NONNULL_END
