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
