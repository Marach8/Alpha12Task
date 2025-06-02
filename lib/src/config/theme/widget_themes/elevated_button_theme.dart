
import '../../../global_export.dart';

class A12ElevatedButtonTheme{
  const A12ElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: A12Colors.white,
      backgroundColor: A12Colors.hex60B5FF,
      disabledForegroundColor: A12Colors.hex1B1B1B.withValues(alpha: 0.3),
      disabledBackgroundColor: A12Colors.transparent,
      textStyle: TextStyle(
        fontSize: A12FontSizes.size14,
        fontWeight: A12FontWeights.w700,
        height: 1.43
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
    )
  );

  static ElevatedButtonThemeData darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: A12Colors.white,
      backgroundColor: A12Colors.hex60B5FF,
      disabledForegroundColor: A12Colors.hex1B1B1B.withValues(alpha: 0.3),
      disabledBackgroundColor: A12Colors.transparent,
      textStyle: TextStyle(
        fontSize: A12FontSizes.size14,
        fontWeight: A12FontWeights.w700,
        height: 1.43
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
    )
  );
}