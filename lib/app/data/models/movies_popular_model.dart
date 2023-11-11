// To parse this JSON data, do
//
//     final moviesPopularModel = moviesPopularModelFromJson(jsonString);

import 'dart:convert';

List<MoviesPopularModel> moviesPopularModelFromJson(String str) => List<MoviesPopularModel>.from(json.decode(str).map((x) => MoviesPopularModel.fromJson(x)));

String moviesPopularModelToJson(List<MoviesPopularModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MoviesPopularModel {
    final String? title;
    final int? year;
    final Ids? ids;

    MoviesPopularModel({
        this.title,
        this.year,
        this.ids,
    });

    factory MoviesPopularModel.fromJson(Map<String, dynamic> json) => MoviesPopularModel(
        title: json["title"],
        year: json["year"],
        ids: json["ids"] == null ? null : Ids.fromJson(json["ids"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "year": year,
        "ids": ids?.toJson(),
    };
}

class Ids {
    final int? trakt;
    final String? slug;
    final String? imdb;
    final int? tmdb;

    Ids({
        this.trakt,
        this.slug,
        this.imdb,
        this.tmdb,
    });

    factory Ids.fromJson(Map<String, dynamic> json) => Ids(
        trakt: json["trakt"],
        slug: json["slug"],
        imdb: json["imdb"],
        tmdb: json["tmdb"],
    );

    Map<String, dynamic> toJson() => {
        "trakt": trakt,
        "slug": slug,
        "imdb": imdb,
        "tmdb": tmdb,
    };
}
