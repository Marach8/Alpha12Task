import 'package:flutter_riverpod/flutter_riverpod.dart';

//handy family providers for quick usage.
//Every family member is identified by a unique string
final StateProviderFamily<int, String> intProvider = StateProvider.family<int, String>(
  (_, __) => 0
);



final StateProviderFamily<String, String> stringProvider = StateProvider.family<String, String>(
  (_, __) => ''
);



final StateProviderFamily<bool, String> boolProvider = StateProvider.family<bool, String>(
  (_, __) => false
);



final StateProviderFamily<Object?, String> objectProvider = StateProvider.family<Object?, String>(
  (_, __) => null
);