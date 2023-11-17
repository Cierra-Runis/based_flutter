import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BasedSplashPage extends StatefulWidget {
  const BasedSplashPage({
    super.key,
    required this.rootPage,
    required this.appIcon,
    required this.appName,
    this.duration = const Duration(milliseconds: 800),
  });

  final Widget rootPage;
  final Widget appIcon;
  final Widget appName;
  final Duration? duration;

  @override
  State<BasedSplashPage> createState() => _BasedSplashPageState();
}

class _BasedSplashPageState extends State<BasedSplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _animation.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(builder: (context) => widget.rootPage),
            (_) => false,
          );
        }
      },
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Scaffold(
        body: Center(
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            children: [
              widget.appIcon,
              widget.appName,
            ],
          ),
        ),
      ),
    );
  }
}
