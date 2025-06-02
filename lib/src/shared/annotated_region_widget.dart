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
    final bool inDarkMode = context.inDarkMode;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: inDarkMode ? A12Colors.hex121212 : A12Colors.hexFBFBFB,
        statusBarColor: inDarkMode ? A12Colors.hex121212 : A12Colors.hexFBFBFB,
        statusBarIconBrightness: inDarkMode ? Brightness.light : Brightness.dark,
        systemNavigationBarIconBrightness: inDarkMode ? Brightness.light : Brightness.dark,
      ),
      child: child
    );
  }
}