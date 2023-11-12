<div align="center">
  <img id="based_dock_scaffold" width="96" alt="based_dock_scaffold" src="https://raw.githubusercontent.com/Cierra-Runis/based_widget/master/.github/imgs/based_dock_scaffold/icon.svg">
  <p>『 based_dock_scaffold - Based Dock Scaffold! 』</p>
</div>

`Latest update: 2023-07-25 23:54:08`

[📚 Introduction](#-Introduction)

[📸 Screenshots](#-Screenshots)

[📦 How to use](#-How-to-use)

[⏳ Rate of progress](#-Rate-of-progress)

[📌 Cautions](#-Cautions)

[🧑‍💻 Contributor](#-Contributor)

[🔦 Declaration](#-Declaration)

---

# 📚 Introduction

A Based Dock Scaffold Widget, Which Helps You Create A Scaffold With A IPad-Like Dock

# 📸 Screenshots

![screenshots](https://raw.githubusercontent.com/Cierra-Runis/based_widget/master/.github/imgs/based_dock_scaffold/screenshot.gif)

Or try out [live example app](https://note-of-me.top/based_widget/)

# 📦 How to use

- Follow [Installing](https://pub.dev/packages/based_dock_scaffold/install) to add `based_dock_scaffold` to your `pubspec.yaml`

- See the example code at [example](https://github.com/Cierra-Runis/based_widget/blob/master/example/lib/main.dart)

# ⏳ Rate of progress

Done, but it will revise if necessary

# 📌 Cautions

- **_DO NOT_** import any file below `src` folder:

  ```dart
  import 'package:based_dock_scaffold/src/*.dart';
  ```

- **_DO NOT_** use `BasedDockScaffold.of(context)` in the subtree of `dockChild`

  Like the widget tree at [example](https://github.com/Cierra-Runis/based_widget/blob/master/example/lib/main.dart), you can't find the `BasedDockScaffoldState`

  ![widget_tree](https://raw.githubusercontent.com/Cierra-Runis/based_widget/master/.github/imgs/based_dock_scaffold/widget_tree.png)

- Since `BasedDockScaffold` is actually **_NOT_** a `Scaffold` widget,
  you can't get the `ScaffoldState` by using `BasedDockScaffold.of(context)`
  Instead, you should use `Scaffold.of(context)` to get `ScaffoldState`

# 🧑‍💻 Contributor

<a href="https://github.com/Cierra-Runis/based_widget/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Cierra-Runis/based_widget" />
</a>

# 🔦 Declaration

[![License](https://img.shields.io/github/license/Cierra-Runis/based_widget)](https://github.com/Cierra-Runis/based_widget/blob/master/LICENSE)

This project is licensed under the terms of the `MIT` license. See [LICENSE](https://github.com/Cierra-Runis/based_widget/blob/master/LICENSE) for more details
