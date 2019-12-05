import 'package:flutter/material.dart';
import 'package:ps_kobe_movies/model/cast.dart';
import 'package:ps_kobe_movies/model/movie.dart';
import 'package:ps_kobe_movies/style.dart';
import 'package:ps_kobe_movies/widgets/movie_image.dart';

class MovieDetailCast extends StatelessWidget {
  final Movie movie;

  MovieDetailCast({@required this.movie});

  @override
  Widget build(BuildContext context) {
    List<Widget> cast = List<Widget>();

    var width = (MediaQuery.of(context).size.width / 8.7) * 4;

    for (Cast person in movie.castList) {
      var box = Container(
        padding: EdgeInsets.all(5),
        width: width,
        height: width * 1.5,
        child: Stack(
          alignment: Alignment(0, 1),
          children: <Widget>[
            CreditsImage(
              path: person.profilePath,
              height: width * 1.5,
            ),
            Container(
              padding: EdgeInsets.all(5),
              width: width,
              child: Text(
                '${person.name} as \n${person.character}',
                maxLines: 3,
                style: UIFontStyle.castText,
              ),
              color: UIColors.purpleLight,
            )
          ],
        ),
      );

      cast.add(box);
    }

    var wrap = Wrap(
      alignment: WrapAlignment.center,
      children: cast,
    );

    return wrap;
  }
}
