import '../../global_export.dart';

class A12ThemeData{
  const A12ThemeData._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: A12Strings.IBM_PLEX_SANS,
    brightness: Brightness.light,
    scaffoldBackgroundColor: A12Colors.hexFBFBFB,
    textTheme: A12TextTheme.lightTextTheme,
    inputDecorationTheme: A12InputDecorationTheme.lightInputDecorationTheme,
    appBarTheme: A12AppBarTheme.lightAppBarTheme,
    elevatedButtonTheme: A12ElevatedButtonTheme.lightElevatedButtonTheme
  );


  //Implement dark Theme here
}
