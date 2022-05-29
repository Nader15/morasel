import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/binding/login.dart';
import 'app/lang/translation.dart';
import 'app/services/cashs/theme_mode.dart';
import 'app/utilities/themes/theme.dart';
import 'app/views/pages/box.dart';
import 'app/views/pages/detail.dart';
import 'app/views/pages/login.dart';
import 'app/views/pages/pdf.dart';

//import 'package:morasel/app/views/pages/detail.dart';
//import 'app/views/pages/box.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        darkTheme: Themes.dark,
        themeMode: ThemeModeApp().theme,
        title: 'Morasel',
        getPages: [
          LoginPage(),
          BoxPage(),
          DetailPage(),
          PdfPage(),
        ],
        initialRoute: '/login',
        initialBinding: LoginBindings(),
        translations: Translation(),
        locale: const Locale('ar'),
        fallbackLocale: const Locale('en'),
      ),
    );
  }
}
