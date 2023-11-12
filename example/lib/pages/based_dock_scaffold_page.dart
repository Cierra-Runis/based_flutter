import 'package:example/index.dart';

class BasedDockScaffoldPage extends StatelessWidget {
  const BasedDockScaffoldPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BasedDockScaffold(
      appBar: AppBar(
        title: Text('$this'),
        actions: const [ToggleThemeModeButton()],
      ),
      body: const Center(
        child: Wrap(
          spacing: 8,
          direction: Axis.vertical,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text('Pull Up The Dock!'),
            ShowButton(),
            Text('Click Outside To Hide The Dock!'),
          ],
        ),
      ),
      dockChild: const Wrap(
        spacing: 8,
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          ErrorShowButton(),
        ],
      ),
    );
  }
}

class ErrorShowButton extends StatelessWidget {
  const ErrorShowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip:
          '**_DO NOT_** use `BasedDockScaffold.of(context)` in the subtree of `dockChild`',
      onPressed: () {
        final state = BasedDockScaffold.of(context);
        state.showDock();
      },
      icon: const Icon(Icons.error, color: Colors.red),
    );
  }
}

class ShowButton extends StatelessWidget {
  const ShowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final state = BasedDockScaffold.of(context);
        state.showDock();
      },
      child: const Text('Show Up The Dock!'),
    );
  }
}
