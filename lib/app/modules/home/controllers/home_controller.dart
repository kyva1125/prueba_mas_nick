import 'package:get/get.dart';
import 'package:prueba_mas_nick/app/data/models/movies_popular_model.dart';
import 'package:prueba_mas_nick/app/data/models/movies_trending_model.dart';
import 'package:prueba_mas_nick/app/data/providers/auth_provider.dart';
import 'package:prueba_mas_nick/app/data/providers/movies_provider.dart';
import 'package:prueba_mas_nick/app/routes/app_pages.dart';

class HomeController extends GetxController {
  // Llamada a los providers
  final authProvider = AuthProvider();
  final moviesProvier = MoviesProvider();

  List<MoviesTrendingModel>? moviesTrending;
  List<MoviesPopularModel>? moviesPopulars;

  @override
  void onInit() {
    getAllTrending();
    getAllPopulars();
    super.onInit();
  }
  // Implementacion para cerrar sesion
  cerrarSesion() async {
    final salir = await authProvider.signOutWithGoogle();
    if (salir == true) Get.offNamed(Routes.LOGIN);
  }
  // Obtener trending
  getAllTrending() async {
    moviesTrending = await moviesProvier.getAllTrending();
    update();
  }
  // Obtener populares
  getAllPopulars() async {
    moviesPopulars = await moviesProvier.getAllPopulars();
    update();
  }
}
