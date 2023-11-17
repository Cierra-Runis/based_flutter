import 'package:example/index.dart';
import 'package:example/pages/based_battery_indicator.dart';
import 'package:example/pages/based_dock_scaffold_page.dart';

final demoSplitViewKey = GlobalKey<NavigatorState>();

void main() => runApp(const BasedWidgetDemo());

class BasedWidgetDemo extends StatefulWidget {
  const BasedWidgetDemo({super.key});

  static BasedWidgetDemoState of(BuildContext context) {
    final result = context.findAncestorStateOfType<BasedWidgetDemoState>();
    if (result != null) return result;
    throw FlutterError('Can\'t found BasedWidgetDemoState');
  }

  @override
  State<BasedWidgetDemo> createState() => BasedWidgetDemoState();
}

class BasedWidgetDemoState extends State<BasedWidgetDemo> {
  bool _isDark = true;

  void toggleThemeMode() => setState(() => _isDark = !_isDark);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BasedWidgetDemo',
      theme: theme,
      darkTheme: darkTheme,
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      home: BasedSplitView(
        navigatorKey: demoSplitViewKey,
        leftWidget: const DemoLeftWidget(),
      ),
    );
  }
}

class DemoLeftWidget extends StatelessWidget {
  const DemoLeftWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: BasedListView(
        children: [
          BasedListSection(
            children: [
              BasedListTile(
                leading: const BasedAvatar(
                  placeholder: Text('BA'),
                ),
                titleText: 'BasedAvatar',
                onTap: () => demoSplitViewKey.currentState?.push(
                  CupertinoPageRoute(
                    builder: (context) => const BasedAvatarPage(),
                  ),
                ),
              ),
              BasedListTile(
                leading: const BasedBatteryIndicator(
                  status: BasedBatteryStatus(value: 100),
                ),
                titleText: 'BasedBatteryIndicator',
                onTap: () => demoSplitViewKey.currentState?.push(
                  CupertinoPageRoute(
                    builder: (context) => const BasedBatteryIndicatorPage(),
                  ),
                ),
              ),
              BasedListTile(
                leadingIcon: Icons.dock_rounded,
                titleText: 'BasedDockScaffold',
                onTap: () => demoSplitViewKey.currentState?.push(
                  CupertinoPageRoute(
                    builder: (context) => const BasedDockScaffoldPage(),
                  ),
                ),
              ),
              BasedListTile(
                leadingIcon: Icons.qr_code_rounded,
                titleText: 'BasedQr',
                onTap: () => demoSplitViewKey.currentState?.push(
                  CupertinoPageRoute(
                    builder: (context) => const BasedQrPage(),
                  ),
                ),
              ),
              BasedListTile(
                leadingIcon: Icons.splitscreen_rounded,
                titleText: 'BasedSplitView',
                onTap: () => demoSplitViewKey.currentState?.push(
                  CupertinoPageRoute(
                    builder: (context) => const BasedSplitViewPage(),
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
