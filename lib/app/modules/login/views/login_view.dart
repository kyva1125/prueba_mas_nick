import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("MY MOVIES - NICK LEDESMA"),
                  const SizedBox(height: 200,),
                  SocialLoginButton(
                    buttonType: SocialLoginButtonType.google,
                    onPressed: () {
                      controller.goToHomePage(LoginType.Google);
                    },
                  ),
                  SocialLoginButton(
                    buttonType: SocialLoginButtonType.facebook,
                    onPressed: () {
                      controller.goToHomePage(LoginType.Facebook);
                    },
                  ),
                  // Verifica si se esta corriendo en un IOS
                  if (Platform.isIOS)
                    SocialLoginButton(
                      buttonType: SocialLoginButtonType.apple,
                      onPressed: () {},
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
