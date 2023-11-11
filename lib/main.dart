import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Future.delayed(const Duration(seconds: 3));
  FlutterNativeSplash.remove();

  runApp(
    GetMaterialApp(
      title: "My movies",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
