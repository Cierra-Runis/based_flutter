import 'package:example/index.dart';

class BasedListSectionExample extends StatelessWidget {
  const BasedListSectionExample({
    super.key,
  });

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'BasedListSectionExample';
  }

  @override
  Widget build(BuildContext context) {
    return const BasedListSection(
      titleText: 'BasedListSection',
      children: [
        SizedBox(height: 100, child: Center(child: Text('Section_1'))),
        SizedBox(height: 100, child: Center(child: Text('Section_2'))),
      ],
    );
  }
}
