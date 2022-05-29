import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/setting_controller.dart';

class Themes {
  final SettingController settingController = Get.put(SettingController());

  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    primaryColor: Colors.white,
    cardColor: Colors.white,
    dialogTheme: DialogTheme(
      backgroundColor: Colors.grey[100],
      elevation: 5,
    ),
    dividerColor: Colors.black,
    backgroundColor: const Color(0XFF1ba1e3),
    iconTheme: const IconThemeData(color: Colors.blue, size: 20),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0XFF1ba1e3),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Colors.white, //Color(0XFF1ba1e3),
      elevation: 3,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        // fontFamily: 'Sultan Bold',
      ),
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        color: Color.fromARGB(255, 118, 118, 118),
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xFF212121),
    brightness: Brightness.dark,
    primaryColor: Colors.white,
    cardColor: const Color(0xFF212121),
    dividerColor: Colors.white,
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(color: Colors.white, size: 20),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF212121),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xFF212121),
      elevation: 3,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(0xFF212121),
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Colors.white,
        fontSize: 10,
        fontWeight: FontWeight.w100,
      ),
      bodyMedium: TextStyle(
        color: Color.fromARGB(255, 118, 118, 118),
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  // title appBar
  TextStyle get headingStyle1 {
    return const TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: 'Sultan Bold',
    );
  }

  TextStyle get buttonReplyStyle {
    return GoogleFonts.cairo(
        textStyle: const TextStyle(
      color: Color.fromARGB(255, 255, 255, 255),
      fontSize: 12,
      fontWeight: FontWeight.w700,
    ));
  }

  TextStyle get buttonSaveStyle {
    return GoogleFonts.cairo(
        textStyle: const TextStyle(
      color: Color.fromARGB(255, 118, 14, 7),
      fontSize: 12,
      fontWeight: FontWeight.w700,
    ));
  }

  TextStyle get loginFormTitleStyle {
    return GoogleFonts.cairo(
        textStyle: const TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 12,
      fontWeight: FontWeight.w700,
    ));
  }

  TextStyle get loginFormSubStyle {
    return GoogleFonts.cairo(
        textStyle: const TextStyle(
      color: Color.fromARGB(255, 0, 0, 0),
      fontSize: 11,
      fontWeight: FontWeight.w600,
    ));
  }
}
