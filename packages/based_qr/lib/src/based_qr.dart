import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:pretty_qr_code/src/rendering/pretty_qr_painting_context.dart';

class BasedQr extends StatefulWidget {
  /// Creates a meshed gradient with provided colors and animates between them.
  const BasedQr({
    super.key,
    this.image,
    required this.qrImage,
    required this.colors,
    required this.options,
    this.controller,
    this.seed,
  });

  final PrettyQrDecorationImage? image;

  final QrImage qrImage;

  /// Define 4 colors which will be used to create an animated gradient.
  final List<Color> colors;

  /// Here you can define options to play with the animation / effect.
  final BasedQrOptions options;

  /// Sets a seed for the mesh gradient which gives back a static blended gradient based on the given colors.
  /// This settings stops the animation. Try out different values until you like what you see.
  final double? seed;

  /// Can be used to start / stop the animation manually. Will be ignored if [seed] is set.
  final BasedQrController? controller;

  @override
  State<BasedQr> createState() => _BasedQrState();
}

class _BasedQrState extends State<BasedQr> {
  late double _time = widget.seed ?? 0;

  void _timeLoop() {
    if (!mounted) return;

    if (widget.controller != null
        ? !widget.controller!.isAnimating.value
        : false) {
      return;
    }

    setState(() {
      _time += 16 / 1000;
    });

    Future.delayed(const Duration(milliseconds: 16), () => _timeLoop());
  }

  @override
  void initState() {
    if (widget.colors.length != 4) {
      throw Exception(
          'Condition colors.length == 4 is not true. Assign exactly 4 colors.');
    }

    super.initState();

    if (widget.seed != null) {
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.controller == null) {
        _timeLoop();
      }

      if (widget.controller != null && widget.seed == null) {
        widget.controller!.isAnimating.addListener(() {
          if (widget.controller!.isAnimating.value) {
            _timeLoop();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ShaderBuilder(
      assetKey: 'packages/mesh_gradient/shaders/animated_mesh_gradient.frag',
      (context, shader, child) {
        return CustomPaint(
          size: Size.infinite,
          painter: BasedQrPainter(
            configuration: createLocalImageConfiguration(context),
            shader: shader,
            time: _time,
            image: widget.image,
            qrImage: widget.qrImage,
            colors: widget.colors,
            options: widget.options,
          ),
          willChange: true,
        );
      },
    );
  }
}

class BasedQrOptions {
  BasedQrOptions({
    this.frequency = 5,
    this.amplitude = 30,
    this.speed = 2,
  });

  /// Sets the frequency of the gradient.
  final double frequency;

  /// Sets the amplitude of the gradient.
  final double amplitude;

  /// Sets the speed of the animation. This is a factor and is used in the computation, which makes it behave differently based on the other values provided.
  final double speed;
}

class BasedQrController {
  /// Use [ValueListenableBuilder] to listen to changes in your widget.
  ValueNotifier isAnimating = ValueNotifier(false);

  void start() => isAnimating.value = true;

  void stop() => isAnimating.value = false;
}

class BasedQrPainter extends CustomPainter {
  BasedQrPainter({
    this.image,
    required this.qrImage,
    required this.configuration,
    required this.shader,
    required this.time,
    required this.colors,
    required this.options,
  });
  final PrettyQrDecorationImage? image;
  final QrImage qrImage;
  final ImageConfiguration configuration;
  final FragmentShader shader;
  final double time;
  final List<Color> colors;
  final BasedQrOptions options;

  @override
  void paint(Canvas canvas, Size size) {
    //uSize
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    //uTime
    shader.setFloat(2, time);

    //values
    shader.setFloat(3, options.frequency);
    shader.setFloat(4, options.amplitude);
    shader.setFloat(5, options.speed);

    //colors
    int i = 6;
    for (final color in colors) {
      shader.setFloat(i, color.red / 255);
      i++;
      shader.setFloat(i, color.green / 255);
      i++;
      shader.setFloat(i, color.blue / 255);
      i++;
    }

    canvas.save();

    try {
      final paintingSize = Size.square(
        configuration.size?.shortestSide ?? size.shortestSide,
      );

      final paintingContext = PrettyQrPaintingContext(
        canvas,
        Offset.zero & paintingSize,
        matrix: PrettyQrMatrix.fromQrImage(qrImage),
        textDirection: configuration.textDirection,
      );

      PrettyQrDecoration(
              image: image, shape: PrettyQrSmoothSymbol(shader: shader))
          .createPainter(() {})
          .paint(paintingContext, configuration);
    } finally {
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant BasedQrPainter oldDelegate) =>
      oldDelegate.colors != colors ||
      oldDelegate.configuration != configuration ||
      oldDelegate.image != image ||
      oldDelegate.options != options ||
      oldDelegate.qrImage != qrImage ||
      oldDelegate.shader != shader ||
      oldDelegate.time != time;
}

/// A rectangular symbol with smoothed flow.
class PrettyQrSmoothSymbol extends PrettyQrShape {
  /// The color of QR symbol.
  final FragmentShader? shader;

  /// The corners of dots are rounded by this [BorderRadiusGeometry] value.
  final double roundFactor;

  /// Creates a pretty QR shape.
  const PrettyQrSmoothSymbol({
    this.roundFactor = 1,
    this.shader,
  })  : assert(roundFactor <= 1, 'roundFactor must be less than 1'),
        assert(roundFactor >= 0, 'roundFactor must be greater than 0');

  @override
  void paint(PrettyQrPaintingContext context) {
    final path = Path();
    final paint = Paint()
      ..shader = shader
      ..isAntiAlias = true
      ..style = PaintingStyle.fill;

    for (final module in context.matrix) {
      final moduleRect = module.resolveRect(context);
      final moduleNeighbors = context.matrix.getNeighboursDirections(module);
      late Path modulePath;

      if (module.isDark) {
        modulePath = Path();
        modulePath.addRRect(
          transformDarkModuleRect(moduleRect, moduleNeighbors),
        );
      } else {
        modulePath = transformWhiteModuleRect(moduleRect, moduleNeighbors);
      }

      if (context.isImpellerEngineEnabled) {
        context.canvas.drawPath(modulePath, paint);
      } else {
        path.addPath(modulePath, Offset.zero);
      }
    }

    context.canvas.drawPath(path, paint);
  }

  @protected
  RRect transformDarkModuleRect(
    final Rect moduleRect,
    final Set<PrettyQrNeighbourDirection> neighbors,
  ) {
    final cornersRadius = Radius.circular(
      moduleRect.shortestSide / 2 * roundFactor.clamp(0.0, 1.0),
    );

    if (!neighbors.hasClosest) {
      return RRect.fromRectAndRadius(moduleRect, cornersRadius / 2);
    }

    return RRect.fromRectAndCorners(
      moduleRect,
      topLeft: neighbors.atTopOrLeft ? Radius.zero : cornersRadius,
      topRight: neighbors.atTopOrRight ? Radius.zero : cornersRadius,
      bottomLeft: neighbors.atBottomOrLeft ? Radius.zero : cornersRadius,
      bottomRight: neighbors.atBottomOrRight ? Radius.zero : cornersRadius,
    );
  }

  @protected
  Path transformWhiteModuleRect(
    final Rect moduleRect,
    final Set<PrettyQrNeighbourDirection> neighbors,
  ) {
    final path = Path();
    final padding = (roundFactor / 2).clamp(0.0, 0.5) * moduleRect.longestSide;

    if (neighbors.atTopAndLeft && neighbors.atToptLeft) {
      path.addPath(
        buildInnerCornerShape(
          moduleRect.topLeft.translate(0, padding),
          moduleRect.topLeft,
          moduleRect.topLeft.translate(padding, 0),
        ),
        Offset.zero,
      );
    }

    if (neighbors.atTopAndRight && neighbors.atToptRight) {
      path.addPath(
        buildInnerCornerShape(
          moduleRect.topRight.translate(-padding, 0),
          moduleRect.topRight,
          moduleRect.topRight.translate(0, padding),
        ),
        Offset.zero,
      );
    }

    if (neighbors.atBottomAndLeft && neighbors.atBottomLeft) {
      path.addPath(
        buildInnerCornerShape(
          moduleRect.bottomLeft.translate(0, -padding),
          moduleRect.bottomLeft,
          moduleRect.bottomLeft.translate(padding, 0),
        ),
        Offset.zero,
      );
    }

    if (neighbors.atBottomAndRight && neighbors.atBottomRight) {
      path.addPath(
        buildInnerCornerShape(
          moduleRect.bottomRight.translate(-padding, 0),
          moduleRect.bottomRight,
          moduleRect.bottomRight.translate(0, -padding),
        ),
        Offset.zero,
      );
    }

    return path;
  }

  @protected
  Path buildInnerCornerShape(Offset p1, Offset p2, Offset p3) {
    return Path()
      ..moveTo(p1.dx, p1.dy)
      ..quadraticBezierTo(p2.dx, p2.dy, p3.dx, p3.dy)
      ..lineTo(p2.dx, p2.dy)
      ..lineTo(p1.dx, p1.dy)
      ..close();
  }

  @override
  PrettyQrSmoothSymbol? lerpFrom(PrettyQrShape? a, double t) {
    if (identical(a, this)) {
      return this;
    }

    if (a == null) return this;
    if (a is! PrettyQrSmoothSymbol) return null;

    if (t == 0.0) return a;
    if (t == 1.0) return this;

    return PrettyQrSmoothSymbol(
      roundFactor: lerpDouble(a.roundFactor, roundFactor, t)!,
    );
  }

  @override
  PrettyQrSmoothSymbol? lerpTo(PrettyQrShape? b, double t) {
    if (identical(this, b)) {
      return this;
    }

    if (b == null) return this;
    if (b is! PrettyQrSmoothSymbol) return null;

    if (t == 0.0) return this;
    if (t == 1.0) return b;

    return PrettyQrSmoothSymbol(
      roundFactor: lerpDouble(roundFactor, b.roundFactor, t)!,
    );
  }

  @override
  int get hashCode {
    return runtimeType.hashCode ^ roundFactor.hashCode;
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other.runtimeType != runtimeType) return false;

    return other is PrettyQrSmoothSymbol && other.roundFactor == roundFactor;
  }
}
