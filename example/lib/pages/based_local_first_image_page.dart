import 'package:example/index.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;

class BasedLocalFirstImagePage extends StatelessWidget {
  const BasedLocalFirstImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          leading: Image(
            image: BasedLocalFirstImage(
              fileName: '$index.png',
              localDirectory: path.join(appSupport.path, 'image'),
              remoteUrl: 'https://avatars.githubusercontent.com/u/$index?v=4',
            ),
            errorBuilder: (context, error, stackTrace) => const Placeholder(),
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              );
            },
          ),
          title: Text('$index'),
        ),
      ),
    );
  }
}
