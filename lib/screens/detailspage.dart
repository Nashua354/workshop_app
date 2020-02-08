import 'package:flutter/material.dart';
import 'package:moviedb/config/colors.dart';
import 'package:moviedb/model/movie_detail.dart';
import 'package:moviedb/model/popular_movies.dart';
import 'package:moviedb/services/movie_services.dart';

class DetailsPage extends StatelessWidget {
  final Result itemValue;
  DetailsPage({this.itemValue});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: CommonColors.red,
        title: Text(itemValue.title),
      ),
      body: FutureBuilder(
        future: MovieServices.fetchMovieDetails(itemValue.id),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            MovieDetail data = MovieDetail.fromJson(snapshot.data);
            return ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image:
                                NetworkImage(posterPath(data.backdropPath)))),
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.transparent, Colors.black])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            '${data.title}  ${data.voteAverage}',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '${data.releaseDate.year}',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )),
                customText(width, data.tagline),
                Row(
                  children: <Widget>[
                    customText(width / 3, 'Status :'),
                    customText(width / 2, data.status),
                  ],
                ),
                Column(
                  children: <Widget>[
                    customText(width, 'OverView :'),
                    customText(width, data.overview),
                  ],
                ),
                Row(
                  children: <Widget>[
                    customText(width / 3, 'Budget :'),
                    customText(width / 2, data.budget),
                  ],
                ),
                Row(
                  children: <Widget>[
                    customText(width / 3, 'Revenue :'),
                    customText(width / 2, data.revenue),
                  ],
                ),
                Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Rating',
                        labelStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Color(0xff111111),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: CommonColors.red),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: CommonColors.red),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: RaisedButton(
                        color: CommonColors.red,
                        child: Text(
                          'Submit Rating',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          MovieServices.addRating(8, itemValue.id);
                        },
                      ),
                    )
                  ],
                )
              ],
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(CommonColors.red),
            ));
          }
        },
      ),
    );
  }

  Widget customText(width, text) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(10.0),
      child: Text(
        text.toString(),
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.w100,
        ),
      ),
    );
  }

  String posterPath(String path) {
    return 'https://image.tmdb.org/t/p/original$path';
  }
}
