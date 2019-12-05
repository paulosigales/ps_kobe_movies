import 'package:flutter/material.dart';
import 'package:ps_kobe_movies/model/movie.dart';
import 'package:ps_kobe_movies/style.dart';

class MovieDetailInfo extends StatelessWidget {
  final Movie movie;
  MovieDetailInfo({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            movie.overview,
            style: UIFontStyle.listText,
          ),
        )
      ],
    ));
  }
}
