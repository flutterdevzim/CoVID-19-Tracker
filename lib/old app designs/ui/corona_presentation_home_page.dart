import 'package:covid_19_tracker/ui/corona_news_screen.dart';
import 'package:flutter/material.dart';

class CoronaPresentationHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      height: 400.0,
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              'Corona News Api',
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          CoronaNewsScreen(),
        ],
      ),
    );
  }
}
