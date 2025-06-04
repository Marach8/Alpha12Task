import '../global_export.dart';

class A12Divider extends StatelessWidget {
  const A12Divider({
    super.key,
    this.axis = AxisType.horizontal,
    this.height,
    this.color
  });

  final AxisType? axis;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final bool isHorizontal = axis == AxisType.horizontal;
    return Container(
      color: (color ?? Theme.of(context).scaffoldBackgroundColor).withValues(alpha: 0.3),
      height: isHorizontal ? 0.5 : height,
      width: isHorizontal ? context.screenWidth : 0.5,
      child: const SizedBox.shrink(),
    );
  }
}

enum AxisType {vertical, horizontal}