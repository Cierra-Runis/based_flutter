import 'package:based_list/based_list.dart';
import 'package:flutter/material.dart';

class BasedRadioListTile<T> extends StatelessWidget {
  const BasedRadioListTile({
    super.key,
    this.titleText = '',
    this.titleTextStyle,
    this.subtitleText = '',
    this.subtitleTextStyle,
    this.detail,
    this.detailText = '',
    this.detailTextStyle,
    this.trailing,
    this.trailingIcon,
    this.padding = const EdgeInsets.symmetric(horizontal: 12),
    this.enabled = true,
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
    required this.groupValue,
    this.onChanged,
    this.toggleable = false,
    this.radioThemeData = const RadioThemeData(),
  });

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

  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;
  final bool toggleable;
  final RadioThemeData radioThemeData;

  bool get checked => value == groupValue;

  @override
  Widget build(BuildContext context) {
    Widget leading = RadioTheme(
      data: radioThemeData,
      child: Radio<T>(
        value: value,
        groupValue: groupValue,
        onChanged: enabled ? onChanged : null,
        toggleable: toggleable,
        autofocus: autofocus,
        mouseCursor: mouseCursor,
      ),
    );

    return BasedListTile(
      leading: leading,
      titleText: titleText,
      titleTextStyle: titleTextStyle,
      subtitleText: subtitleText,
      subtitleTextStyle: subtitleTextStyle,
      detail: detail,
      detailText: detailText,
      detailTextStyle: detailTextStyle,
      trailing: trailing,
      trailingIcon: trailingIcon,
      padding: padding,
      enabled: enabled,
      onTap: onChanged != null
          ? () {
              if (toggleable && checked) return onChanged!(null);
              if (!checked) onChanged!(value);
            }
          : null,
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
