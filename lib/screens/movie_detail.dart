import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ps_kobe_movies/model/movie.dart';
import 'package:ps_kobe_movies/service/movie_api.dart';
import 'package:ps_kobe_movies/style.dart';
import 'package:ps_kobe_movies/widgets/movie_detail_cast.dart';
import 'package:ps_kobe_movies/widgets/movie_detail_info.dart';
import 'package:ps_kobe_movies/widgets/movie_detail_videos.dart';
import 'package:ps_kobe_movies/widgets/movie_image.dart';
import 'package:jiffy/jiffy.dart';
import 'package:ps_kobe_movies/data/genres.dart';

class MovieDetailArguments {
  final Movie movie;
  MovieDetailArguments({this.movie});
}

class MovieDetail extends StatefulWidget {
  final Movie movie;
  MovieDetail({@required this.movie});

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  Movie _movie;
  int tabNumber = 1;
  List<dynamic> genreIds;

  ScrollController _scrollController = new ScrollController();

  void getData() async {
    var data = await MovieAPI().getDetails(id: _movie.id);

    if (data == null) {
      return;
    }

    var movie = Movie.fromJson(data);
    _movie.videoList = movie.videoList;
    _movie.castList = movie.castList;
  }

  @override
  void initState() {
    _movie = widget.movie;
    genreIds = _movie.genreIds;

    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: UIColors.purpleDark,
        child: Stack(
          children: <Widget>[
            Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: MovieBackgroundImage(path: _movie.backdropPath),
            ),
            SafeArea(
              top: false,
              child: SingleChildScrollView(
                controller: _scrollController,
                padding: EdgeInsets.fromLTRB(0, 220, 0, 0),
                child: getContent(),
              ),
            ),
            Positioned(
              left: 10,
              top: 50,
              width: 50,
              child: RaisedButton(
                elevation: 10,
                color: UIColors.purpleDark,
                padding: EdgeInsets.zero,
                child: Icon(
                  Icons.arrow_back_ios,
                  color: UIColors.purpleLight,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
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
                  '${_movie.title}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: UIFontStyle.listTitle,
                  textWidthBasis: TextWidthBasis.longestLine,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: UIColors.purpleLight), color: UIColors.purpleDark),
            height: (MediaQuery.of(context).size.width / 6) * 4,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                MoviePosterImage(path: _movie.posterPath, height: (MediaQuery.of(context).size.width / 6) * 4),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.end,
                          runAlignment: WrapAlignment.start,
                          spacing: 5,
                          runSpacing: 5,
                          children: getGenres(),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.star,
                                  color: UIColors.purpleLight,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '${_movie.voteAverage > 0.0 ? _movie.voteAverage : ' - '}',
                                  style: UIFontStyle.listText,
                                ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.calendar_today,
                                  color: UIColors.purpleLight,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '${_movie.releaseDate != '' ? Jiffy(_movie.releaseDate).yMMMd : ' - '}',
                                  style: UIFontStyle.listText,
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              color: UIColors.purpleLight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  tabButton(page: 1, text: 'overview'),
                  tabButton(page: 2, text: 'trailer'),
                  tabButton(page: 3, text: 'cast')
                ],
              )),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: UIColors.purpleLight),
              color: UIColors.purpleDark,
            ),
            child: getTabWidget(),
          ),
        ],
      ),
    );
  }

  Widget tabButton({int page, String text}) {
    var buttonColor = page == tabNumber ? UIColors.purpleDark : UIColors.purpleLight;
    var textColor = page == tabNumber ? UIColors.purpleLight : UIColors.purpleDark;

    return Expanded(
      child: RawMaterialButton(
        padding: EdgeInsets.zero,
        elevation: 0,
        fillColor: buttonColor,
        child: Text(
          '$text',
          style: UIFontStyle.detailTabText.copyWith(color: textColor),
        ),
        onPressed: () {
          setState(() {
            tabNumber = page;
            Future.delayed(Duration(milliseconds: 400), () {
              double animationPoint = page == 3 ? 400.0 : _scrollController.position.maxScrollExtent;
              _scrollController.animateTo(
                animationPoint,
                duration: new Duration(milliseconds: 200),
                curve: Curves.easeOut,
              );
            });
          });
        },
      ),
    );
  }

  Widget getTabWidget() {
    switch (tabNumber) {
      case 1:
        return MovieDetailInfo(movie: _movie);
      case 2:
        return MovieDetailVideos(movie: _movie);
      case 3:
        return MovieDetailCast(movie: _movie);
      default:
        return MovieDetailInfo(movie: _movie);
    }
  }

  List<Widget> getGenres() {
    List<Widget> genres = List<Widget>();

    for (int genre in genreIds) {
      if (Genres.list[genre] == null) {
        continue;
      }

      var genreContainer = Container(
        child: new Text(
          Genres.list[genre],
          style: UIFontStyle.listText,
        ),
        decoration: new BoxDecoration(
            border: Border.all(color: UIColors.purpleLight),
            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
            color: UIColors.purpleDark),
        padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
      );

      genres.add(genreContainer);
    }

    return genres;
  }
}
