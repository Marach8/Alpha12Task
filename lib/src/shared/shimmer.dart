import 'package:shimmer/shimmer.dart';
import '../global_export.dart';

class A12Shimmer extends StatelessWidget {
  const A12Shimmer({
    super.key,
    this.height,
    this.width,
    this.radius,
    this.color,
    this.margin,
  });

  final double? height, width, radius;
  final EdgeInsetsGeometry? margin;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: (color ?? A12Colors.hex999999).withValues(alpha: 0.8),
      highlightColor: (color ?? A12Colors.hex999999).withValues(alpha: 0.7),
      child: A12Container(
        margin: margin,
        height: height ?? 40, radius: radius ?? 8,
        color: (color ?? A12Colors.hex999999).withValues(alpha: 0.8),
        width: width ?? context.screenWidth,
      ),
    );
  }
}
