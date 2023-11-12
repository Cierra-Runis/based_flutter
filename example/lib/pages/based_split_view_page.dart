import 'package:example/index.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class BasedSplitViewPage extends StatelessWidget {
  const BasedSplitViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$this'),
        actions: const [ToggleThemeModeButton()],
      ),
      body: BasedSplitView(
        navigatorKey: navigatorKey,
        leftWidget: const LeftWidget(),
      ),
    );
  }
}

class LeftWidget extends StatelessWidget {
  const LeftWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              navigatorKey.currentState?.push(
                CupertinoPageRoute(builder: (context) => const NextPage()),
              );
            },
            child: const Text('Use GlobalKey to Push page'),
          ),
          TextButton(
            onPressed: () {
              navigatorKey.currentState?.pop();
            },
            child: const Text('Use GlobalKey to Pop page'),
          ),
          const NextPageButton(),
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: const NextPageButton());
  }
}

class NextPageButton extends StatelessWidget {
  const NextPageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () => Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => const NextPage()),
        ),
        child: const Text('Use Navigator to Push page'),
      ),
    );
  }
}