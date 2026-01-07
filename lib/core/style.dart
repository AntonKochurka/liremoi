import 'package:flutter/material.dart';

class AppColors {
  static const Color lightPrimary = Color(0xFFF5F5F5);
  static const Color lightSecondary = Color(0xFF333333);
  static const Color lightAccent = Color(0xFF4A6572);
  static const Color lightHighlight = Color(0xFFF9AA33);

  static const Color darkPrimary = Color(0xFF121212);
  static const Color darkSecondary = Color(0xFFE0E0E0);
  static const Color darkAccent = Color(0xFF90A4AE);
  static const Color darkHighlight = Color(0xFFFFB74D);

  static const Color divider = Color(0x1F000000);
  static const Color shadow = Color(0x1A000000);

  static Color lightCaptionColor = Color.alphaBlend(
    const Color.fromRGBO(74, 101, 114, 0.7),
    Colors.white,
  );

  static Color darkCaptionColor = Color.alphaBlend(
    const Color.fromRGBO(144, 164, 174, 0.7),
    Colors.black,
  );
}

class AppTypography {
  static const String fontFamily = 'IBMPlexSans';
  static const String fontFamilySerif = 'Literata';

  static const double fontSizeXS = 12.0;
  static const double fontSizeS = 14.0;
  static const double fontSizeM = 16.0;
  static const double fontSizeL = 18.0;
  static const double fontSizeXL = 22.0;
  static const double fontSizeXXL = 28.0;

  static TextStyle lightTitleLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeXXL,
    fontWeight: FontWeight.w300,
    color: AppColors.lightSecondary,
    letterSpacing: -0.5,
  );

  static TextStyle lightTitleMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeXL,
    fontWeight: FontWeight.w400,
    color: AppColors.lightSecondary,
  );

  static TextStyle lightBodyLarge = TextStyle(
    fontFamily: fontFamilySerif,
    fontSize: fontSizeL,
    fontWeight: FontWeight.w400,
    color: AppColors.lightSecondary,
    height: 1.6,
  );

  static TextStyle lightBodyMedium = TextStyle(
    fontFamily: fontFamilySerif,
    fontSize: fontSizeM,
    fontWeight: FontWeight.w400,
    color: AppColors.lightSecondary,
    height: 1.6,
  );

  static TextStyle lightBodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeS,
    fontWeight: FontWeight.w400,
    color: AppColors.lightAccent,
  );

  static TextStyle lightCaption = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeXS,
    fontWeight: FontWeight.w400,
    color: AppColors.lightCaptionColor,
  );

  static TextStyle darkTitleLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeXXL,
    fontWeight: FontWeight.w300,
    color: AppColors.darkSecondary,
    letterSpacing: -0.5,
  );

  static TextStyle darkTitleMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeXL,
    fontWeight: FontWeight.w400,
    color: AppColors.darkSecondary,
  );

  static TextStyle darkBodyLarge = TextStyle(
    fontFamily: fontFamilySerif,
    fontSize: fontSizeL,
    fontWeight: FontWeight.w400,
    color: AppColors.darkSecondary,
    height: 1.6,
  );

  static TextStyle darkBodyMedium = TextStyle(
    fontFamily: fontFamilySerif,
    fontSize: fontSizeM,
    fontWeight: FontWeight.w400,
    color: AppColors.darkSecondary,
    height: 1.6,
  );

  static TextStyle darkBodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeS,
    fontWeight: FontWeight.w400,
    color: AppColors.darkAccent,
  );

  static TextStyle darkCaption = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeXS,
    fontWeight: FontWeight.w400,
    color: AppColors.darkCaptionColor,
  );

  static TextStyle verseNumber = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeXS,
    fontWeight: FontWeight.w600,
    color: AppColors.lightHighlight,
  );

  static TextStyle verseNumberDark = TextStyle(
    fontFamily: fontFamily,
    fontSize: fontSizeXS,
    fontWeight: FontWeight.w600,
    color: AppColors.darkHighlight,
  );
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.lightPrimary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightPrimary,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.lightSecondary),
      titleTextStyle: AppTypography.lightTitleMedium,
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
      space: 1,
    ),
    cardTheme: CardThemeData(
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    textTheme: TextTheme(
      displayLarge: AppTypography.lightTitleLarge,
      displayMedium: AppTypography.lightTitleMedium,
      bodyLarge: AppTypography.lightBodyLarge,
      bodyMedium: AppTypography.lightBodyMedium,
      bodySmall: AppTypography.lightBodySmall,
      labelSmall: AppTypography.lightCaption,
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.lightAccent,
      secondary: AppColors.lightHighlight,
      surface: Colors.white,
      surfaceContainerLowest: AppColors.lightPrimary,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.darkPrimary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkPrimary,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.darkSecondary),
      titleTextStyle: AppTypography.darkTitleMedium,
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.divider,
      thickness: 1,
      space: 1,
    ),
    cardTheme: CardThemeData(
      elevation: 2,
      color: const Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    textTheme: TextTheme(
      displayLarge: AppTypography.darkTitleLarge,
      displayMedium: AppTypography.darkTitleMedium,
      bodyLarge: AppTypography.darkBodyLarge,
      bodyMedium: AppTypography.darkBodyMedium,
      bodySmall: AppTypography.darkBodySmall,
      labelSmall: AppTypography.darkCaption,
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColors.darkAccent,
      secondary: AppColors.darkHighlight,
      surface: const Color(0xFF1E1E1E),
      surfaceContainerLowest: AppColors.darkPrimary,
    ),
  );
}
