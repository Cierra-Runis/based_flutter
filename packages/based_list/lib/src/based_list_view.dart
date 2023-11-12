import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class BasedListView extends StatelessWidget {
  const BasedListView({
    super.key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.controller,
    this.primary,
    this.physics,
    this.shrinkWrap = false,
    this.padding = const EdgeInsets.all(8.0),
    this.itemExtent,
    this.prototypeItem,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
    this.children = const <Widget>[],
  });

  final Axis scrollDirection;
  final bool reverse;
  final ScrollController? controller;
  final bool? primary;
  final ScrollPhysics? physics;
  final bool shrinkWrap;
  final EdgeInsetsGeometry padding;
  final double? itemExtent;
  final Widget? prototypeItem;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final int? semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;
  final List<Widget> children;

  Widget get adaptAlertDialog =>
      SizedBox(width: double.minPositive, child: copyWith(shrinkWrap: true));

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: scrollDirection,
      reverse: reverse,
      controller: controller,
      primary: primary,
      physics: physics,
      shrinkWrap: shrinkWrap,
      padding: padding,
      itemExtent: itemExtent,
      prototypeItem: prototypeItem,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      cacheExtent: cacheExtent,
      semanticChildCount: semanticChildCount,
      dragStartBehavior: dragStartBehavior,
      keyboardDismissBehavior: keyboardDismissBehavior,
      restorationId: restorationId,
      clipBehavior: clipBehavior,
      children: children,
    );
  }

  BasedListView copyWith({
    Axis? scrollDirection,
    bool? reverse,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool? shrinkWrap,
    EdgeInsetsGeometry? padding,
    double? itemExtent,
    Widget? prototypeItem,
    bool? addAutomaticKeepAlives,
    bool? addRepaintBoundaries,
    bool? addSemanticIndexes,
    double? cacheExtent,
    int? semanticChildCount,
    DragStartBehavior? dragStartBehavior,
    ScrollViewKeyboardDismissBehavior? keyboardDismissBehavior,
    String? restorationId,
    Clip? clipBehavior,
    List<Widget>? children,
  }) =>
      BasedListView(
        scrollDirection: scrollDirection ?? this.scrollDirection,
        reverse: reverse ?? this.reverse,
        controller: controller ?? this.controller,
        primary: primary ?? this.primary,
        physics: physics ?? this.physics,
        shrinkWrap: shrinkWrap ?? this.shrinkWrap,
        padding: padding ?? this.padding,
        itemExtent: itemExtent ?? this.itemExtent,
        prototypeItem: prototypeItem ?? this.prototypeItem,
        addAutomaticKeepAlives:
            addAutomaticKeepAlives ?? this.addAutomaticKeepAlives,
        addRepaintBoundaries: addRepaintBoundaries ?? this.addRepaintBoundaries,
        addSemanticIndexes: addSemanticIndexes ?? this.addSemanticIndexes,
        cacheExtent: cacheExtent ?? this.cacheExtent,
        semanticChildCount: semanticChildCount ?? this.semanticChildCount,
        dragStartBehavior: dragStartBehavior ?? this.dragStartBehavior,
        keyboardDismissBehavior:
            keyboardDismissBehavior ?? this.keyboardDismissBehavior,
        clipBehavior: clipBehavior ?? this.clipBehavior,
        restorationId: restorationId ?? this.restorationId,
        children: children ?? this.children,
      );
}
