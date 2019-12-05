import 'package:http/http.dart' as http;
import 'dart:convert';

class MovieAPI {
  MovieAPI({this.url});

  final String url;

  static const apiKey = 'b8a13e5d8f595811408a58262e14dfde';
  static const mainUrl = 'https://api.themoviedb.org/3';
  static const upcomingUrl = '/movie/upcoming';
  static const detailUrl = '/movie';
  static const searchUrl = '/search/movie';
  static const imageUrl = "https://image.tmdb.org/t/p/w300";
  static const backgroundUrl = "https://image.tmdb.org/t/p/w500";
  static const creditUrl = "https://image.tmdb.org/t/p/w200";

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future<dynamic> getUpcoming({int page}) async {
    MovieAPI movieAPI = MovieAPI(url: '$mainUrl$upcomingUrl?page=$page&api_key=$apiKey');
    var movieData = await movieAPI.getData();
    return movieData;
  }

  Future<dynamic> getDetails({int id}) async {
    MovieAPI movieAPI = MovieAPI(url: '$mainUrl$detailUrl/$id?api_key=$apiKey&append_to_response=videos,credits');
    var movieData = await movieAPI.getData();
    return movieData;
  }

  Future<dynamic> getSearch({String query, int page}) async {
    MovieAPI movieAPI = MovieAPI(url: '$mainUrl$searchUrl?query=$query&page=$page&api_key=$apiKey');
    var movieData = await movieAPI.getData();
    return movieData;
  }
}
