import 'package:example/index.dart';
import 'package:example/pages/based_list_view/looping_icon.dart';

class BasedSwitchListTileExample extends StatefulWidget {
  const BasedSwitchListTileExample({super.key});

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BasedSwitchListTileExample';
  }

  @override
  State<BasedSwitchListTileExample> createState() =>
      _BasedSwitchListTileExampleState();
}

class _BasedSwitchListTileExampleState
    extends State<BasedSwitchListTileExample> {
  bool _value = false;

  void onChanged(bool value) => setState(() => _value = value);

  @override
  Widget build(BuildContext context) {
    return BasedListSection(
      titleText: 'BasedSwitchListTile',
      children: [
        BasedSwitchListTile(
          leadingIcon: Icons.list_alt_rounded,
          titleText: 'Normal',
          value: _value,
          onChanged: onChanged,
        ),
        BasedSwitchListTile(
          leadingIcon: Icons.disabled_by_default_rounded,
          titleText: 'Disabled',
          value: _value,
          enabled: false,
          onChanged: onChanged,
        ),
        BasedSwitchListTile(
          leadingIcon: Icons.subtitles_rounded,
          titleText: 'With Subtitle',
          subtitleText: 'subtitle',
          value: _value,
          onChanged: onChanged,
        ),
        BasedSwitchListTile(
          leadingIcon: Icons.info_outline_rounded,
          titleText: 'With Detail',
          detailText: _value ? 'ON' : 'OFF',
          value: _value,
          onChanged: onChanged,
        ),
        BasedSwitchListTile(
          leadingIcon: Icons.four_k_rounded,
          titleText: 'With All Four Badges',
          showLeadingBadge: true,
          showTitleBadge: true,
          showDetailBadge: true,
          showTrailingBadge: true,
          value: _value,
          onChanged: onChanged,
        ),
        BasedSwitchListTile(
          leading: const LoopingIcon(),
          titleText: 'Custom Leading & Detail Widget',
          detail: const Chip(label: Text('Chip')),
          value: _value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}
