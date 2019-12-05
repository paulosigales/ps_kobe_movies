import 'package:flutter/material.dart';
import 'package:ps_kobe_movies/style.dart';

class TitleBar extends StatelessWidget {
  final Function onPressCallback;

  TitleBar({@required this.onPressCallback});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Text(
              'Upcoming Movies',
              style: UIFontStyle.appbarTitle,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
            icon: Icon(
              Icons.search,
              color: UIColors.purpleLight,
            ),
            onPressed: onPressCallback)
      ],
    );
  }
}
