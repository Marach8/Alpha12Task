import '../../global_export.dart';

class AlphaThemeData{
  const AlphaThemeData._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: AlphaStrings.IBM_PLEX_SANS,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AlphaColors.white,
    textTheme: AlphaTextTheme.lightTextTheme,
    inputDecorationTheme: AlphaInputDecorationTheme.lightInputDecorationTheme,
    appBarTheme: AlphaAppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: AlphaElevatedButtonTheme.lightElevatedButtonTheme
  );


  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: AlphaStrings.IBM_PLEX_SANS,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AlphaColors.black,
    textTheme: AlphaTextTheme.darkTextTheme,
    inputDecorationTheme: AlphaInputDecorationTheme.darkInputDecorationTheme,
    appBarTheme: AlphaAppBarTheme.darkAppBarTheme,
    elevatedButtonTheme: AlphaElevatedButtonTheme.darkElevatedButtonTheme,
  );
}
