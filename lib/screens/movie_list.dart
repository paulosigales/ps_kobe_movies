import 'package:flutter/material.dart';
import 'package:ps_kobe_movies/model/movie.dart';
import 'package:ps_kobe_movies/style.dart';
import 'package:ps_kobe_movies/service/movie_api.dart';
import 'package:ps_kobe_movies/widgets/movie_tile.dart';
import 'package:ps_kobe_movies/widgets/search_bar.dart';
import 'package:ps_kobe_movies/widgets/title_bar.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  List<Movie> movieList = [];
  int page = 1;
  bool isLoading = false;
  bool isBarSearch = false;
  String query = '';

  ScrollController scrollController = new ScrollController();

  void getData() async {
    isLoading = true;
    var data;

    if (query != '') {
      data = await MovieAPI().getSearch(query: query, page: page);
    } else {
      data = await MovieAPI().getUpcoming(page: page);
    }

    if (data == null) {
      return;
    }

    var movies = Movie.parseList(data);

    setState(() {
      movieList += movies;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 700) > scrollController.position.maxScrollExtent) {
        if (!isLoading) {
          page += 1;
          getData();
        }
      }
    });

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: UIColors.purpleDark,
              titleSpacing: 10.0,
              title: getAppBar(),
              floating: true,
              expandedHeight: 60,
              elevation: 5,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => MovieTile(movie: movieList[index]),
                childCount: movieList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getAppBar() {
    if (isBarSearch) {
      return SearchBar(onSubmittedCallback: (value) {
        setState(() {
          query = value;
          page = 1;
          movieList = [];
          getData();
        });
      }, onCancelCallback: () {
        setState(() {
          isBarSearch = false;
          if (query != '') {
            query = '';
            page = 1;
            movieList = [];
            getData();
          }
        });
      });
    } else {
      return TitleBar(onPressCallback: () {
        setState(() {
          isBarSearch = true;
        });
      });
    }
  }
}
