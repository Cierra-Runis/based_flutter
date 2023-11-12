import 'package:example/index.dart';

class BasedCheckboxListTileExample extends StatefulWidget {
  const BasedCheckboxListTileExample({super.key});

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BasedCheckboxListTileExample';
  }

  @override
  State<BasedCheckboxListTileExample> createState() =>
      _BasedCheckboxListTileExampleState();
}

class _BasedCheckboxListTileExampleState
    extends State<BasedCheckboxListTileExample> {
  bool? _nullAbleValue = true;
  bool _value = true;

  @override
  Widget build(BuildContext context) {
    return BasedListSection(
      titleText: 'BasedCheckboxListTile',
      children: [
        BasedCheckboxListTile(
          value: _value,
          onChanged: (value) => setState(() => _value = value!),
        ),
        BasedCheckboxListTile(
          value: _nullAbleValue,
          tristate: true,
          onChanged: (value) => setState(() => _nullAbleValue = value),
        ),
      ],
    );
  }
}
