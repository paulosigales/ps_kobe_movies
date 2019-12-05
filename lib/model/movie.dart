import 'genre.dart';
import 'video.dart';
import 'cast.dart';

class Movie {
  final int id;
  final String title;
  final String overview;
  final String releaseDate;
  final int runtime;
  final double voteAverage;
  final String posterPath;
  final String backdropPath;
  final List<dynamic> genreIds;
  final List<Genre> genreList;
  List<Video> videoList;
  List<Cast> castList;

  Movie({
    this.id,
    this.title, //
    this.overview, //
    this.releaseDate, //
    this.runtime, //
    this.voteAverage, //
    this.posterPath, //
    this.backdropPath, //
    this.genreIds,
    this.genreList,
    this.videoList,
    this.castList,
  });

  Movie.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        overview = json['overview'],
        releaseDate = json['release_date'],
        runtime = json['runtime'],
        voteAverage = json['vote_average'].toDouble(),
        posterPath = json['poster_path'],
        backdropPath = json['backdrop_path'],
        genreIds = json['genre_ids'] == null ? List<dynamic>() : json["genre_ids"].toList(),
        genreList = json['genres'] == null ? List<Genre>() : Genre.parseList(json['genres']),
        videoList = json['videos'] == null ? List<Video>() : Video.parseList(json['videos']),
        castList = json['credits'] == null ? List<Cast>() : Cast.parseList(json['credits']);

  static List<Movie> parseList(Map<String, dynamic> json) {
    List<Movie> movieList = new List<Movie>();

    if (json['results'] == null) {
      return movieList;
    }

    var results = json['results'] as List;

    results.forEach((movieJson) {
      Movie movie = Movie.fromJson(movieJson);
      movieList.add(movie);
    });

    return movieList;
  }
}
