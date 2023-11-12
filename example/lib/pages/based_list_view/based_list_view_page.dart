import 'package:example/index.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isDark = true;

  void changeThemeMode() => setState(() => _isDark = !_isDark);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Based List Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(
        changeThemeMode: changeThemeMode,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.changeThemeMode});

  final VoidCallback changeThemeMode;

  static const List<Widget> examples = [
    BasedListSectionExample(),
    BasedListTileExample(),
    BasedSwitchListTileExample(),
    BasedRadioListTileExample(),
    BasedCheckboxListTileExample(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Based List'),
        actions: [
          IconButton(
            onPressed: changeThemeMode,
            icon: const Icon(Icons.color_lens_rounded),
          ),
        ],
      ),
      body: BasedListView(
        children: [
          BasedListSection(
            titleText: 'Examples',
            children: [
              for (final example in examples)
                BasedListTile(
                  leadingIcon: Icons.code_rounded,
                  titleText: '$example',
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(title: Text('$example')),
                        body: example,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
