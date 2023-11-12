import 'dart:math';
import 'package:flutter/material.dart';

class BasedAvatar extends StatelessWidget {
  const BasedAvatar({
    super.key,
    this.image,
    this.size = 40,
    this.backgroundColor,
    this.onTap,
    this.onDoubleTap,
    this.onLongPress,
    this.loadingBuilder,
    this.errorBuilder,
    this.placeholder,
    this.badge,
    this.badgeAlignment = Alignment.bottomRight,
  });

  /// Image for [BasedAvatar]
  final ImageProvider? image;

  /// Size for [BasedAvatar]
  final double size;

  /// Background Color for [BasedAvatar] when [image] doesn't provide or loaded
  final Color? backgroundColor;

  /// When [BasedAvatar] tapped
  final GestureTapCallback? onTap;

  /// When [BasedAvatar] tapped twice quickly
  final GestureTapCallback? onDoubleTap;

  /// When [BasedAvatar] on long press
  final GestureLongPressCallback? onLongPress;

  /// A builder that specifies the widget to display to the user while an image
  /// is still loading.
  final ImageLoadingBuilder? loadingBuilder;

  /// A builder function that is called if an error occurs during image loading.
  final ImageErrorWidgetBuilder? errorBuilder;

  /// Placeholder for [BasedAvatar] when [image] doesn't provide or loaded
  final Widget? placeholder;

  /// A widget typically used to decorate the [BasedAvatar]
  final Widget? badge;

  /// Alignment of [badge], default to [Alignment.bottomRight]
  final Alignment badgeAlignment;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          onDoubleTap: onDoubleTap,
          onLongPress: onLongPress,
          child: Stack(
            children: [
              Material(
                clipBehavior: Clip.antiAlias,
                color: backgroundColor ?? _getRandomColor(),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: isDark
                        ? Colors.white.withAlpha(32)
                        : Colors.black.withAlpha(32),
                    width: size / 32,
                  ),
                  borderRadius: BorderRadius.circular(size / 2),
                ),
                child: SizedBox(
                  width: size,
                  height: size,
                  child: image != null
                      ? Image(
                          fit: BoxFit.cover,
                          image: image!,
                          loadingBuilder:
                              loadingBuilder ?? _defaultLoadingBuilder,
                          errorBuilder: errorBuilder ?? _defaultErrorBuilder,
                        )
                      : Center(child: placeholder),
                ),
              ),
              _fillWith(
                alignment: badgeAlignment,
                distance: size,
                child: Center(child: badge),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getRandomColor() => Color(hashCode % 0xFFFFFFFF);

  Positioned _fillWith({
    required Alignment alignment,
    required double distance,
    required Widget child,
  }) {
    double x = alignment.x;
    double y = alignment.y;
    double zoomDistance = sqrt(x * x + y * y);
    double ratio = zoomDistance != 0 ? distance / zoomDistance : 0;
    return Positioned.fill(left: x * ratio, top: y * ratio, child: child);
  }

  Widget _defaultErrorBuilder(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  ) =>
      Center(child: placeholder);

  Widget _defaultLoadingBuilder(
    BuildContext context,
    Widget child,
    ImageChunkEvent? loadingProgress,
  ) =>
      loadingProgress != null ? const CircularProgressIndicator() : child;
}
