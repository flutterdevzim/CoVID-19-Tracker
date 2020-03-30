import 'package:covid_19_tracker/pages/news.dart';
import 'package:flutter/material.dart';
import 'package:covid_19_tracker/utils/color_theme.dart';
import 'package:covid_19_tracker/ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoVID-19 App',
      debugShowCheckedModeBanner: false,
      theme: colorTheme,
      home: HomePage(),
    );
  }
}
