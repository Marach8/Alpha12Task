import '../../../global_export.dart';

class AlphaAppBarTheme{
  const AlphaAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    backgroundColor: AlphaColors.white,
    titleTextStyle: TextStyle(
      color: AlphaColors.hex1B1B1B,
      fontSize: AlphaFontSizes.size16,
      fontWeight: AlphaFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),
  );


  static AppBarTheme darkAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    backgroundColor: AlphaColors.black,
    titleTextStyle: TextStyle(
      color: AlphaColors.white,
      fontSize: AlphaFontSizes.size16,
      fontWeight: AlphaFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),
  );
}
