import 'package:fdrive/screens/nav_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';

import 'controllers/authentication_controller.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterDownloader.initialize();
  FlutterDownloader.registerCallback(TestClass.callback);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Root(),
    );
  }
}

class Root extends StatelessWidget {
  AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.user.value == null ? LoginScreen() : NavScreen();
    });
  }
}

class TestClass {
  static void callback(String id, DownloadTaskStatus status, int progress) {}
}
