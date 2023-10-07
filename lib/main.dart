import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:todolist/core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  await initServices();
  runApp(const MyApp());
}

Future<void> initServices() async {
  Get.log('starting services ...');
  await Get.putAsync(() => DbService().init());
  Get.log('All services started...');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      getPages: AppPages.pages,
      initialRoute: AppPages.initial,
      defaultTransition: Transition.cupertino,
    );
  }
}
