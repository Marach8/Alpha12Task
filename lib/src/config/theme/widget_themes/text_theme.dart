import '../../../global_export.dart';

class A12TextTheme{
  const A12TextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineSmall: TextStyle(
      color: A12Colors.black,
      fontSize: A12FontSizes.size18,
      fontWeight: A12FontWeights.w700,
      overflow: TextOverflow.ellipsis,
    ),

    titleLarge: TextStyle(
      color: A12Colors.hex334155,
      fontSize: A12FontSizes.size12,
      fontWeight: A12FontWeights.w600,
      overflow: TextOverflow.ellipsis,
      height: 2.33
    ),

    titleMedium: TextStyle(
      color: A12Colors.hex334155,
      fontSize: A12FontSizes.size10,
      fontWeight: A12FontWeights.w600,
      overflow: TextOverflow.ellipsis,
      height: 2.8
    ),
    
    titleSmall: TextStyle(
      color: A12Colors.black,
      fontSize: A12FontSizes.size14,
      fontWeight: A12FontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),

    bodyMedium: TextStyle(
      color: A12Colors.hex999999,
      fontSize: A12FontSizes.size14,
      fontWeight: A12FontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),

    labelMedium: TextStyle(
      color: A12Colors.hex49454F,
      fontSize: A12FontSizes.size12,
      fontWeight: A12FontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),

    labelSmall: TextStyle(
      color: A12Colors.hex10B981,
      fontSize: A12FontSizes.size12,
      fontWeight: A12FontWeights.w400,
      overflow: TextOverflow.ellipsis,
      height: 1.3
    ),
  );


  //Implement dark Theme here
}