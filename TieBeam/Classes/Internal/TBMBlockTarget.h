#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TBMBlockTarget : NSObject

@property (nonatomic, copy, nullable) void (^tbm_block)(void);

- (void)tbm_invoke;

@end

NS_ASSUME_NONNULL_END
