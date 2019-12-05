import 'package:flutter/material.dart';
import 'package:ps_kobe_movies/model/movie.dart';
import 'package:ps_kobe_movies/routes.dart';
import 'package:ps_kobe_movies/style.dart';
import 'package:jiffy/jiffy.dart';
import 'package:ps_kobe_movies/screens/movie_detail.dart';
import 'package:ps_kobe_movies/widgets/movie_image.dart';

class MovieTile extends StatelessWidget {
  final Movie movie;

  MovieTile({@required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.zero,
            color: UIColors.purpleLight,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  '${movie.title}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: UIFontStyle.listTitle,
                  textWidthBasis: TextWidthBasis.longestLine,
                ),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              var args = MovieDetailArguments(movie: movie);
              Navigator.pushNamed(context, Routes.movieDetail, arguments: args);
            },
            color: UIColors.purpleDark,
            padding: EdgeInsets.zero,
            colorBrightness: Brightness.light,
            child: Container(
              decoration: BoxDecoration(border: Border.all(width: 1, color: UIColors.purpleLight)),
              height: (MediaQuery.of(context).size.width / 5) * 3,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MoviePosterImage(
                    path: movie.posterPath,
                    height: (MediaQuery.of(context).size.width / 5) * 3,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '${movie.overview}',
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                            style: UIFontStyle.listText,
                          ),
                          Wrap(
                            runSpacing: 5,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.star,
                                    color: UIColors.purpleLight,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '${movie.voteAverage > 0.0 ? movie.voteAverage : ' - '}',
                                    style: UIFontStyle.listText,
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.calendar_today,
                                    color: UIColors.purpleLight,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '${movie.releaseDate != '' ? Jiffy(movie.releaseDate).yMMMd : ' - '}',
                                    style: UIFontStyle.listText,
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
