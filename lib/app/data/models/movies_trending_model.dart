// To parse this JSON data, do
//
//     final moviesTrendingModel = moviesTrendingModelFromJson(jsonString);

import 'dart:convert';

List<MoviesTrendingModel> moviesTrendingModelFromJson(String str) => List<MoviesTrendingModel>.from(json.decode(str).map((x) => MoviesTrendingModel.fromJson(x)));

String moviesTrendingModelToJson(List<MoviesTrendingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MoviesTrendingModel {
    final int? watchers;
    final Movie? movie;

    MoviesTrendingModel({
        this.watchers,
        this.movie,
    });

    factory MoviesTrendingModel.fromJson(Map<String, dynamic> json) => MoviesTrendingModel(
        watchers: json["watchers"],
        movie: json["movie"] == null ? null : Movie.fromJson(json["movie"]),
    );

    Map<String, dynamic> toJson() => {
        "watchers": watchers,
        "movie": movie?.toJson(),
    };
}

class Movie {
    final String? title;
    final int? year;
    final Ids? ids;

    Movie({
        this.title,
        this.year,
        this.ids,
    });

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
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
