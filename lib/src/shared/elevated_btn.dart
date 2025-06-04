import '../global_export.dart';

class A12ElevatedBtn extends StatelessWidget {
  const A12ElevatedBtn({
    super.key,
    required this.btnTitle,
    required this.onPressed,
    this.height,
    this.bgColor,
    this.fgColor,
  });

  final String btnTitle;
  final void Function()? onPressed;
  final double? height;
  final Color? bgColor, fgColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:  onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: fgColor,
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        fixedSize: Size(context.screenWidth, height ?? 40)
      ),
      child: Text(btnTitle),
    );
  }
}

enum ButtonState { pressed, active, disabled }