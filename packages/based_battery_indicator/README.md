<div align="center">
  <img id="based_battery_indicator" width="96" alt="based_battery_indicator" src="https://raw.githubusercontent.com/Cierra-Runis/based_flutter/master/.github/imgs/based_battery_indicator/icon.svg">
  <p>『 based_battery_indicator - Based Battery Indicator! 』</p>
</div>

[📚 Introduction](#-Introduction)

[📸 Screenshots](#-Screenshots)

[📦 How to use](#-How-to-use)

[⏳ Rate of progress](#-Rate-of-progress)

[📌 Cautions](#-Cautions)

[🧑‍💻 Contributor](#-Contributor)

[🔦 Declaration](#-Declaration)

---

# 📚 Introduction

A Based Battery Indicator Widget, Which Helps You Create A Battery Indicator With A iOS-Like Battery Indicator

Inspired by [cupertino_battery_indicator](https://pub.dev/packages/cupertino_battery_indicator)

# 📸 Screenshots

![screenshot](https://raw.githubusercontent.com/Cierra-Runis/based_flutter/master/.github/imgs/based_battery_indicator/screenshot.gif)

Or try out [live example app](https://cierra-runis.github.io/based_flutter/)

# 📦 How to use

- Follow [Installing](https://pub.dev/packages/based_battery_indicator/install) to add `based_dock_scaffold` to your `pubspec.yaml`

- Use it as below:

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

- For more information, see the example code at [example](https://github.com/Cierra-Runis/based_flutter/blob/master/example/lib/main.dart)

# ⏳ Rate of progress

Done, but it will revise if necessary

# 📌 Cautions

None

# 🧑‍💻 Contributor

<a href="https://github.com/Cierra-Runis/based_flutter/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Cierra-Runis/based_flutter" alt="contributors"/>
</a>

# 🔦 Declaration

[![License](https://img.shields.io/github/license/Cierra-Runis/based_flutter)](https://github.com/Cierra-Runis/based_flutter/blob/master/LICENSE)

This project is licensed under the terms of the `MIT` license. See [LICENSE](https://github.com/Cierra-Runis/based_flutter/blob/master/LICENSE) for more details
