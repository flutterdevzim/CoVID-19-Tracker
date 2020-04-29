import 'package:covid_19_tracker/utils/color_theme.dart';
import 'package:flutter/material.dart';

// TODO Start | Welcome screen
class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        color: darkColor,
        child: Center(
          child: Image.asset(
            'assets/images/corona1.png',
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
