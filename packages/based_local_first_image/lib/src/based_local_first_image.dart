import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/foundation.dart';

@immutable
class BasedLocalFirstImage extends ImageProvider<BasedLocalFirstImage> {
  const BasedLocalFirstImage({
    required this.filename,
    required this.localDirectory,
    this.scale = 1.0,
    this.remoteUrl,
    this.headers,
  });

  final String filename;
  final String localDirectory;
  final double scale;
  final String? remoteUrl;
  final Map<String, String>? headers;

  @override
  Future<BasedLocalFirstImage> obtainKey(
    ImageConfiguration configuration,
  ) {
    return SynchronousFuture<BasedLocalFirstImage>(this);
  }

  @override
  ImageStreamCompleter loadImage(
    BasedLocalFirstImage key,
    ImageDecoderCallback decode,
  ) {
    final chunkEvents = StreamController<ImageChunkEvent>();
    final imageStreamCompleter = MultiFrameImageStreamCompleter(
      codec: _loadImageAsync(key, chunkEvents, decode),
      scale: scale,
      chunkEvents: chunkEvents.stream,
    );

    return imageStreamCompleter;
  }

  // Do not access this field directly; use [_httpClient] instead.
  // We set `autoUncompress` to false to ensure that we can trust the value of
  // the `Content-Length` HTTP header. We automatically uncompress the content
  // in our call to [consolidateHttpClientResponseBytes].
  static final HttpClient _sharedHttpClient = HttpClient()
    ..autoUncompress = false;

  static HttpClient get _httpClient {
    HttpClient? client;
    assert(() {
      if (debugNetworkImageHttpClientProvider != null) {
        client = debugNetworkImageHttpClientProvider!();
      }
      return true;
    }());
    return client ?? _sharedHttpClient;
  }

  Future<ui.Codec> _loadImageAsync(
    BasedLocalFirstImage key,
    StreamController<ImageChunkEvent> chunkEvents,
    ImageDecoderCallback decode,
  ) async {
    assert(key == this);

    try {
      final filePath = path.join(key.localDirectory, key.filename);
      final file = File(filePath);

      if (file.existsSync()) {
        return decode(await ui.ImmutableBuffer.fromFilePath(filePath));
      }

      if (key.remoteUrl == null) {
        throw Exception(
          'remoteUrl is null, can not download $filename from network',
        );
      }

      final resolved = Uri.base.resolve(remoteUrl!);

      final request = await _httpClient.getUrl(resolved);
      headers?.forEach(request.headers.add);

      final response = await request.close();

      if (response.statusCode != HttpStatus.ok) {
        await response.drain<List<int>>(<int>[]);
        throw NetworkImageLoadException(
          statusCode: response.statusCode,
          uri: resolved,
        );
      }

      final bytes = await consolidateHttpClientResponseBytes(
        response,
        onBytesReceived: (int cumulative, int? total) {
          chunkEvents.add(
            ImageChunkEvent(
              cumulativeBytesLoaded: cumulative,
              expectedTotalBytes: total,
            ),
          );
        },
      );

      if (bytes.lengthInBytes == 0) {
        throw Exception('RemoteUrl is an empty file: $resolved');
      }

      file.parent.createSync(recursive: true);
      file.writeAsBytes(bytes);

      return decode(await ui.ImmutableBuffer.fromUint8List(bytes));
    } catch (e) {
      scheduleMicrotask(() {
        PaintingBinding.instance.imageCache.evict(key);
      });
      rethrow;
    } finally {
      chunkEvents.close();
    }
  }

  @override
  bool operator ==(Object other) {
    if (other is! BasedLocalFirstImage) return false;
    return filename == other.filename &&
        localDirectory == other.localDirectory &&
        remoteUrl == other.remoteUrl;
  }

  @override
  int get hashCode => Object.hash(filename, localDirectory, remoteUrl);

  @override
  String toString() =>
      'BasedLocalFirstImageProvider(filename: "$filename", localDirectory:"$localDirectory")';
}
