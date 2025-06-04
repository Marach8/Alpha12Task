import 'package:flutter/material.dart';

class A12AnimatedSlide extends StatelessWidget {
  const A12AnimatedSlide({
    super.key,
    required this.child,
    this.duration = 500,
    this.beginOffset = const Offset(0, 0),
    this.endOffset = const Offset(0, 1.5),
    required this.endCondition,
  });

  final Widget child;
  final int duration;
  final Offset beginOffset, endOffset;
  final bool endCondition;

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      offset: endCondition ? endOffset : beginOffset,
      duration: Duration(milliseconds: duration),
      child: child,
    );
  }
}