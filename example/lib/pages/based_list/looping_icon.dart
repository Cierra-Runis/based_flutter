import 'package:example/index.dart';

class LoopingIcon extends StatefulWidget {
  const LoopingIcon({super.key});

  @override
  State<LoopingIcon> createState() => _LoopingIconState();
}

class _LoopingIconState extends State<LoopingIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      AnimatedIcon(icon: AnimatedIcons.ellipsis_search, progress: _controller);
}
