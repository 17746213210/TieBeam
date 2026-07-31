#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, TBMAlertActionStyle) {
    TBMAlertActionStyleDefault = 0,
    TBMAlertActionStyleCancel,
    TBMAlertActionStyleDestructive,
};

@interface TBMAlertAction : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, assign, readonly) TBMAlertActionStyle style;
@property (nonatomic, copy, readonly, nullable) void (^handler)(void);

+ (instancetype)tbm_actionWithTitle:(NSString *)title
                              style:(TBMAlertActionStyle)style
                            handler:(void (^ _Nullable)(void))handler;

@end

NS_ASSUME_NONNULL_END
