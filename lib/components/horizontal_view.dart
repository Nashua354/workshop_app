import 'package:flutter/material.dart';
import 'package:moviedb/components/card.dart';
import 'package:moviedb/model/popular_movies.dart';

class HorizontalCards extends StatelessWidget {
  final PopularMovies popularMovies;
  HorizontalCards({this.popularMovies});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        itemCount: popularMovies.results.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CardItem(
            itemValue: popularMovies.results[index],
          );
        },
      ),
    );
  }
}
