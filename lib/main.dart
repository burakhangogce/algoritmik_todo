import 'package:algoritmik_todo/db/db_helper.dart';
import 'package:algoritmik_todo/services/theme_services.dart';
import 'package:algoritmik_todo/ui/home_page.dart';
import 'package:algoritmik_todo/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.initDb();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Algoritmik ToDo',
      debugShowCheckedModeBanner: false,
      theme: Get.isDarkMode ? ThemeData.dark() : ThemeData.light(),
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      home: HomePage(),
    );
  }
}
