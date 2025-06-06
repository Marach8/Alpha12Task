import 'dart:math' as math show min;
import 'dart:ui' show PathMetrics, PathMetric;
import 'package:flutter/material.dart';
import '../config/utils/colors.dart';


class DottedBorderPainter extends CustomPainter {
  DottedBorderPainter({
    this.strokeWidth = 1,
    this.dashLength = 2,
    this.dashGap = 2.5,
    this.borderRadius,
    this.color,
  });

  final Color? color;
  final double strokeWidth;
  final double dashLength;
  final double dashGap;
  final BorderRadius? borderRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color ?? A12Colors.hex2563EB
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Rect rect = Offset.zero & size;

    Path path;

    if (borderRadius != null && borderRadius != BorderRadius.zero) {
      // If borderRadius is provided, use RRect (rounded rectangle)
      path = Path()..addRRect(borderRadius!.toRRect(rect));
    } else {
      // Otherwise, use a simple rectangle
      path = Path()..addRect(rect);
    }

    final PathMetrics pathMetrics = path.computeMetrics();

    for (final PathMetric pathMetric in pathMetrics) {
      double currentLength = 0.0;
      while (currentLength < pathMetric.length) {
        final double end = math.min(currentLength + dashLength, pathMetric.length);
        final Path segment = pathMetric.extractPath(currentLength, end);
        canvas.drawPath(segment, paint);
        currentLength = end + dashGap;
      }
    }
  }

  @override
  bool shouldRepaint(_) => false;
}