#import "TBMBlockTarget.h"

@implementation TBMBlockTarget

- (void)tbm_invoke {
    if (self.tbm_block) {
        self.tbm_block();
    }
}

@end
