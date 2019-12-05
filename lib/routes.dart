import 'package:flutter/material.dart';
import 'package:ps_kobe_movies/screens/movie_detail.dart';
import 'package:ps_kobe_movies/screens/movie_list.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case movieList:
        return MaterialPageRoute(builder: (context) => MovieList());
      case movieDetail:
        MovieDetailArguments args = settings.arguments;
        return SlideRoute(
          page: MovieDetail(movie: args.movie),
        );
      default:
        return MaterialPageRoute(builder: (context) => MovieList());
    }
  }

  static const String movieList = '/movieList';
  static const String movieDetail = '/movieDetail';
}

class SlideRoute extends PageRouteBuilder {
  final Widget page;
  SlideRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}
