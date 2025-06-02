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
      color: A12Colors.hexCBD5E1,
      fontSize: A12FontSizes.size14,
      fontWeight: A12FontWeights.w400,
      overflow: TextOverflow.ellipsis,
      height: 1.43
    ),
    errorStyle: TextStyle(
      color: A12Colors.red.withValues(alpha: 0.6),
      fontSize: A12FontSizes.size12,
      fontWeight: A12FontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),

    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: A12Colors.hexE2E8F0)
    ),

    disabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        width: 0.5,
        color: A12Colors.hex1B1B1B.withValues(alpha: 0.2)
      )
    ),

    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        width: 0.5,
        color: A12Colors.red.withValues(alpha: 0.6)
      )
    ),

    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        width: 0.8,
        color: A12Colors.red.withValues(alpha: 0.8)
      )
    ),

    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: A12Colors.hexE2E8F0)
    ),
  );



  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 1,
    isDense: true,
    contentPadding: const EdgeInsets.all(8),
    fillColor: A12Colors.black,
    filled: true,
    hintStyle: TextStyle(
      color: A12Colors.hex334155,
      fontSize: A12FontSizes.size14,
      fontWeight: A12FontWeights.w400,
      overflow: TextOverflow.ellipsis,
      height: 1.43
    ),

    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: A12Colors.hex1E293B)
    ),

    errorStyle: TextStyle(
      color: A12Colors.red.withValues(alpha: 0.6),
      fontSize: A12FontSizes.size12,
      fontWeight: A12FontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),


    disabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        width: 0.5,
        color: A12Colors.white.withValues(alpha: 0.2)
      )
    ),

    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        width: 0.5,
        color: A12Colors.red.withValues(alpha: 0.6)
      )
    ),

    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(
        width: 0.8,
        color: A12Colors.red.withValues(alpha: 0.8)
      )
    ),

    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(5),
      borderSide: BorderSide(color: A12Colors.hex1E293B)
    ),
  );
}