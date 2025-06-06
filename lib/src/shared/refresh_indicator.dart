import 'package:flutter/material.dart';

class A12RefreshIndicator extends StatelessWidget {
  const A12RefreshIndicator({
    super.key,
    required this.onRefresh,
    required this.child,
  });

  final Future<void> Function() onRefresh;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Theme.of(context).textTheme.labelMedium?.color,
      color: Theme.of(context).scaffoldBackgroundColor,
      strokeWidth: 1.5,
      onRefresh: onRefresh,
      child: child,
    );
  }
}