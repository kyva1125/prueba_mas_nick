import 'package:get/get.dart';

import '../controllers/content_detail_controller.dart';

class ContentDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContentDetailController>(
      () => ContentDetailController(),
    );
  }
}
