import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:get/get.dart';
import 'package:prueba_mas_nick/app/data/helpers/preferences.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  final prefs = Preferences();
  await prefs.initPrefs();
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
