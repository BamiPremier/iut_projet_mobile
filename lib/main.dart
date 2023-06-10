import 'package:Fahkap/styles/colorApp.dart'; 
import 'package:Fahkap/utils/Services/core.dart'; 
import 'package:Fahkap/utils/Services/routing.dart';
import 'package:Fahkap/utils/Services/storageService2.dart';
import 'package:Fahkap/utils/Services/translations.dart';
import 'package:flutter/material.dart'; 
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:permission_handler/permission_handler.dart';

 
Future<void> main() async {
   
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init(); 
  await initServices();
  await initApp();

// await MyBinding().onInit();

// await init();
  runApp(MyApp());
}

final _darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);

final _lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);
final light = ThemeData(
    fontFamily: 'OpenSan',
    textTheme: const TextTheme(
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black)),
    backgroundColor: ColorsApp.bg,
    appBarTheme: const AppBarTheme(foregroundColor: Colors.black87));
final dark = ThemeData.dark().copyWith(
  backgroundColor: Colors.black,
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: Transalations(),

      debugShowCheckedModeBanner: false,
      // initialBinding: MyBinding(),
      initialRoute: AppLinks.SPLASHSCREEN,
      getPages: AppRoutes.pages,
    );
  }
}
