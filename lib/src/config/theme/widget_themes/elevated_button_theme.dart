
import '../../../global_export.dart';

class AlphaElevatedButtonTheme{
  const AlphaElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AlphaColors.white,
      backgroundColor: AlphaColors.hex1B1B1B,
      disabledForegroundColor: AlphaColors.white.withValues(alpha: 0.3),
      disabledBackgroundColor: AlphaColors.transparent,
      textStyle: TextStyle(
        fontSize: AlphaFontSizes.size18,
        fontWeight: AlphaFontWeights.w600
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
    )
  );

  static ElevatedButtonThemeData darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AlphaColors.hex1B1B1B,
      backgroundColor: AlphaColors.white,
      disabledForegroundColor: AlphaColors.hex1B1B1B.withValues(alpha: 0.3),
      disabledBackgroundColor: AlphaColors.transparent,
      textStyle: TextStyle(
        fontSize: AlphaFontSizes.size18,
        fontWeight: AlphaFontWeights.w600
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
    )
  );
}