import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:prueba_mas_nick/app/modules/home/views/movies_tab.dart';
import 'package:prueba_mas_nick/app/modules/home/views/profile_tab.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Pagina inicial'),
             
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Movies'),
                  Tab(text: 'Profile'),
                ],
              ),
              actions: [
                LikeButton(
                  circleColor: CircleColor(
                      start: Colors.black, end: Colors.white),
                  bubblesColor: BubblesColor(
                    dotPrimaryColor: Color(0xff33b5e5),
                    dotSecondaryColor: Color(0xff0099cc),
                  ),
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      Icons.heart_broken,
                      color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                      size: 30,
                    );
                  },
                  likeCount: 665,
                ),
                IconButton(
                    onPressed: () {
                      controller.cerrarSesion();
                    },
                    icon: const Icon(Icons.exit_to_app))
              ],
            ),
            body: TabBarView(
              children: [
                MoviesTab(
                    listTrending: controller.moviesTrending ?? [],
                    listPupulars: controller.moviesPopulars ?? []),
                ProfileTab()
              ],
            ),
          ),
        );
      },
    );
  }
}
