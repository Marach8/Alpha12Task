import 'package:flutter/material.dart';

class A12AnimatedXFade extends StatelessWidget {
  const A12AnimatedXFade({
    super.key,
    required this.children,
    required this.selectedIndex,
    this.duration = 300,
    this.curve = Curves.easeOut
  });

  final List<Widget> children;
  final int duration, selectedIndex;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: duration),
      reverseDuration: Duration(milliseconds: duration ?? 500),
      switchInCurve: curve,
      switchOutCurve: curve,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      child: children.elementAtOrNull(selectedIndex),
    );
  }
}