#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, TBMToastPosition) {
    TBMToastPositionTop = 0,
    TBMToastPositionCenter,
    TBMToastPositionBottom,
};

@interface TBMToast : NSObject

+ (void)tbm_showText:(NSString *)text inView:(UIView *)view;
+ (void)tbm_showText:(NSString *)text inView:(UIView *)view duration:(NSTimeInterval)duration;
+ (void)tbm_showText:(NSString *)text inView:(UIView *)view position:(TBMToastPosition)position;
+ (void)tbm_showText:(NSString *)text inView:(UIView *)view duration:(NSTimeInterval)duration position:(TBMToastPosition)position;

@end

NS_ASSUME_NONNULL_END
