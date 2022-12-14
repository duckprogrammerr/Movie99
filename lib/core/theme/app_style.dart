import 'package:flutter/material.dart';
import 'package:movie99/core/constants/app_constants.dart';

class AppStyle {
  // colors
  static const Color primaryColor = Color(0xffFFAF36);
  static const Color redColor = Color(0xffE84545);
  static const Color backgroundColor = Color(0xff282934);
  static const Color greyColor = Color(0xffD4D4D4);

  // text styles
  static const TextStyle headerStyle = TextStyle(
    fontSize: 27,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle titleStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
  );
  static const TextStyle smallBodyStyle = TextStyle(
    fontSize: 16,
    color: greyColor,
  );
  // dark theme
  static ThemeData darkTheme() => ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder()
          },
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConstants.radius)),
            backgroundColor: primaryColor,
          ),
        ),
        fontFamily: 'Nunito',
        brightness: Brightness.dark,
      );
}
