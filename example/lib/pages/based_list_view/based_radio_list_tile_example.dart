import 'package:example/index.dart';

class BasedRadioListTileExample extends StatefulWidget {
  const BasedRadioListTileExample({
    super.key,
  });

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BasedRadioListTileExample';
  }

  @override
  State<BasedRadioListTileExample> createState() =>
      _BasedRadioListTileExampleState();
}

class _BasedRadioListTileExampleState extends State<BasedRadioListTileExample> {
  String? _groupValue;

  @override
  Widget build(BuildContext context) {
    return BasedListSection(
      titleText: 'BasedRadioListTile',
      subTitleText: '$_groupValue',
      children: [
        BasedRadioListTile(
          titleText: 'Normal',
          value: 'normal',
          trailingIcon: Icons.list_alt_rounded,
          groupValue: _groupValue,
          onChanged: (value) => setState(() => _groupValue = value),
        ),
        BasedRadioListTile(
          titleText: 'Toggleable Normal',
          value: 'toggleable normal',
          trailingIcon: Icons.list_alt_rounded,
          groupValue: _groupValue,
          toggleable: true,
          onChanged: (value) => setState(() => _groupValue = value),
        ),
        BasedRadioListTile(
          titleText: 'Disabled',
          enabled: false,
          trailingIcon: Icons.disabled_by_default_rounded,
          value: 'disabled',
          groupValue: _groupValue,
          onChanged: (value) => setState(() => _groupValue = value),
        ),
        BasedRadioListTile(
          titleText: 'With SubTitle',
          subtitleText: 'subtitle',
          trailingIcon: Icons.subtitles_rounded,
          value: 'subtitle',
          groupValue: _groupValue,
          onChanged: (value) => setState(() => _groupValue = value),
        ),
        BasedRadioListTile(
          titleText: 'With Detail',
          trailingIcon: Icons.info_outline_rounded,
          value: 'detail',
          detailText: 'Detail',
          groupValue: _groupValue,
          onChanged: (value) => setState(() => _groupValue = value),
        ),
        BasedRadioListTile(
          titleText: 'With All Four Badges',
          value: 'badges',
          trailingIcon: Icons.four_k_rounded,
          showLeadingBadge: true,
          showTitleBadge: true,
          showDetailBadge: true,
          showTrailingBadge: true,
          groupValue: _groupValue,
          onChanged: (value) => setState(() => _groupValue = value),
        ),
        BasedRadioListTile(
          titleText: 'Custom Detail & Trailing Widget',
          value: 'custom',
          groupValue: _groupValue,
          onChanged: (value) => setState(() => _groupValue = value),
          detail: const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Chip(label: Text('Chip')),
          ),
          trailing: const SizedBox.square(
            dimension: 16,
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
