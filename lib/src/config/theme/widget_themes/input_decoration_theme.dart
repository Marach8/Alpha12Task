import '../../../global_export.dart';

class A12InputDecorationTheme{
  const A12InputDecorationTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 1,
    isDense: true,
    contentPadding: const EdgeInsets.all(8),
    fillColor: A12Colors.white,
    filled: true,
    hintStyle: TextStyle(
      //color: A12Colors.hexCBD5E1,
      fontSize: A12FontSizes.size14,
      fontWeight: A12FontWeights.w400,
      overflow: TextOverflow.ellipsis,
      height: 1.43
    ),
    errorStyle: TextStyle(
      color: A12Colors.hexFF2D55.withValues(alpha: 0.6),
      fontSize: A12FontSizes.size12,
      fontWeight: A12FontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),

    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: A12Colors.hexE2E8F0)
    ),

    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        width: 0.5,
        color: A12Colors.hexFF2D55.withValues(alpha: 0.6)
      )
    ),

    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        width: 0.8,
        color: A12Colors.hexFF2D55.withValues(alpha: 0.8)
      )
    ),

    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: A12Colors.hexE2E8F0)
    ),
  );


  //Implement dark Theme here
}