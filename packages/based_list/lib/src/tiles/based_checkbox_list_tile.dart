import 'package:based_list/based_list.dart';
import 'package:flutter/material.dart';

class BasedCheckboxListTile extends StatelessWidget {
  const BasedCheckboxListTile({
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
    this.onChanged,
    this.tristate = false,
    this.isError = false,
    this.checkboxThemeData = const CheckboxThemeData(),
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

  final bool? value;
  final ValueChanged<bool?>? onChanged;
  final bool tristate;
  final bool isError;
  final CheckboxThemeData checkboxThemeData;

  void _handleValueChange() {
    assert(onChanged != null);
    switch (value) {
      case false:
        onChanged!(true);
      case true:
        onChanged!(tristate ? null : false);
      case null:
        onChanged!(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final leading = CheckboxTheme(
      data: checkboxThemeData,
      child: Checkbox(
        value: value,
        onChanged: enabled ? onChanged : null,
        mouseCursor: mouseCursor,
        autofocus: autofocus,
        tristate: tristate,
        isError: isError,
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
      onTap: onChanged != null ? _handleValueChange : null,
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
