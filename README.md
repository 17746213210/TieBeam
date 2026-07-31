# TieBeam

Objective-C 链式 UIKit 组件库，仅依赖 UIKit。布局请用系统 Auto Layout 或 Masonry，TieBeam 只负责 UI 组件本身。

## 安装

```ruby
pod 'TieBeam', :git => 'https://github.com/17746213210/TieBeam.git', :tag => '1.0.0'
```

iOS 12.0+

## 组件链

```objc
#import <TieBeam/TieBeam.h>

TBMLabel *title = [TBMLabel tbm_make:^(TBMLabelChain *c) {
    [[[[c tbm_text:@"Hello"]
        tbm_font:[UIFont boldSystemFontOfSize:18]]
        tbm_color:UIColor.blackColor]
        tbm_addTo:self.view];
}];

TBMButton *btn = [TBMButton tbm_make:^(TBMButtonChain *c) {
    [[[[[c tbm_title:@"提交"]
        tbm_titleColor:UIColor.whiteColor]
        tbm_bg:[UIColor systemBlueColor]]
        tbm_radius:10]
        tbm_addTo:self.view];
}];
```

| 组件 | 链式能力（常用） |
|------|------------------|
| `TBMLabel` | 文本 / 富文本 / 字体 / 对齐 / 行数 / 换行 / 字阴影 / 背景 / 圆角 / 边框 / 布局 pin |
| `TBMButton` | 多态标题·颜色·图片·背景 / 圆角 / 边框 / 内边距 / 选中态 / 事件 / 布局 pin |
| `TBMTextField` | 占位·字色 / 键盘 / 回车 / 密文 / delegate / 左右视图 / 输入框·附件 / focus / 样式 / pin |
| `TBMImageView` | 图片 / 高亮 / 着色 / 模式 / 圆角 / 背景 / 边框 / pin |
| `TBMCardView` | 填充 / 圆角 / 四边 padding / 边框 / 阴影 / 内容容器 / pin |
| `TBMStackHub` | 轴向 / 间距 / 边距 / 对齐 / 分布 / 自定义间距 / 背景 / 圆角 / Scroll 内容 |
| `TBMDividerLine` | 颜色 / 粗细 / 透明度 / addTo |
| `TBMBadgePin` | 文本 / 字体 / 填充 / 字色 / 圆角 / 边框 / 尺寸 |
| `TBMTextView` | 多行文本 / delegate / 键盘 / 内边距 / 样式 / pin |
| `TBMSwitch` | 开关 / 着色 / valueBlock / pin |
| `TBMSlider` | 数值 / 轨道色 / valueBlock / pin |
| `TBMProgressView` | 进度 / 轨道色 / pin |
| `UIView+TBMStyle` | 背景 / 圆角 / 边框 / 阴影 / 透明度 / tag / tint / contentMode |
| `UIView+TBMPin` | 居中 / 贴边 / 安全区 / 尺寸 / 相对锚点 |
| `TBMIndicator` | 菊花加载 / 颜色 / 启停 |
| `TBMScrollHub` | 滚动 / 分页 / 指示器 / 样式 |
| `TBMToast` | 轻提示（上 / 中 / 下） |
| `TBMLoadingHub` | Loading 遮罩 |
| `TBMAlertSheet` | 自定义 Alert / ActionSheet（iPad Popover） |
| `TBMAlertAction` | Alert / Sheet 动作项 |
| `UIView+TBMStyle` | 背景 / 圆角 / 边框 / 阴影 |
| `UIView+TBMPin` | 常用约束链（组件内部与 Demo 复用） |

## TBMStackHub

```objc
TBMStackHub *stack = [TBMStackHub tbm_vertical:^(TBMStackHub *s) {
    [[[[[s tbm_spacing:16]
        tbm_padding:UIEdgeInsetsMake(20, 20, 24, 20)]
        tbm_pinScrollContent:scrollView]
        tbm_views:@[header, card, footer]];
}];
```

## TBMToast 位置

```objc
[TBMToast tbm_showText:@"提示" inView:self.view position:TBMToastPositionTop];
[TBMToast tbm_showText:@"提示" inView:self.view position:TBMToastPositionCenter];
[TBMToast tbm_showText:@"提示" inView:self.view position:TBMToastPositionBottom];
```

## TBMAlertSheet

```objc
TBMAlertAction *ok = [TBMAlertAction tbm_actionWithTitle:@"好的"
                                                  style:TBMAlertActionStyleDefault
                                                handler:^{ /* ... */ }];
TBMAlertAction *cancel = [TBMAlertAction tbm_actionWithTitle:@"取消"
                                                     style:TBMAlertActionStyleCancel
                                                   handler:nil];

[TBMAlertSheet tbm_showTitle:@"标题"
                       message:@"说明"
                         style:TBMAlertStyleAlert
                          inVC:self
                       actions:@[ok, cancel]];

// ActionSheet：iPhone 底部弹出；iPad 需传 sourceView / barButtonItem 走 Popover
[TBMAlertSheet tbm_showTitle:@"选择"
                       message:nil
                         style:TBMAlertStyleActionSheet
                          inVC:self
                    sourceView:button
                    sourceRect:button.bounds
                 barButtonItem:nil
                       actions:@[ok, cancel]];
```

## 审核说明

- 纯 UIKit 封装，无私有 API。
- 不包含布局引擎、网络、追踪、存储逻辑。
