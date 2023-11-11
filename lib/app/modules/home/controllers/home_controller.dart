import 'package:get/get.dart';
import 'package:prueba_mas_nick/app/data/providers/auth_provider.dart';
import 'package:prueba_mas_nick/app/routes/app_pages.dart';

class HomeController extends GetxController {
  final authProvider = AuthProvider();

  cerrarSesion() async {
    final salir = await authProvider.signOutWithGoogle();
    if (salir == true) Get.offNamed(Routes.LOGIN);
  }
}
