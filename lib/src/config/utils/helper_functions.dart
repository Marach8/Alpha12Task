import 'dart:async';
import 'dart:math';


class A12HelperFuncs{
  const A12HelperFuncs._();

  
  static int getRandomNumber(double ceiling){
    final int number = Random().nextInt(ceiling.toInt()) + 1;
    if(number < 100){
      return 100 + number;
    }
    return number;
  }


  static Timer? _debounce;
  static void callDebouncer(int duration, Function func, [List<dynamic>? args]) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(
      Duration(milliseconds: duration),
      () {
        if (args != null) {Function.apply(func, args);}
        else {func();}
      }
    );
  }

  static void disposeDebouncer() {
    _debounce?.cancel();
  }
}