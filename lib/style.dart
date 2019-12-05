import 'package:flutter/material.dart';

class UIColors {
  static const Color purpleLight = Color(0xFFA048FF);
  static const Color purpleDark = Color(0xFF29253A);
}

class UIFontStyle {
  static const appbarTitle = TextStyle(
    fontFamily: 'OpenSans',
    color: UIColors.purpleLight,
    fontSize: 26.0,
  );

  static const listTitle = TextStyle(
    fontFamily: 'OpenSans',
    color: UIColors.purpleDark,
    fontSize: 22,
  );

  static const listText = TextStyle(
    fontFamily: 'OpenSans',
    color: UIColors.purpleLight,
    fontSize: 14.0,
  );

  static const detailTabText = TextStyle(
    fontFamily: 'OpenSans',
    color: UIColors.purpleDark,
    fontSize: 16,
  );

  static const castText = TextStyle(
    fontFamily: 'OpenSans',
    color: UIColors.purpleDark,
    fontSize: 14,
  );

  static const textField = TextStyle(
    fontFamily: 'OpenSans',
    color: UIColors.purpleLight,
    fontSize: 22.0,
  );
}

class UITextFieldStyle {
  static InputDecoration getTextFieldStyle({Color borderColor = UIColors.purpleLight}) {
    return InputDecoration(
      hintText: '',
      contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      hintStyle: TextStyle(color: UIColors.purpleLight),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: 1.0),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
    );
  }
}
