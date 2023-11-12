<div align="center">
  <img id="based_battery_indicator" width="96" alt="based_battery_indicator" src="https://raw.githubusercontent.com/Cierra-Runis/based_battery_indicator/main/.github/icon.svg">
  <p>『 based_battery_indicator - 速速发电！』</p>
  <a href='https://github.com/Cierra-Runis/based_battery_indicator/blob/main/README.md'>English Readme</a>
</div>

`最后更新于：2023-07-27 16:39:55`

[📚 简介](#-简介)

[📸 示例](#-示例)

[📦 使用方式](#-使用方式)

[⏳ 进度](#-进度)

[📌 注意事项](#-注意事项)

[🧑‍💻 贡献者](#-贡献者)

[🔦 声明](#-声明)

---

# 📚 简介

一个炫酷的 iOS 样式的电量指示器组件，由 [cupertino_battery_indicator](https://pub.dev/packages/cupertino_battery_indicator) 启发

# 📸 示例

![screenshot](https://raw.githubusercontent.com/Cierra-Runis/based_battery_indicator/main/.github/screenshot.gif)

或者试试 [在线示例](https://note-of-me.top/based_battery_indicator/)

# 📦 使用方式

- 按照 [Installing](https://pub.dev/packages/based_battery_indicator/install) 将 `based_battery_indicator` 添加至你的 `pubspec.yaml`

- 像下面这样使用该组件

```dart
BasedBatteryIndicator(
  status: BasedBatteryStatus(
    value: 80,
    type: BasedBatteryStatusType.error,
  ),
  trackHeight: 10.0,
  trackAspectRatio: 2.0,
  curve: Curves.ease,
  duration: const Duration(second: 1),
),
```

- 获取更多信息，请在 [example](https://github.com/Cierra-Runis/based_battery_indicator/blob/main/example/lib/main.dart) 查看样例代码

# ⏳ 进度

已完成，按需修改

# 📌 注意事项

无

# 🧑‍💻 贡献者

<a href="https://github.com/Cierra-Runis/based_battery_indicator/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Cierra-Runis/based_battery_indicator" />
</a>

# 🔦 声明

[![License](https://img.shields.io/github/license/Cierra-Runis/based_battery_indicator)](https://github.com/Cierra-Runis/based_battery_indicator/blob/main/LICENSE)

该项目采用 `MIT` 许可协议，查看 [LICENSE](https://github.com/Cierra-Runis/based_battery_indicator/blob/main/LICENSE) 以获得更多信息
