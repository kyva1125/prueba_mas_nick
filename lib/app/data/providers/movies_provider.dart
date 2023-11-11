import 'dart:convert';

import 'package:get/get.dart';
import 'package:prueba_mas_nick/app/data/models/movies_popular_model.dart';
import 'package:prueba_mas_nick/app/data/models/movies_trending_model.dart';

class MoviesProvider extends GetConnect {
  final url = "https://api.trakt.tv/movies";
  final key =
      "9074b148ecb487668109a0483fbb14d26f3a4b1e32a8b143b73af19147f8d51f";

  getAllTrending() async {
    try {
      final response =
          await get("$url/trending", headers: {"trakt-api-key": key});

      if (response.isOk) {
        return moviesTrendingModelFromJson(jsonEncode(response.body));
      }
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  getAllPopulars() async {
    try {
      final response =
          await get("$url/popular", headers: {"trakt-api-key": key});

      if (response.isOk) {
        return moviesPopularModelFromJson(jsonEncode(response.body));
      }
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
