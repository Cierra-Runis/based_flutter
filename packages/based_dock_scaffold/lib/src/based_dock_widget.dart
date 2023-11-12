import 'index.dart';

/// [BaseDockWidget] will show up when user pull up [BasedDockBarWidget]
class BaseDockWidget extends StatelessWidget {
  const BaseDockWidget({
    super.key,
    required this.bottom,
    required this.onVerticalDragStart,
    required this.onVerticalDragUpdate,
    required this.onVerticalDragEnd,
    this.child,
  });

  final double bottom;
  final GestureDragStartCallback onVerticalDragStart;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedPositioned(
      duration: const Duration(milliseconds: 200),
      bottom: bottom,
      curve: Curves.ease,
      left: 24,
      right: 24,
      child: GestureDetector(
        onVerticalDragUpdate: onVerticalDragUpdate,
        onVerticalDragEnd: onVerticalDragEnd,
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: colorScheme.outlineVariant.withAlpha(32),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
