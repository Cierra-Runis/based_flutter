import 'package:based_list/based_list.dart';
import 'package:flutter/material.dart';

class BasedSwitchListTile extends StatelessWidget {
  const BasedSwitchListTile({
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
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.enabled = true,
    this.onTap,
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
    required this.value,
    required this.onChanged,
    this.switchThemeData = const SwitchThemeData(),
    this.scale = 0.7,
    this.activeThumbImage,
    this.onActiveThumbImageError,
    this.inactiveThumbImage,
    this.onInactiveThumbImageError,
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

  final EdgeInsetsGeometry padding;

  final bool enabled;
  final GestureTapCallback? onTap;
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

  final bool value;
  final ValueChanged<bool> onChanged;

  final SwitchThemeData switchThemeData;

  final double scale;

  final ImageProvider<Object>? activeThumbImage;
  final void Function(Object, StackTrace?)? onActiveThumbImageError;
  final ImageProvider<Object>? inactiveThumbImage;
  final void Function(Object, StackTrace?)? onInactiveThumbImageError;

  @override
  Widget build(BuildContext context) {
    final trailing = Transform.scale(
      scale: scale,
      child: SwitchTheme(
        data: switchThemeData,
        child: Switch(
          autofocus: autofocus,
          value: value,
          onChanged: enabled ? onChanged : null,
          onFocusChange: onFocusChange,
          mouseCursor: mouseCursor,
          activeThumbImage: activeThumbImage,
          onActiveThumbImageError: onActiveThumbImageError,
          inactiveThumbImage: inactiveThumbImage,
          onInactiveThumbImageError: onActiveThumbImageError,
        ),
      ),
    );

    return BasedListTile(
      leading: leading,
      leadingIcon: leadingIcon,
      titleText: titleText,
      titleTextStyle: titleTextStyle,
      subtitleText: subtitleText,
      subtitleTextStyle: subtitleTextStyle,
      detail: detail,
      detailText: detailText,
      detailTextStyle: detailTextStyle,
      trailing: trailing,
      padding: padding,
      enabled: enabled,
      onTap: enabled ? () => onChanged(!value) : null,
      onFocusChange: onFocusChange,
      mouseCursor: mouseCursor,
      focusNode: focusNode,
      autofocus: autofocus,
      showLeadingBadge: showLeadingBadge,
      leadingBadgeThemeData: leadingBadgeThemeData,
      showTitleBadge: showTitleBadge,
      titleBadgeThemeData: titleBadgeThemeData,
      showDetailBadge: showDetailBadge,
      detailBadgeThemeData: detailBadgeThemeData,
      showTrailingBadge: showTrailingBadge,
      trailingBadgeThemeData: trailingBadgeThemeData,
    );
  }
}
