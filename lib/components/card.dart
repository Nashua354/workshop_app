import 'package:flutter/material.dart';
import 'package:moviedb/components/movie_title.dart';
import 'package:moviedb/model/popular_movies.dart';
import 'package:moviedb/screens/detailspage.dart';

class CardItem extends StatelessWidget {
  final Result itemValue;
  CardItem({this.itemValue});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(itemValue: itemValue)));
        },
        child: Card(
          child: Container(
            height: 180,
            width: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  posterPath(
                    itemValue.posterPath,
                  ),
                ),
              ),
            ),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: MovieTitle(title: itemValue.title)),
          ),
        ),
      ),
    );
  }

  String posterPath(String path) {
    return 'https://image.tmdb.org/t/p/w200$path';
  }
}
