import 'package:flutter/material.dart';
import 'package:ps_kobe_movies/style.dart';
import 'package:ps_kobe_movies/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: UIColors.purpleDark),
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
