import 'dart:math' as math;
import 'dart:ui' show PathMetrics, PathMetric;

import '../global_export.dart';

class A12MainAppShell extends ConsumerStatefulWidget {
  const A12MainAppShell({
    super.key,
    required this.body
  });
  final Widget body;

  @override
  ConsumerState<A12MainAppShell> createState() => _A12MainAppShellState();
}

class _A12MainAppShellState extends ConsumerState<A12MainAppShell> {

  @override 
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _initialize()
    );
  }

  void _initialize(){
    ref.read(productsProvider.notifier).fetchProducts();
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return A12AnnotatedRegion(
      child: Scaffold(
        appBar: A12AppBar(
          leadingWidth: 56,
          leading: A12Container(
            color: A12Colors.hex93C5FD, height: 28,
            margin: const EdgeInsets.all(0.5),
            child: CustomPaint(
              painter: _DottedBorderPainter(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(4.38, 0, 4.38, 0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    'Full Logo',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontSize: 10.5, height: 1.3, color: A12Colors.hex2563EB
                    ),
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            A12Strings.DELIVERY_ADDRS.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium
          ),
          actions: <Widget>[
            const A12ImgLoader(imgPath: A12ImgStrings.NOTIF_ICON),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(35),
            child: A12Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 15),
              height: 20,
              child: Consumer(
                builder: (_, WidgetRef ref, __) {
                  return Text(
                    'Umezurike Road, Oyo State',
                    style: Theme.of(context).textTheme.titleLarge
                  );
                }
              ),
            ),
          )
        ),
        body: widget.body,
        resizeToAvoidBottomInset: false,
      ),
    );
  }
}







class _DottedBorderPainter extends CustomPainter {
  _DottedBorderPainter();

  final Color color = A12Colors.hex2563EB;
  final double strokeWidth = 1;
  final double dashLength = 2;
  final double gapLength = 2.5;
  final BorderRadius? borderRadius = null;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
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
        currentLength = end + gapLength;
      }
    }
  }

  @override
  bool shouldRepaint(_) => false;
}