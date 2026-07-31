#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBMLabelChain : NSObject

@property (nonatomic, weak, readonly) UILabel *tbm_label;

- (TBMLabelChain *)tbm_text:(NSString *)text;
- (TBMLabelChain *)tbm_attributed:(NSAttributedString *)text;
- (TBMLabelChain *)tbm_color:(UIColor *)color;
- (TBMLabelChain *)tbm_highlightedColor:(UIColor *)color;
- (TBMLabelChain *)tbm_font:(UIFont *)font;
- (TBMLabelChain *)tbm_align:(NSTextAlignment)alignment;
- (TBMLabelChain *)tbm_lines:(NSInteger)lines;
- (TBMLabelChain *)tbm_lineBreak:(NSLineBreakMode)mode;
- (TBMLabelChain *)tbm_baseline:(UIBaselineAdjustment)adjustment;
- (TBMLabelChain *)tbm_adjustsFont:(BOOL)value;
- (TBMLabelChain *)tbm_minScale:(CGFloat)value;
- (TBMLabelChain *)tbm_preferredWidth:(CGFloat)value;
- (TBMLabelChain *)tbm_textShadow:(UIColor *)color offset:(CGSize)offset;

- (TBMLabelChain *)tbm_bg:(UIColor *)color;
- (TBMLabelChain *)tbm_radius:(CGFloat)value;
- (TBMLabelChain *)tbm_borderColor:(UIColor *)color width:(CGFloat)width;
- (TBMLabelChain *)tbm_shadow:(UIColor *)color;
- (TBMLabelChain *)tbm_alpha:(CGFloat)value;
- (TBMLabelChain *)tbm_hidden:(BOOL)value;
- (TBMLabelChain *)tbm_clips:(BOOL)value;
- (TBMLabelChain *)tbm_userInteraction:(BOOL)value;
- (TBMLabelChain *)tbm_tag:(NSInteger)value;
- (TBMLabelChain *)tbm_tint:(UIColor *)color;

- (TBMLabelChain *)tbm_size:(CGSize)size;
- (TBMLabelChain *)tbm_pinEdgesTo:(UIView *)parent inset:(UIEdgeInsets)insets;
- (TBMLabelChain *)tbm_pinCenterIn:(UIView *)parent;
- (TBMLabelChain *)tbm_addTo:(UIView *)parent;

@end

@interface TBMLabel : UILabel

+ (instancetype)tbm_make:(void (NS_NOESCAPE ^)(TBMLabelChain *chain))block;

@end

NS_ASSUME_NONNULL_END
