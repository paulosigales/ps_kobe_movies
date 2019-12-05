import 'package:flutter/material.dart';
import 'package:ps_kobe_movies/model/movie.dart';
import 'package:ps_kobe_movies/model/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailVideos extends StatelessWidget {
  final Movie movie;
  MovieDetailVideos({@required this.movie});

  @override
  Widget build(BuildContext context) {
    List<Widget> videos = List<Widget>();

    for (Video video in movie.videoList) {
      if (video.site == 'YouTube' && video.type == 'Trailer') {
        var _controller = YoutubePlayerController(
          initialVideoId: video.key,
          flags: YoutubePlayerFlags(
            mute: false,
            autoPlay: false,
            forceHideAnnotation: true,
          ),
        );

        var player = YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          actionsPadding: EdgeInsets.only(left: 16.0),
          bottomActions: [
            CurrentPosition(),
            SizedBox(width: 10.0),
            ProgressBar(isExpanded: true),
            SizedBox(width: 10.0),
            RemainingDuration(),
            FullScreenButton(),
          ],
          onReady: () {
            print('Player is ready.');
          },
        );

        var container = Container(
          width: MediaQuery.of(context).size.width,
          child: player,
        );

        videos.add(container);
        break;
      }
    }

    return Column(children: videos);
  }
}
