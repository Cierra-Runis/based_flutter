import 'package:flutter/material.dart';

enum SplitMode { flex, width }

class BasedSplitView extends StatelessWidget {
  const BasedSplitView({
    super.key,
    this.navigatorKey,
    required this.leftWidget,
    this.rightPlaceholder = const BasedSplitViewPlaceholder(),
    this.dividerWidth = 0.5,
    this.splitMode = SplitMode.width,
    this.leftFlex = 1,
    this.rightFlex = 3,
    this.leftWidth = 340,
    this.breakPoint = 340 * 2,
  });

  final GlobalKey<NavigatorState>? navigatorKey;

  final Widget leftWidget;
  final Widget rightPlaceholder;
  final double? dividerWidth;

  final SplitMode splitMode;
  final int leftFlex;
  final int rightFlex;
  final double leftWidth;
  final double breakPoint;

  @override
  Widget build(BuildContext context) {
    final key = navigatorKey ?? GlobalKey<NavigatorState>();
    final leftWidgetKey = GlobalKey();

    return WillPopScope(
      onWillPop: () async {
        final navigator = key.currentState;
        return navigator == null || !navigator.canPop();
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          final singleView = constraints.maxWidth <= breakPoint;

          if (singleView) {
            return Navigator(
              key: key,
              onPopPage: (route, result) {
                /// prevent to pop root page
                if (route.isFirst) return false;
                return route.didPop(result);
              },
              pages: [
                MaterialPage(
                  child: Builder(
                    key: leftWidgetKey,
                    builder: (context) {
                      return leftWidget;
                    },
                  ),
                ),
              ],
            );
          }

          return Row(
            children: [
              switch (splitMode) {
                SplitMode.flex => Expanded(
                    flex: leftFlex,
                    child: Builder(
                      key: leftWidgetKey,
                      builder: (context) {
                        return leftWidget;
                      },
                    ),
                  ),
                SplitMode.width => SizedBox(
                    width: leftWidth,
                    child: Builder(
                      key: leftWidgetKey,
                      builder: (context) {
                        return leftWidget;
                      },
                    ),
                  )
              },
              VerticalDivider(width: dividerWidth),
              Expanded(
                flex: rightFlex,
                child: Navigator(
                  key: key,
                  onPopPage: (route, result) {
                    /// prevent to pop root page
                    if (route.isFirst) return false;
                    return route.didPop(result);
                  },
                  pages: [MaterialPage(child: Center(child: rightPlaceholder))],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class BasedSplitViewPlaceholder extends StatelessWidget {
  const BasedSplitViewPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: Text(
          'BasedSplitView',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: colorScheme.outline,
          ),
        ),
      ),
    );
  }
}
