import 'package:flutter/services.dart';
import '../global_export.dart';

class A12AnnotatedRegion extends StatelessWidget {
  const A12AnnotatedRegion({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: A12Colors.white,
        statusBarColor: A12Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: child
    );
  }
}