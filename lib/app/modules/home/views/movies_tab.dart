import 'package:carousel_slider/carousel_slider.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:prueba_mas_nick/app/data/models/movies_popular_model.dart';
import 'package:prueba_mas_nick/app/data/models/movies_trending_model.dart';
import 'package:prueba_mas_nick/app/routes/app_pages.dart';

class MoviesTab extends StatelessWidget {
  final List<MoviesTrendingModel> listTrending;
  final List<MoviesPopularModel> listPupulars;

  const MoviesTab(
      {Key? key, required this.listTrending, required this.listPupulars})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            CarouselSlider(
              options: CarouselOptions(height: 400.0),
              items: listTrending.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Color((math.Random().nextDouble() * 0xFFFFFF)
                                    .toInt())
                                .withOpacity(1.0)),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'titulo: ${i.movie?.title.toString()}',
                              ),
                              Text(
                                'titulo: ${i.watchers.toString()}',
                              ),
                            ],
                          ),
                        ));
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listPupulars.length,
                  itemBuilder: (context, index) {
                    MoviesPopularModel i = listPupulars[index];
      
                    return InkWell(
                      onTap: () {
                        Get.toNamed(Routes.CONTENT_DETAIL, arguments: i);
                      },
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              color: Color((math.Random().nextDouble() * 0xFFFFFF)
                                      .toInt())
                                  .withOpacity(1.0)),
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'titulo: ${i.title}',
                                ),
                                Text(
                                  'titulo: ${i.year}',
                                ),
                              ],
                            ),
                          )),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
