#import "TBMAlertAction.h"

@interface TBMAlertAction ()
@property (nonatomic, copy, readwrite) NSString *title;
@property (nonatomic, assign, readwrite) TBMAlertActionStyle style;
@property (nonatomic, copy, readwrite, nullable) void (^handler)(void);
@end

@implementation TBMAlertAction

+ (instancetype)tbm_actionWithTitle:(NSString *)title
                              style:(TBMAlertActionStyle)style
                            handler:(void (^)(void))handler {
    TBMAlertAction *action = [[TBMAlertAction alloc] init];
    action.title = title ?: @"";
    action.style = style;
    action.handler = handler;
    return action;
}

@end
