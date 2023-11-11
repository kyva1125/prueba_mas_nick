import 'package:get/get.dart';
import 'package:prueba_mas_nick/app/data/models/movies_popular_model.dart';

class ContentDetailController extends GetxController {
  MoviesPopularModel? popularModel;

  @override
  void onInit() {
    popularModel = Get.arguments;
    super.onInit();
  }
}
