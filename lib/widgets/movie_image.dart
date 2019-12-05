import 'package:flutter/material.dart';
import 'package:ps_kobe_movies/style.dart';
import 'package:ps_kobe_movies/service/movie_api.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieImagePlaceholder extends StatelessWidget {
  final double height;
  MovieImagePlaceholder({this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height * 0.67,
      child: Icon(
        Icons.local_movies,
        color: UIColors.purpleLight,
        size: 50,
      ),
    );
  }
}

class CreditImagePlaceholder extends StatelessWidget {
  final double height;
  CreditImagePlaceholder({@required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height * 0.67,
      child: Icon(
        Icons.person,
        color: UIColors.purpleLight,
        size: 50,
      ),
    );
  }
}

class MovieBackgroundImage extends StatelessWidget {
  final String path;

  MovieBackgroundImage({@required this.path});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: '${MovieAPI.backgroundUrl}/$path',
      placeholder: (context, url) => MovieImagePlaceholder(height: 200),
      errorWidget: (context, url, error) => MovieImagePlaceholder(height: 200),
    );
  }
}

class MoviePosterImage extends StatelessWidget {
  final String path;
  final double height;

  MoviePosterImage({@required this.path, this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: height * 0.67,
      fit: BoxFit.fill,
      imageUrl: '${MovieAPI.backgroundUrl}/$path',
      placeholder: (context, url) => MovieImagePlaceholder(height: height),
      errorWidget: (context, url, error) => MovieImagePlaceholder(height: height),
    );
  }
}

class CreditsImage extends StatelessWidget {
  final String path;
  final double height;

  CreditsImage({@required this.path, @required this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      width: height * 0.67,
      fit: BoxFit.cover,
      imageUrl: '${MovieAPI.creditUrl}/$path',
      placeholder: (context, url) => CreditImagePlaceholder(
        height: height,
      ),
      errorWidget: (context, url, error) => CreditImagePlaceholder(
        height: height,
      ),
    );
  }
}
