import 'index.dart';

/// State for a [BasedDockScaffold].
///
/// Can display [BaseDockWidget]. Retrieve a [BasedDockScaffoldState] from the current
/// [BuildContext] using [BasedDockScaffold.of].
class BasedDockScaffoldState extends State<BasedDockScaffold> {
  late OverlayEntry _overlayEntry;
  late double _barPosition;

  @override
  void initState() {
    super.initState();
    _barPosition = widget.dockPositionLowerBound;
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            GestureDetector(
              onTap: _hideDock,
              child: Container(
                color: Colors.transparent,
              ),
            ),
            BaseDockWidget(
              bottom: _barPosition,
              onVerticalDragStart: _onVerticalDragStart,
              onVerticalDragUpdate: _onVerticalDragUpdate,
              onVerticalDragEnd: _onVerticalDragEnd,
              child: widget.dockChild,
            ),
          ],
        );
      },
    );
  }

  void showDock() {
    OverlayState overlayState = Overlay.of(context);
    if (_overlayEntry.mounted) return;
    overlayState.insert(_overlayEntry);
    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() {
        _barPosition = widget.dockPositionUpperBound;
        _overlayEntry.markNeedsBuild();
      });
    });
  }

  void _hideDock() {
    setState(() {
      _barPosition = widget.dockPositionLowerBound;
      _overlayEntry.markNeedsBuild();
    });

    Future.delayed(const Duration(milliseconds: 200), () {
      if (_overlayEntry.mounted) _overlayEntry.remove();
    });
  }

  void _onVerticalDragStart(DragStartDetails details) {
    OverlayState overlayState = Overlay.of(context);
    if (_overlayEntry.mounted) return;
    overlayState.insert(_overlayEntry);
  }

  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      if (_barPosition >= widget.dockPositionUpperBound) {
        _barPosition = widget.dockPositionUpperBound;
      }
      if (_barPosition < widget.dockPositionLowerBound) {
        _barPosition = widget.dockPositionLowerBound;
      }
      _barPosition -= details.delta.dy;
      _overlayEntry.markNeedsBuild();
    });
  }

  void _onVerticalDragEnd(DragEndDetails details) {
    if (_barPosition > widget.dockPositionBreakPoint) {
      return setState(() {
        _barPosition = widget.dockPositionUpperBound;
        _overlayEntry.markNeedsBuild();
      });
    }
    if (_barPosition <= widget.dockPositionBreakPoint) {
      setState(() {
        _barPosition = widget.dockPositionLowerBound;
        _overlayEntry.markNeedsBuild();
      });
      Future.delayed(const Duration(milliseconds: 200), () {
        if (_overlayEntry.mounted) _overlayEntry.remove();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.key,
      appBar: widget.appBar,
      body: Stack(
        children: [
          widget.body ?? Container(),
          BasedDockBarWidget(
            onVerticalDragStart: _onVerticalDragStart,
            onVerticalDragUpdate: _onVerticalDragUpdate,
            onVerticalDragEnd: _onVerticalDragEnd,
          )
        ],
      ),
      floatingActionButton: widget.floatingActionButton,
      floatingActionButtonLocation: widget.floatingActionButtonLocation,
      floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
      persistentFooterButtons: widget.persistentFooterButtons,
      persistentFooterAlignment: widget.persistentFooterAlignment,
      drawer: widget.drawer,
      onDrawerChanged: widget.onDrawerChanged,
      endDrawer: widget.endDrawer,
      onEndDrawerChanged: widget.onEndDrawerChanged,
      bottomNavigationBar: widget.bottomNavigationBar,
      bottomSheet: widget.bottomSheet,
      backgroundColor: widget.backgroundColor,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      primary: widget.primary,
      drawerDragStartBehavior: widget.drawerDragStartBehavior,
      extendBody: widget.extendBody,
      extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
      drawerScrimColor: widget.drawerScrimColor,
      drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
      drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
      endDrawerEnableOpenDragGesture: widget.endDrawerEnableOpenDragGesture,
      restorationId: widget.restorationId,
    );
  }
}
