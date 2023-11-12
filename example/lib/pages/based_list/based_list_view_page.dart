import 'package:example/index.dart';

class BasedListViewPage extends StatelessWidget {
  const BasedListViewPage({super.key});

  static const List<Widget> examples = [
    BasedListSectionExample(),
    BasedListTileExample(),
    BasedSwitchListTileExample(),
    BasedRadioListTileExample(),
    BasedCheckboxListTileExample(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasedListViewPage'),
        actions: const [ToggleThemeModeButton()],
      ),
      body: BasedListView(
        children: [
          BasedListSection(
            titleText: 'Examples',
            children: [
              for (final example in examples)
                BasedListTile(
                  leadingIcon: Icons.code_rounded,
                  titleText: '$example',
                  onTap: () => Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => Scaffold(
                        appBar: AppBar(title: Text('$example')),
                        body: example,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
