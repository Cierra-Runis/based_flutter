import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BasedSplitView extends StatefulWidget {
  /// Keep the state of [Navigator]
  final GlobalKey<NavigatorState> navigatorKey;

  /// Prefer to add a [GlobalKey] for keep the state of [leftWidget]
  final Widget leftWidget;

  /// Present when there's no page pushed
  final Widget rightPlaceholder;

  /// Width of divider, only show when [dividerWidth] > 0
  final double dividerWidth;

  /// The [SplitMode] of [BasedSplitView]
  ///
  /// When [SplitMode.flex] is used
  /// and `constraints.maxWidth` > [breakPoint],
  /// [BasedSplitView] will split view by [leftFlex] : [rightFlex]
  ///
  /// When [SplitMode.width] is used
  /// and `constraints.maxWidth` > [breakPoint],
  /// [BasedSplitView] will spilt view by [leftWidth] and [dividerWidth],
  /// [rightPlaceholder] or [Navigator] will use the remaining width
  final SplitMode splitMode;

  final int leftFlex;

  final int rightFlex;

  /// The width of [leftWidget] when [SplitMode.width] is used
  ///
  /// It only used of initialize
  final double leftWidth;

  /// When `constraints.maxWidth` <= [breakPoint],
  /// [BasedSplitView] using singleView
  final double breakPoint;

  /// The minimum value of [leftWidget]'s width
  final double leftMinWidth;

  /// The minimum value of [rightPlaceholder] or [Navigator]'s width
  final double rightMinWidth;

  BasedSplitView({
    super.key,
    required this.navigatorKey,
    required this.leftWidget,
    this.rightPlaceholder = const _BasedSplitViewPlaceholder(),
    this.splitMode = SplitMode.width,
    this.leftFlex = 1,
    this.rightFlex = 3,
    this.leftWidth = 364,
    this.leftMinWidth = 364,
    this.dividerWidth = 1,
    this.rightMinWidth = 364,
  })  : breakPoint = leftMinWidth + dividerWidth + rightMinWidth,
        assert(leftMinWidth <= leftWidth),
        assert(
          leftWidget.key != null,
          'Prefer to add a [GlobalKey] for keep the state of [leftWidget]',
        );

  @override
  State<BasedSplitView> createState() => _BasedSplitViewState();
}

enum SplitMode { flex, width }

class _BasedSplitViewPlaceholder extends StatelessWidget {
  const _BasedSplitViewPlaceholder();

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

class _BasedSplitViewState extends State<BasedSplitView> {
  late double _leftWidth = widget.leftWidth;

  @override
  Widget build(BuildContext context) {
    return NavigatorPopHandler(
      onPopWithResult: widget.navigatorKey.currentState?.maybePop,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final singleView = constraints.maxWidth <= widget.breakPoint;

          if (singleView) {
            return Navigator(
              onPopPage: _onPopPage,
              key: widget.navigatorKey,
              pages: [
                CupertinoPage(
                  child: widget.leftWidget,
                ),
              ],
            );
          }

          final calculated = _calculateLeftWidth(constraints, _leftWidth);

          final rightWidget = ScaffoldMessenger(
            child: Navigator(
              key: widget.navigatorKey,
              onPopPage: _onPopPage,
              pages: [
                CupertinoPage(
                  child: Center(
                    child: widget.rightPlaceholder,
                  ),
                ),
              ],
            ),
          );

          return Row(
            children: [
              switch (widget.splitMode) {
                SplitMode.flex => Expanded(
                    flex: widget.leftFlex,
                    child: widget.leftWidget,
                  ),
                SplitMode.width => SizedBox(
                    width: calculated,
                    child: widget.leftWidget,
                  )
              },
              if (widget.dividerWidth > 0 &&
                  widget.splitMode == SplitMode.width)
                GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    final target = _leftWidth + (details.primaryDelta ?? 0);
                    final leftWidth = _calculateLeftWidth(constraints, target);
                    return setState(() => _leftWidth = leftWidth);
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.resizeLeftRight,
                    child: VerticalDivider(width: widget.dividerWidth),
                  ),
                ),
              switch (widget.splitMode) {
                SplitMode.flex => Expanded(
                    flex: widget.rightFlex,
                    child: rightWidget,
                  ),
                SplitMode.width => SizedBox(
                    width:
                        constraints.maxWidth - calculated - widget.dividerWidth,
                    child: rightWidget,
                  ),
              },
            ],
          );
        },
      ),
    );
  }

  double _calculateLeftWidth(
    BoxConstraints constraints,
    double leftWidth,
  ) {
    final min = widget.leftMinWidth;
    final max =
        constraints.maxWidth - widget.dividerWidth - widget.rightMinWidth;

    return clampDouble(leftWidth, min, max);
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    /// Prevent to pop root page
    if (route.isFirst) return false;
    return route.didPop(result);
  }
}
