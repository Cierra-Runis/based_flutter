import 'index.dart';

/// [BasedDockBarWidget] fixed at the bottom of [BasedDockScaffold]
class BasedDockBarWidget extends StatelessWidget {
  const BasedDockBarWidget({
    super.key,
    required this.onVerticalDragStart,
    required this.onVerticalDragUpdate,
    required this.onVerticalDragEnd,
  });

  final GestureDragStartCallback onVerticalDragStart;
  final GestureDragUpdateCallback onVerticalDragUpdate;
  final GestureDragEndCallback onVerticalDragEnd;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double side = width / 2.8;

    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onVerticalDragStart: onVerticalDragStart,
        onVerticalDragUpdate: onVerticalDragUpdate,
        onVerticalDragEnd: onVerticalDragEnd,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: SizedBox(
            height: 36,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 4,
                width: width - 2 * side,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outline,
                  borderRadius: BorderRadius.circular(4 / 2),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
