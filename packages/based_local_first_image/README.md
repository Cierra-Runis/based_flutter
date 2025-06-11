<div align="center">
  <img id="based_local_first_image" width="96" alt="based_local_first_image" src="https://raw.githubusercontent.com/Cierra-Runis/based_flutter/master/.github/imgs/based_local_first_image/icon.svg">
  <p>『 based_local_first_image - Based Local First Image! 』</p>
</div>

[📚 Introduction](#-Introduction)

[📦 How to use](#-How-to-use)

[🧑‍💻 Contributor](#-Contributor)

[🔦 Declaration](#-Declaration)

---

# 📚 Introduction

Welcome to the world of local-first web development.

# 📦 How to use

- Follow [Installing](https://pub.dev/packages/based_local_first_image/install) to add `based_local_first_image` to your `pubspec.yaml`

```dart
Image(
  image: BasedLocalFirstImage(
    filename: '$index.png',
    localDirectory: path.join(appSupport.path, 'image'),
    remoteUrl: 'https://avatars.githubusercontent.com/u/$index?v=4',
  ),
  errorBuilder: (context, error, stackTrace) => const Placeholder(),
  loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) {
      return child;
    }
    return CircularProgressIndicator(
      value: loadingProgress.expectedTotalBytes != null
          ? loadingProgress.cumulativeBytesLoaded /
              loadingProgress.expectedTotalBytes!
          : null,
    );
  },
),
```

# 🧑‍💻 Contributor

<a href="https://github.com/Cierra-Runis/based_flutter/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=Cierra-Runis/based_flutter" alt="based_flutter"/>
</a>

# 🔦 Declaration

[![License](https://img.shields.io/github/license/Cierra-Runis/based_flutter)](https://github.com/Cierra-Runis/based_flutter/blob/master/LICENSE)

This project is licensed under the terms of the `MIT` license. See [LICENSE](https://github.com/Cierra-Runis/based_flutter/blob/master/LICENSE) for more details
