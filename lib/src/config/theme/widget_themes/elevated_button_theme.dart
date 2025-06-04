import '../../../global_export.dart';

class A12ElevatedButtonTheme{
  const A12ElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: A12Colors.white,
      backgroundColor: A12Colors.hex60B5FF,
      disabledBackgroundColor: A12Colors.hexE2E8F0,
      disabledForegroundColor: A12Colors.hex64748B,
      textStyle: TextStyle(
        fontSize: A12FontSizes.size14,
        fontWeight: A12FontWeights.w700,
        height: 1.43
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))
    )
  );

  //Implement darkTheme here
}