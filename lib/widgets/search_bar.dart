import 'package:flutter/material.dart';
import 'package:ps_kobe_movies/style.dart';

class SearchBar extends StatelessWidget {
  final Function onSubmittedCallback;
  final Function onCancelCallback;

  SearchBar({@required this.onSubmittedCallback, @required this.onCancelCallback});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Container(
            height: 40.0,
            child: TextField(
              keyboardType: TextInputType.text,
              autofocus: true,
              maxLines: 1,
              style: UIFontStyle.textField,
              decoration: UITextFieldStyle.getTextFieldStyle(borderColor: UIColors.purpleLight)
                  .copyWith(hintText: 'search'),
              onSubmitted: onSubmittedCallback,
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        IconButton(
            icon: Icon(
              Icons.cancel,
              color: UIColors.purpleLight,
            ),
            onPressed: onCancelCallback)
      ],
    );
  }
}
