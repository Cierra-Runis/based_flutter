import 'package:example/index.dart';

class BasedAvatarPage extends StatelessWidget {
  const BasedAvatarPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BasedAvatarPage'),
        actions: const [ToggleThemeModeButton()],
      ),
      body: BasedListView(
        children: [
          BasedListSection(
            children: [
              const BasedListTile(
                leading: BasedAvatar(),
                titleText: 'Simple BasedAvatar',
                trailingIcon: null,
              ),
              const BasedListTile(
                leading: BasedAvatar(
                  placeholder: Text('RC'),
                ),
                titleText: 'With Placeholder',
                trailingIcon: null,
              ),
              const BasedListTile(
                leading: BasedAvatar(
                  image: NetworkImage(
                    'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                  ),
                ),
                titleText: 'With NetworkImage',
                trailingIcon: null,
              ),
              const BasedListTile(
                leading: BasedAvatar(
                  image: NetworkImage(
                    'https://avatars.githubusercontent.com/u/29329988',
                  ),
                  badge: Badge(backgroundColor: Colors.green),
                ),
                titleText: 'With Customizable Badge',
                trailingIcon: null,
              ),
              BasedListTile(
                leading: Builder(
                  builder: (context) {
                    return BasedAvatar(
                      onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('onTap')),
                      ),
                      onDoubleTap: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('onDoubleTap')),
                      ),
                      onLongPress: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('onLongPress')),
                      ),
                    );
                  },
                ),
                titleText: 'With Gesture (tap, double tap, long press)',
                trailingIcon: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ToggleThemeModeButton extends StatelessWidget {
  const ToggleThemeModeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: BasedWidgetDemo.of(context).toggleThemeMode,
      icon: const Icon(
        Icons.color_lens_outlined,
      ),
    );
  }
}
