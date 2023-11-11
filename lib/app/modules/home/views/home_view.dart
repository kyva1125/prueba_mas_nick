import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('HomeView'),
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    controller.cerrarSesion();
                  },
                  icon: const Icon(Icons.exit_to_app))
            ],
          ),
          body: const Center(
            child: Text(
              'HomeView is working',
              style: TextStyle(fontSize: 20),
            ),
          ),
        );
      },
    );
  }
}
