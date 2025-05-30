import '../../../global_export.dart';

class AlphaInputDecorationTheme{
  const AlphaInputDecorationTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 1,
    isDense: true,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    fillColor: AlphaColors.transparent,
    filled: true,
    hintStyle: TextStyle(
      color: AlphaColors.black.withValues(alpha: 0.5),
      fontSize: AlphaFontSizes.size14,
      fontWeight: AlphaFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),
    errorStyle: TextStyle(
      color: AlphaColors.red.withValues(alpha: 0.6),
      fontSize: AlphaFontSizes.size12,
      fontWeight: AlphaFontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),

    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: AlphaColors.hex1B1B1B
      )
    ),

    disabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: AlphaColors.hex1B1B1B.withValues(alpha: 0.2)
      )
    ),

    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: AlphaColors.red.withValues(alpha: 0.6)
      )
    ),

    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.8,
        color: AlphaColors.red.withValues(alpha: 0.8)
      )
    ),

    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.8,
        color: AlphaColors.hex1B1B1B
      )
    ),
  );



  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 1,
    isDense: true,
    contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    fillColor: AlphaColors.transparent,
    filled: true,
    hintStyle: TextStyle(
      color: AlphaColors.white.withValues(alpha: 0.5),
      fontSize: AlphaFontSizes.size14,
      fontWeight: AlphaFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: AlphaColors.white.withValues(alpha: 0.5)
      )
    ),

    errorStyle: TextStyle(
      color: AlphaColors.red.withValues(alpha: 0.6),
      fontSize: AlphaFontSizes.size12,
      fontWeight: AlphaFontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),


    disabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: AlphaColors.white.withValues(alpha: 0.2)
      )
    ),

    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.5,
        color: AlphaColors.red.withValues(alpha: 0.6)
      )
    ),

    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.8,
        color: AlphaColors.red.withValues(alpha: 0.8)
      )
    ),

    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        width: 0.8,
        color: AlphaColors.white
      )
    ),
  );
}