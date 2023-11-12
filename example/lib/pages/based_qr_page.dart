import 'package:example/index.dart';

class BasedQrPage extends StatelessWidget {
  const BasedQrPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$this'),
        actions: const [ToggleThemeModeButton()],
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: BasedQr(
            colors: const [
              Colors.deepPurple,
              Colors.deepOrange,
              Colors.lightBlue,
              Colors.lightGreen,
            ],
            qrImage: QrImage(
              QrCode.fromData(
                data: 'https://note-of-me.top',
                errorCorrectLevel: QrErrorCorrectLevel.L,
              ),
            ),
            options: BasedQrOptions(),
          ),
        ),
      ),
    );
  }
}
