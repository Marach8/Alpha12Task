import '../../../global_export.dart';

class A12AppBarTheme{
  const A12AppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    backgroundColor: A12Colors.hexFBFBFB,
    titleTextStyle: TextStyle(
      color: A12Colors.hex1B1B1B,
      fontSize: A12FontSizes.size16,
      fontWeight: A12FontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),
  );


  static AppBarTheme darkAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    backgroundColor: A12Colors.black,
    titleTextStyle: TextStyle(
      color: A12Colors.white,
      fontSize: A12FontSizes.size16,
      fontWeight: A12FontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),
  );
}
