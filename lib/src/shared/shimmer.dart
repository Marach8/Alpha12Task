import 'package:shimmer/shimmer.dart';
import '../global_export.dart';

class A12Shimmer extends StatelessWidget {
  const A12Shimmer({
    super.key,
    this.height,
    this.width,
    this.radius,
    this.baseColor,
    this.highlightColor,
    this.margin,
  });

  final double? height, width, radius;
  final EdgeInsetsGeometry? margin;
  final Color? highlightColor, baseColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? A12Colors.white.withValues(alpha: 0.7),
      highlightColor: highlightColor ?? A12Colors.hex9A9A9A,
      child: A12Container(
        margin: margin,
        height: height ?? 150, radius: radius ?? 10,
        color: baseColor ?? A12Colors.hexBCBCBC,
        width: width ?? context.screenWidth,
      ),
    );
  }
}
