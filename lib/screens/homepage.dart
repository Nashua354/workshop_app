import 'package:flutter/material.dart';
import 'package:moviedb/components/horizontal_view.dart';
import 'package:moviedb/components/movie_list_title.dart';
import 'package:moviedb/config/colors.dart';
import 'package:moviedb/model/popular_movies.dart';
import 'package:moviedb/services/movie_services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: CommonColors.red,
        title: Text('MovieDB'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          FutureBuilder(
              future: MovieServices.fetchPopularMovies(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done)
                  return Column(
                    children: <Widget>[
                      MovieListTitle('Popular Movies'),
                      HorizontalCards(
                          popularMovies: PopularMovies.fromJson(snapshot.data)),
                    ],
                  );
                else
                  return loader();
              }),
          FutureBuilder(
              future: MovieServices.fetchTopMovies(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done)
                  return Column(
                    children: <Widget>[
                      MovieListTitle('Top Movies'),
                      HorizontalCards(
                          popularMovies: PopularMovies.fromJson(snapshot.data)),
                    ],
                  );
                else
                  return loader();
              }),
          FutureBuilder(
              future: MovieServices.fetchNowPlayingMovies(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done)
                  return Column(
                    children: <Widget>[
                      MovieListTitle('Now Playing Movies'),
                      HorizontalCards(
                          popularMovies: PopularMovies.fromJson(snapshot.data)),
                    ],
                  );
                else
                  return loader();
              }),
          FutureBuilder(
              future: MovieServices.fetchUpcomingMovies(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done)
                  return Column(
                    children: <Widget>[
                      MovieListTitle('Now Playing Movies'),
                      HorizontalCards(
                          popularMovies: PopularMovies.fromJson(snapshot.data)),
                    ],
                  );
                else
                  return loader();
              }),
        ],
      ),
    );
  }

  Widget loader() {
    return Column(
      children: <Widget>[
        Text('Popular Movies'),
        Container(
          height: 200,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                CommonColors.red,
              ),
            ),
          ),
        )
      ],
    );
  }
}
