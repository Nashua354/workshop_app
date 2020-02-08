import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moviedb/config/keys.dart';
import 'package:moviedb/config/urls.dart';

class MovieServices {
  static fetchPopularMovies() async {
    String url = Urls.popularMoviesUrl;
    url = addParams(url, {"api_key": Keys.apiKey});
    final response = await http.get(url);
    return json.decode(response.body);
  }

  static fetchTopMovies() async {
    String url = Urls.topMoviesUrl;
    url = addParams(url, {"api_key": Keys.apiKey});
    final response = await http.get(url);
    return json.decode(response.body);
  }

  static fetchNowPlayingMovies() async {
    String url = Urls.nowPlayingMoviesUrl;
    url = addParams(url, {"api_key": Keys.apiKey});
    final response = await http.get(url);
    return json.decode(response.body);
  }

  static fetchUpcomingMovies() async {
    String url = Urls.upcomingMoviesUrl;
    url = addParams(url, {"api_key": Keys.apiKey});
    final response = await http.get(url);
    return json.decode(response.body);
  }

  static fetchMovieDetails(movieId) async {
    String url = Urls.movieDetailsUrl(movieId);
    url = addParams(url, {"api_key": Keys.apiKey});
    final response = await http.get(url);
    return json.decode(response.body);
  }

  static addRating(int rating, int movieId) async {
    String url = Urls.addRatingUrl(movieId);
    url = addParams(url, {"api_key": Keys.apiKey});
    final response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: json.encode({"value": rating}));
    return json.decode(response.body);
  }

  static String addParams(String url, Map params) {
    if (params.isNotEmpty) url = "$url?";
    params.forEach((key, value) {
      url = "$url$key=$value";
    });
    return url;
  }
}
