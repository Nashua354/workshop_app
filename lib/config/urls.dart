class Urls {
  static String baseUrl = 'https://api.themoviedb.org/3';
  static String popularMoviesUrl = '$baseUrl/movie/popular';
  static String topMoviesUrl = '$baseUrl/movie/top_rated';
  static String nowPlayingMoviesUrl = '$baseUrl/movie/now_playing';
  static String upcomingMoviesUrl = '$baseUrl/movie/upcoming';
  static String movieDetailsUrl(movieId) => '$baseUrl/movie/$movieId';
  static String addRatingUrl(movieId) => '$baseUrl/movie/$movieId/rating';
}
