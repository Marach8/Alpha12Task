import 'package:another_flushbar/flushbar.dart';
import '../../global_export.dart';

Future<dynamic> showAppNotification({
  required BuildContext context,
  required Widget? icon,
  required String text,
  int? duration,
  Color? bgColor,
}) async {
  late Flushbar<dynamic> flushbar;

  flushbar = Flushbar<dynamic>(
    backgroundColor: A12Colors.transparent,
    flushbarPosition: FlushbarPosition.TOP,
    duration: Duration(seconds: duration ?? 3),
    messageText: Center(
      child: A12Container(
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 20,
            spreadRadius: 20,
            offset: const Offset(0, 10),
            color: A12Colors.black.withValues(alpha: 0.5),
          ),
        ],
        radius: 10,
        color: bgColor ?? A12Colors.white,
        padding: const EdgeInsets.all(10),
        child: CustomPaint(
          painter: LeftBorderPainter(
            width: 5,
            color: A12Colors.hex10B981,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (icon != null) icon,
              if (icon != null) const SizedBox(width: 10),
              Flexible(
                child: Text(
                  text,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              GestureDetector(
                onTap: () => flushbar.dismiss(),
                child: const Icon(Icons.close),
              ),
            ],
          ),
        ),
      ),
    ),
  );

  return flushbar.show(context);
}



class LeftBorderPainter extends CustomPainter {

  LeftBorderPainter({required this.color, this.width = 3.0});
  final Color color;
  final double width;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = width
      ..style = PaintingStyle.stroke;

    canvas.drawLine(const Offset(0, 0), Offset(0, size.height), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}