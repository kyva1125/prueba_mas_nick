import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/content_detail_controller.dart';

class ContentDetailView extends GetView<ContentDetailController> {
  const ContentDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.popularModel!.title.toString()),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("${controller.popularModel?.ids?.imdb.toString()}"),
              Text("${controller.popularModel?.ids?.slug.toString()}"),
              Text("${controller.popularModel?.ids?.imdb.toString()}"),
              Text("${controller.popularModel?.ids?.tmdb.toString()}"),
            ],
          ),
        ));
  }
}
