import 'package:flutter/material.dart' show BuildContext, MediaQuery, Brightness;
import 'package:flutter_riverpod/flutter_riverpod.dart' show ProviderContainer, ProviderScope;

extension ContextExtensions on BuildContext{
  double get getScreenWidth => MediaQuery.sizeOf(this).width;
  
  double get getScreenHeight => MediaQuery.sizeOf(this).height;

  Brightness get getBrightness => MediaQuery.platformBrightnessOf(this);


  ProviderContainer get getRef => ProviderScope.containerOf(this, listen: false);
}