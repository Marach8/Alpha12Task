import 'package:flutter/material.dart' show BuildContext, MediaQuery;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderContainer, ProviderScope;

extension ContextExtensions on BuildContext{
  double get screenWidth => MediaQuery.sizeOf(this).width;
  
  double get screenHeight => MediaQuery.sizeOf(this).height;


  ProviderContainer get ref => ProviderScope.containerOf(this, listen: false);
}