import 'package:flutter/material.dart';

// TODO Start | Welcome screen
class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Center(
          child: Text(
            'start | welcome screen',
          ),
        ),
      ),
    );
  }
}
