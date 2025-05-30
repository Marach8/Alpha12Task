import '../../../global_export.dart';

class AlphaTextTheme{
  const AlphaTextTheme._();

  static TextTheme lightTextTheme = TextTheme( 
    headlineMedium: TextStyle(
      color: AlphaColors.hex1B1B1B,
      fontSize: AlphaFontSizes.size20,
      fontWeight: AlphaFontWeights.w700,
      overflow: TextOverflow.ellipsis,
    ),


    titleSmall: TextStyle(
      color: AlphaColors.hex1B1B1B,
      fontSize: AlphaFontSizes.size16,
      fontWeight: AlphaFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),

    
    bodySmall: TextStyle(
      color: AlphaColors.hex1B1B1B,
      fontSize: AlphaFontSizes.size14,
      fontWeight: AlphaFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),
    
    labelMedium: TextStyle(
      color: AlphaColors.hex1B1B1B,
      fontSize: AlphaFontSizes.size12,
      fontWeight: AlphaFontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),
  );



  static TextTheme darkTextTheme = TextTheme( 

    headlineMedium: TextStyle(
      color: AlphaColors.white,
      fontSize: AlphaFontSizes.size20,
      fontWeight: AlphaFontWeights.w700,
      overflow: TextOverflow.ellipsis,
    ),

    titleSmall: TextStyle(
      color: AlphaColors.white,
      fontSize: AlphaFontSizes.size16,
      fontWeight: AlphaFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),

    bodySmall: TextStyle(
      color: AlphaColors.white,
      fontSize: AlphaFontSizes.size14,
      fontWeight: AlphaFontWeights.w500,
      overflow: TextOverflow.ellipsis,
    ),

    labelMedium: TextStyle(
      color: AlphaColors.white,
      fontSize: AlphaFontSizes.size10,
      fontWeight: AlphaFontWeights.w400,
      overflow: TextOverflow.ellipsis,
    ),
  );
}