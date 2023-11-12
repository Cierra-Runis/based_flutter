import 'package:flutter/material.dart';

class BasedListTile extends StatelessWidget {
  const BasedListTile({
    super.key,
    this.leading,
    this.leadingIcon,
    this.titleText = '',
    this.titleTextStyle,
    this.subtitleText = '',
    this.subtitleTextStyle,
    this.detail,
    this.detailText = '',
    this.detailTextStyle,
    this.trailing,
    this.trailingIcon = Icons.navigate_next,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.enabled = true,
    this.onTap,
    this.onLongPress,
    this.onFocusChange,
    this.mouseCursor,
    this.focusNode,
    this.autofocus = false,
    this.showLeadingBadge = false,
    this.leadingBadgeThemeData = const BadgeThemeData(),
    this.showTitleBadge = false,
    this.titleBadgeThemeData = const BadgeThemeData(),
    this.showDetailBadge = false,
    this.detailBadgeThemeData = const BadgeThemeData(),
    this.showTrailingBadge = false,
    this.trailingBadgeThemeData = const BadgeThemeData(),
  });

  final Widget? leading;
  final IconData? leadingIcon;

  final String titleText;
  final TextStyle? titleTextStyle;

  final String subtitleText;
  final TextStyle? subtitleTextStyle;

  final Widget? detail;
  final String detailText;
  final TextStyle? detailTextStyle;

  final Widget? trailing;
  final IconData? trailingIcon;

  final EdgeInsetsGeometry padding;

  final bool enabled;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;
  final ValueChanged<bool>? onFocusChange;

  final MouseCursor? mouseCursor;

  final FocusNode? focusNode;
  final bool autofocus;

  final bool showLeadingBadge;
  final BadgeThemeData leadingBadgeThemeData;

  final bool showTitleBadge;
  final BadgeThemeData titleBadgeThemeData;

  final bool showDetailBadge;
  final BadgeThemeData detailBadgeThemeData;

  final bool showTrailingBadge;
  final BadgeThemeData trailingBadgeThemeData;

  Widget buildLeading(BuildContext context, Color outline) =>
      leading ?? Icon(leadingIcon, color: outline);

  Widget? buildDetail(BuildContext context, Color outline) {
    if (detail != null) return detail;
    if (detailText.isNotEmpty) {
      return Text(
        detailText,
        style: detailTextStyle ?? TextStyle(fontSize: 12, color: outline),
      );
    }
    return null;
  }

  Widget buildTrailing(BuildContext context, Color outline) =>
      trailing ?? Icon(trailingIcon, color: outline);

  @override
  Widget build(BuildContext context) {
    final outline = Theme.of(context).colorScheme.outline;

    return InkWell(
      onTap: enabled ? onTap : null,
      onLongPress: enabled ? onLongPress : null,
      onFocusChange: onFocusChange,
      focusNode: focusNode,
      canRequestFocus: enabled,
      autofocus: autofocus,
      mouseCursor: mouseCursor,
      child: Container(
        width: double.infinity,
        constraints: const BoxConstraints(minHeight: 56.0),
        padding: padding,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            RepaintBoundary(
              child: Badge(
                isLabelVisible: showLeadingBadge,
                child: buildLeading(context, outline),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Badge(
                      isLabelVisible: showTitleBadge,
                      child: Text(
                        titleText,
                        style: enabled
                            ? titleTextStyle ?? const TextStyle(fontSize: 16)
                            : titleTextStyle?.copyWith(color: outline) ??
                                TextStyle(fontSize: 16, color: outline),
                      ),
                    ),
                    if (subtitleText.isNotEmpty)
                      Text(
                        subtitleText,
                        style: subtitleTextStyle ??
                            TextStyle(fontSize: 8, color: outline),
                      ),
                  ],
                ),
              ),
            ),
            RepaintBoundary(
              child: Badge(
                isLabelVisible: showDetailBadge,
                child: buildDetail(context, outline),
              ),
            ),
            RepaintBoundary(
              child: Badge(
                isLabelVisible: showTrailingBadge,
                child: buildTrailing(context, outline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
