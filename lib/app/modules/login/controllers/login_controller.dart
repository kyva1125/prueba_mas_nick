import 'package:get/get.dart';
import 'package:prueba_mas_nick/app/data/providers/auth_provider.dart';
import 'package:prueba_mas_nick/app/routes/app_pages.dart';

enum LoginType { Google, Facebook }

class LoginController extends GetxController {
  final authProvider = AuthProvider();

  goToHomePage(LoginType loginType) async {
    switch (loginType) {
      case LoginType.Google:
        {
          final user = await authProvider.signInWithGoogle();
          if (user != null) Get.offNamed(Routes.HOME);
        }
      case LoginType.Facebook:
        {
          final user = await authProvider.signInWithFacebook();
          if (user != null) Get.offNamed(Routes.HOME);
        }
    }
  }
}
