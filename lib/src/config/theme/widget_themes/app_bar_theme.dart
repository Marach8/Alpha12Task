import '../../../global_export.dart';

class A12AppBarTheme{
  const A12AppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    backgroundColor: A12Colors.hexFBFBFB,
    titleTextStyle: TextStyle(
      color: A12Colors.hex334155,
      fontSize: A12FontSizes.size10,
      fontWeight: A12FontWeights.w600,
      overflow: TextOverflow.ellipsis,
      height: 2.8
    ),
  );


  //Implement dark Theme here
}
