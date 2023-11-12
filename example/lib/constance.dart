import 'package:example/index.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.deepPurple,
  ),
  useMaterial3: true,
);

final darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.deepPurple,
  ),
  useMaterial3: true,
);

extension BuildContextExt on BuildContext {
  Future<T?> push<T extends Object?>(Widget page) =>
      demoSplitViewKey.currentState!
          .push(CupertinoPageRoute<T>(builder: (_) => page));

  void pop<T extends Object?>([T? result]) => Navigator.pop(this, result);
}
