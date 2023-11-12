import 'package:flutter/material.dart';

class BasedListSection extends StatelessWidget {
  const BasedListSection({
    super.key,
    this.titleText = '',
    this.titleTextStyle,
    this.subTitleText = '',
    this.subTitleTextStyle,
    this.margin = const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
    this.mainAxisSize = MainAxisSize.max,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.shape,
    this.borderOnForeground = true,
    this.cardMargin,
    this.clipBehavior = Clip.hardEdge,
    this.semanticContainer = true,
    this.itemPadding = EdgeInsets.zero,
    this.separator = const Divider(height: 0, indent: 8, endIndent: 8),
    this.children = const <Widget>[],
  });

  final String titleText;
  final TextStyle? titleTextStyle;
  final String subTitleText;
  final TextStyle? subTitleTextStyle;
  final EdgeInsetsGeometry margin;
  final MainAxisSize mainAxisSize;

  final Color? color;
  final Color? shadowColor;
  final Color? surfaceTintColor;
  final double? elevation;
  final ShapeBorder? shape;
  final bool borderOnForeground;
  final EdgeInsetsGeometry? cardMargin;
  final Clip? clipBehavior;
  final bool semanticContainer;

  final EdgeInsetsGeometry itemPadding;
  final Widget separator;

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      child: Column(
        mainAxisSize: mainAxisSize,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (titleText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Text(
                titleText,
                style: titleTextStyle ?? const TextStyle(fontSize: 18),
              ),
            ),
          if (subTitleText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                subTitleText,
                style: subTitleTextStyle,
              ),
            ),
          Card(
            color: color,
            shadowColor: shadowColor,
            surfaceTintColor: surfaceTintColor,
            elevation: elevation,
            shape: shape,
            borderOnForeground: borderOnForeground,
            margin: cardMargin,
            clipBehavior: clipBehavior,
            semanticContainer: semanticContainer,
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding: itemPadding,
                child: children[index],
              ),
              separatorBuilder: (context, index) => separator,
              itemCount: children.length,
            ),
          ),
        ],
      ),
    );
  }
}
