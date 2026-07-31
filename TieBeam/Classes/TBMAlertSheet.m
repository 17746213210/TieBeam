#import "TBMAlertSheet.h"
#import "TBMAlertAction.h"
#import "TBMLabel.h"
#import "TBMButton.h"
#import "TBMStackHub.h"
#import "TBMDividerLine.h"
#import "UIView+TBMPin.h"

static NSInteger const kTBMAlertActionBaseTag = 94000;

static UIColor *TBMAlertPanelColor(void) {
    if (@available(iOS 13.0, *)) {
        return UIColor.secondarySystemGroupedBackgroundColor;
    }
    return UIColor.whiteColor;
}

static UIColor *TBMAlertTitleColor(void) {
    if (@available(iOS 13.0, *)) {
        return UIColor.labelColor;
    }
    return UIColor.blackColor;
}

static UIColor *TBMAlertMessageColor(void) {
    if (@available(iOS 13.0, *)) {
        return UIColor.secondaryLabelColor;
    }
    return UIColor.darkGrayColor;
}

static UIColor *TBMAlertAccentColor(void) {
    if (@available(iOS 13.0, *)) {
        return UIColor.systemBlueColor;
    }
    return [UIColor colorWithRed:0.12 green:0.45 blue:0.98 alpha:1];
}

static UIColor *TBMAlertDestructiveColor(void) {
    if (@available(iOS 13.0, *)) {
        return UIColor.systemRedColor;
    }
    return UIColor.redColor;
}

@interface TBMAlertPresenterViewController : UIViewController

@property (nonatomic, copy, nullable) NSString *tbm_titleText;
@property (nonatomic, copy, nullable) NSString *tbm_messageText;
@property (nonatomic, assign) TBMAlertStyle tbm_style;
@property (nonatomic, copy) NSArray<TBMAlertAction *> *tbm_actions;
@property (nonatomic, weak, nullable) UIView *tbm_sourceView;
@property (nonatomic, assign) CGRect tbm_sourceRect;
@property (nonatomic, weak, nullable) UIBarButtonItem *tbm_barButtonItem;
@property (nonatomic, assign) BOOL tbm_usesPopover;
@property (nonatomic, strong) UIView *tbm_dimView;
@property (nonatomic, strong) UIView *tbm_panelView;

@end

@implementation TBMAlertPresenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.clearColor;

    if (self.tbm_usesPopover) {
        [self tbm_buildPopoverContent];
        return;
    }

    self.tbm_dimView = [[UIView alloc] initWithFrame:CGRectZero];
    self.tbm_dimView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tbm_dimView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.35];
    self.tbm_dimView.alpha = 0;
    [self.view addSubview:self.tbm_dimView];
    [[self.tbm_dimView tbm_style] tbm_pinEdgesTo:self.view inset:UIEdgeInsetsZero];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tbm_dimTapped)];
    [self.tbm_dimView addGestureRecognizer:tap];

    if (self.tbm_style == TBMAlertStyleAlert) {
        [self tbm_buildAlertContent];
    } else {
        [self tbm_buildPhoneActionSheetContent];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.tbm_usesPopover) {
        return;
    }
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.tbm_dimView.alpha = 1;
        self.tbm_panelView.alpha = 1;
        self.tbm_panelView.transform = CGAffineTransformIdentity;
    } completion:nil];
}

- (NSArray<TBMAlertAction *> *)tbm_regularActions {
    NSMutableArray<TBMAlertAction *> *items = [NSMutableArray array];
    for (TBMAlertAction *action in self.tbm_actions) {
        if (action.style != TBMAlertActionStyleCancel) {
            [items addObject:action];
        }
    }
    return items;
}

- (nullable TBMAlertAction *)tbm_cancelAction {
    for (TBMAlertAction *action in self.tbm_actions) {
        if (action.style == TBMAlertActionStyleCancel) {
            return action;
        }
    }
    return nil;
}

- (UIColor *)tbm_colorForAction:(TBMAlertAction *)action {
    switch (action.style) {
        case TBMAlertActionStyleDestructive:
            return TBMAlertDestructiveColor();
        case TBMAlertActionStyleCancel:
            return TBMAlertTitleColor();
        case TBMAlertActionStyleDefault:
        default:
            return TBMAlertAccentColor();
    }
}

- (UIFont *)tbm_fontForAction:(TBMAlertAction *)action {
    if (action.style == TBMAlertActionStyleCancel) {
        return [UIFont systemFontOfSize:16 weight:UIFontWeightSemibold];
    }
    return [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
}

- (UIView *)tbm_makeHeaderStack {
    NSMutableArray<UIView *> *items = [NSMutableArray array];
    if (self.tbm_titleText.length > 0) {
        TBMLabel *title = [TBMLabel tbm_make:^(TBMLabelChain *chain) {
            [[[[[chain tbm_text:self.tbm_titleText]
                tbm_font:[UIFont systemFontOfSize:17 weight:UIFontWeightSemibold]]
                tbm_color:TBMAlertTitleColor()]
                tbm_align:NSTextAlignmentCenter]
                tbm_lines:0];
        }];
        [items addObject:title];
    }
    if (self.tbm_messageText.length > 0) {
        TBMLabel *message = [TBMLabel tbm_make:^(TBMLabelChain *chain) {
            [[[[[chain tbm_text:self.tbm_messageText]
                tbm_font:[UIFont systemFontOfSize:14]]
                tbm_color:TBMAlertMessageColor()]
                tbm_align:NSTextAlignmentCenter]
                tbm_lines:0];
        }];
        [items addObject:message];
    }
    if (items.count == 0) {
        return [[UIView alloc] initWithFrame:CGRectZero];
    }
    return [TBMStackHub tbm_vertical:^(TBMStackHub *stack) {
        [stack tbm_spacing:8];
        [stack tbm_views:items];
    }];
}

- (TBMButton *)tbm_makeButtonForAction:(TBMAlertAction *)action {
    __weak typeof(self) weakSelf = self;
    NSInteger index = [self.tbm_actions indexOfObject:action];
    if (index == NSNotFound) {
        index = 0;
    }
    TBMButton *button = [TBMButton tbm_make:^(TBMButtonChain *chain) {
        [[[[[[chain tbm_title:action.title]
            tbm_titleColor:[weakSelf tbm_colorForAction:action]]
            tbm_font:[weakSelf tbm_fontForAction:action]]
            tbm_bg:UIColor.clearColor]
            tbm_radius:0]
            tbm_action:weakSelf selector:@selector(tbm_actionTapped:)];
    }];
    button.tag = kTBMAlertActionBaseTag + index;
    [button.heightAnchor constraintEqualToConstant:48].active = YES;
    return button;
}

- (UIView *)tbm_makeHorizontalActionRow:(NSArray<TBMAlertAction *> *)actions {
    TBMButton *leading = [self tbm_makeButtonForAction:actions[0]];
    TBMButton *trailing = [self tbm_makeButtonForAction:actions[1]];

    UIView *separator = [[UIView alloc] initWithFrame:CGRectZero];
    separator.translatesAutoresizingMaskIntoConstraints = NO;
    separator.backgroundColor = [UIColor colorWithWhite:0.85 alpha:1.0];
    [separator.widthAnchor constraintEqualToConstant:1.0 / UIScreen.mainScreen.scale].active = YES;
    [separator setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [separator setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];

    UIView *row = [TBMStackHub tbm_horizontal:^(TBMStackHub *stack) {
        [stack tbm_spacing:0];
        [stack tbm_alignment:UIStackViewAlignmentFill];
        [stack tbm_distribution:UIStackViewDistributionFill];
        [stack tbm_views:@[leading, separator, trailing]];
    }];
    [leading.widthAnchor constraintEqualToAnchor:trailing.widthAnchor].active = YES;
    [row.heightAnchor constraintEqualToConstant:48].active = YES;
    return row;
}

- (UIView *)tbm_makeActionStack:(NSArray<TBMAlertAction *> *)actions horizontal:(BOOL)horizontal {
    if (horizontal && actions.count == 2) {
        return [self tbm_makeHorizontalActionRow:actions];
    }

    NSMutableArray<UIView *> *rows = [NSMutableArray array];
    for (NSInteger i = 0; i < actions.count; i++) {
        TBMAlertAction *action = actions[i];
        if (rows.count > 0) {
            [rows addObject:[TBMDividerLine tbm_defaultLine]];
        }
        [rows addObject:[self tbm_makeButtonForAction:action]];
    }
    return [TBMStackHub tbm_vertical:^(TBMStackHub *stack) {
        [stack tbm_spacing:0];
        [stack tbm_views:rows];
    }];
}

- (UIView *)tbm_makePanelWithBody:(UIView *)body
                       actionArea:(UIView *)actionArea
                      includeBody:(BOOL)includeBody {
    UIView *panel = [[UIView alloc] initWithFrame:CGRectZero];
    panel.translatesAutoresizingMaskIntoConstraints = NO;
    [[[panel tbm_style]
        tbm_bg:TBMAlertPanelColor()]
        tbm_radius:14];

    UIView *content = [TBMStackHub tbm_vertical:^(TBMStackHub *stack) {
        NSMutableArray<UIView *> *items = [NSMutableArray array];
        if (includeBody) {
            UIView *headerWrap = [[UIView alloc] initWithFrame:CGRectZero];
            headerWrap.translatesAutoresizingMaskIntoConstraints = NO;
            [headerWrap addSubview:body];
            [[body tbm_style] tbm_pinEdgesTo:headerWrap inset:UIEdgeInsetsMake(0, 16, 16, 16)];
            [items addObject:headerWrap];
        }
        if (actionArea.subviews.count > 0 || [actionArea isKindOfClass:[UIStackView class]]) {
            if (items.count > 0) {
                [items addObject:[TBMDividerLine tbm_defaultLine]];
            }
            [items addObject:actionArea];
        }
        [stack tbm_spacing:0];
        [stack tbm_padding:UIEdgeInsetsMake(16, 0, 0, 0)];
        [stack tbm_views:items];
    }];
    [panel addSubview:content];
    [[content tbm_style] tbm_pinEdgesTo:panel inset:UIEdgeInsetsZero];
    return panel;
}

- (void)tbm_buildAlertContent {
    NSArray<TBMAlertAction *> *actions = self.tbm_regularActions;
    TBMAlertAction *cancel = [self tbm_cancelAction];
    NSMutableArray<TBMAlertAction *> *allActions = [actions mutableCopy];
    if (cancel) {
        [allActions addObject:cancel];
    }
    if (allActions.count == 0) {
        allActions = [@[ [TBMAlertAction tbm_actionWithTitle:@"OK" style:TBMAlertActionStyleDefault handler:nil] ] mutableCopy];
    }

    UIView *header = [self tbm_makeHeaderStack];
    BOOL horizontal = allActions.count == 2;
    UIView *actionArea = [self tbm_makeActionStack:allActions horizontal:horizontal];

    BOOL hasHeader = self.tbm_titleText.length > 0 || self.tbm_messageText.length > 0;
    self.tbm_panelView = [self tbm_makePanelWithBody:header actionArea:actionArea includeBody:hasHeader];
    self.tbm_panelView.alpha = 0;
    self.tbm_panelView.transform = CGAffineTransformMakeScale(0.92, 0.92);
    [self.view addSubview:self.tbm_panelView];

    [NSLayoutConstraint activateConstraints:@[
        [self.tbm_panelView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor],
        [self.tbm_panelView.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor],
        [self.tbm_panelView.widthAnchor constraintEqualToConstant:300],
        [self.tbm_panelView.widthAnchor constraintLessThanOrEqualToAnchor:self.view.widthAnchor constant:-48],
    ]];
}

- (void)tbm_buildPhoneActionSheetContent {
    NSArray<TBMAlertAction *> *actions = self.tbm_regularActions;
    TBMAlertAction *cancel = [self tbm_cancelAction];
    if (actions.count == 0 && !cancel) {
        actions = @[ [TBMAlertAction tbm_actionWithTitle:@"OK" style:TBMAlertActionStyleDefault handler:nil] ];
    }

    UIView *header = [self tbm_makeHeaderStack];
    BOOL hasHeader = self.tbm_titleText.length > 0 || self.tbm_messageText.length > 0;
    UIView *mainPanel = [self tbm_makePanelWithBody:header
                                         actionArea:[self tbm_makeActionStack:actions horizontal:NO]
                                        includeBody:hasHeader];

    UIView *container = [TBMStackHub tbm_vertical:^(TBMStackHub *stack) {
        NSMutableArray<UIView *> *items = [NSMutableArray arrayWithObject:mainPanel];
        if (cancel) {
            UIView *cancelPanel = [[UIView alloc] initWithFrame:CGRectZero];
            cancelPanel.translatesAutoresizingMaskIntoConstraints = NO;
            [[[cancelPanel tbm_style]
                tbm_bg:TBMAlertPanelColor()]
                tbm_radius:14];
            TBMButton *cancelButton = [self tbm_makeButtonForAction:cancel];
            [cancelPanel addSubview:cancelButton];
            [[cancelButton tbm_style] tbm_pinEdgesTo:cancelPanel inset:UIEdgeInsetsZero];
            [items addObject:cancelPanel];
        }
        [stack tbm_spacing:8];
        [stack tbm_views:items];
    }];

    self.tbm_panelView = container;
    self.tbm_panelView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tbm_panelView.alpha = 0;
    self.tbm_panelView.transform = CGAffineTransformMakeTranslation(0, 320);
    [self.view addSubview:self.tbm_panelView];

    [NSLayoutConstraint activateConstraints:@[
        [self.tbm_panelView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:12],
        [self.tbm_panelView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-12],
        [self.tbm_panelView.bottomAnchor constraintEqualToAnchor:self.view.safeAreaLayoutGuide.bottomAnchor constant:-8],
    ]];
}

- (void)tbm_buildPopoverContent {
    NSArray<TBMAlertAction *> *actions = self.tbm_regularActions;
    TBMAlertAction *cancel = [self tbm_cancelAction];
    NSMutableArray<TBMAlertAction *> *allActions = [actions mutableCopy];
    if (cancel) {
        [allActions addObject:cancel];
    }
    if (allActions.count == 0) {
        allActions = [@[ [TBMAlertAction tbm_actionWithTitle:@"OK" style:TBMAlertActionStyleDefault handler:nil] ] mutableCopy];
    }

    UIView *header = [self tbm_makeHeaderStack];
    UIView *actionArea = [self tbm_makeActionStack:allActions horizontal:NO];
    BOOL hasHeader = self.tbm_titleText.length > 0 || self.tbm_messageText.length > 0;
    UIView *panel = [self tbm_makePanelWithBody:header actionArea:actionArea includeBody:hasHeader];
    panel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:panel];
    [[panel tbm_style] tbm_pinEdgesTo:self.view inset:UIEdgeInsetsZero];

    CGFloat height = 16 + (self.tbm_titleText.length > 0 ? 24 : 0) + (self.tbm_messageText.length > 0 ? 36 : 0);
    height += allActions.count * 49;
    if (self.tbm_titleText.length > 0 && self.tbm_messageText.length > 0) {
        height += 8;
    }
    self.preferredContentSize = CGSizeMake(320, MAX(height, 120));
}

- (void)tbm_actionTapped:(TBMButton *)sender {
    NSInteger index = sender.tag - kTBMAlertActionBaseTag;
    TBMAlertAction *action = nil;
    if (index >= 0 && index < (NSInteger)self.tbm_actions.count) {
        action = self.tbm_actions[index];
    }
    [self tbm_dismissWithAction:action];
}

- (void)tbm_dimTapped {
    TBMAlertAction *cancel = [self tbm_cancelAction];
    if (cancel) {
        [self tbm_dismissWithAction:cancel];
    }
}

- (void)tbm_dismissWithAction:(nullable TBMAlertAction *)action {
    void (^handler)(void) = action.handler;
    if (self.tbm_usesPopover) {
        [self dismissViewControllerAnimated:YES completion:^{
            if (handler) {
                handler();
            }
        }];
        return;
    }
    [UIView animateWithDuration:0.2 animations:^{
        self.tbm_dimView.alpha = 0;
        if (self.tbm_style == TBMAlertStyleAlert) {
            self.tbm_panelView.alpha = 0;
            self.tbm_panelView.transform = CGAffineTransformMakeScale(0.92, 0.92);
        } else {
            self.tbm_panelView.alpha = 0;
            self.tbm_panelView.transform = CGAffineTransformMakeTranslation(0, 320);
        }
    } completion:^(BOOL finished) {
        [self dismissViewControllerAnimated:NO completion:^{
            if (handler) {
                handler();
            }
        }];
    }];
}

@end

@implementation TBMAlertSheet

+ (void)tbm_showTitle:(NSString *)title
              message:(NSString *)message
                style:(TBMAlertStyle)style
                 inVC:(UIViewController *)controller
              actions:(NSArray<TBMAlertAction *> *)actions {
    [self tbm_showTitle:title
                message:message
                  style:style
                   inVC:controller
             sourceView:nil
             sourceRect:CGRectZero
          barButtonItem:nil
                actions:actions];
}

+ (void)tbm_showTitle:(NSString *)title
              message:(NSString *)message
                style:(TBMAlertStyle)style
                 inVC:(UIViewController *)controller
           sourceView:(UIView *)sourceView
           sourceRect:(CGRect)sourceRect
        barButtonItem:(UIBarButtonItem *)barButtonItem
              actions:(NSArray<TBMAlertAction *> *)actions {
    if (!controller) {
        return;
    }

    TBMAlertPresenterViewController *presenter = [[TBMAlertPresenterViewController alloc] init];
    presenter.tbm_titleText = title;
    presenter.tbm_messageText = message;
    presenter.tbm_style = style;
    presenter.tbm_actions = actions ?: @[];
    presenter.tbm_sourceView = sourceView;
    presenter.tbm_sourceRect = sourceRect;
    presenter.tbm_barButtonItem = barButtonItem;

    BOOL isPad = UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad;
    BOOL wantsPopover = style == TBMAlertStyleActionSheet && isPad && (sourceView || barButtonItem);
    presenter.tbm_usesPopover = wantsPopover;

    if (wantsPopover) {
        presenter.modalPresentationStyle = UIModalPresentationPopover;
        UIPopoverPresentationController *popover = presenter.popoverPresentationController;
        if (sourceView) {
            popover.sourceView = sourceView;
            popover.sourceRect = CGRectIsEmpty(sourceRect) ? sourceView.bounds : sourceRect;
        } else {
            popover.barButtonItem = barButtonItem;
        }
        popover.permittedArrowDirections = UIPopoverArrowDirectionAny;
    } else {
        presenter.modalPresentationStyle = UIModalPresentationOverFullScreen;
        presenter.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    }

    [controller presentViewController:presenter animated:YES completion:nil];
}

@end
