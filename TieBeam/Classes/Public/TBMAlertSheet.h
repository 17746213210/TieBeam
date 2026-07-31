#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TBMAlertAction;

typedef NS_ENUM(NSInteger, TBMAlertStyle) {
    TBMAlertStyleAlert = 0,
    TBMAlertStyleActionSheet,
};

@interface TBMAlertSheet : NSObject

+ (void)tbm_showTitle:(nullable NSString *)title
              message:(nullable NSString *)message
                style:(TBMAlertStyle)style
                 inVC:(UIViewController *)controller
              actions:(NSArray<TBMAlertAction *> *)actions;

+ (void)tbm_showTitle:(nullable NSString *)title
              message:(nullable NSString *)message
                style:(TBMAlertStyle)style
                 inVC:(UIViewController *)controller
           sourceView:(nullable UIView *)sourceView
           sourceRect:(CGRect)sourceRect
        barButtonItem:(nullable UIBarButtonItem *)barButtonItem
              actions:(NSArray<TBMAlertAction *> *)actions;

@end

NS_ASSUME_NONNULL_END
