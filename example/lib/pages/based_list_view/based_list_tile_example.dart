import 'package:example/index.dart';
import 'looping_icon.dart';

class BasedListTileExample extends StatelessWidget {
  const BasedListTileExample({
    super.key,
  });

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BasedListTileExample';
  }

  @override
  Widget build(BuildContext context) {
    return const BasedListSection(
      titleText: 'BasedListTile',
      children: [
        BasedListTile(
          leadingIcon: Icons.list_alt_rounded,
          titleText: 'Normal',
        ),
        BasedListTile(
          leadingIcon: Icons.disabled_by_default_rounded,
          titleText: 'Disabled',
          enabled: false,
        ),
        BasedListTile(
          leadingIcon: Icons.subtitles_rounded,
          titleText: 'With Subtitle',
          subtitleText: 'subtitle',
        ),
        BasedListTile(
          leadingIcon: Icons.info_outline_rounded,
          titleText: 'With Detail',
          detailText: 'Detail',
        ),
        BasedListTile(
          leadingIcon: Icons.four_k_rounded,
          titleText: 'With All Four Badges',
          showLeadingBadge: true,
          showTitleBadge: true,
          showDetailBadge: true,
          showTrailingBadge: true,
        ),
        BasedListTile(
          leading: LoopingIcon(),
          titleText: 'Custom Leading & Detail & Trailing Widget',
          detail: Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Chip(label: Text('Chip')),
          ),
          trailing: SizedBox.square(
            dimension: 16,
            child: CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }
}
