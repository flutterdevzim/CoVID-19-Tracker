import 'package:flutter/material.dart';

Widget sickPerson() {
  return Container(
    height: 100.0,
    width: 80.0,
    child: Stack(
      children: <Widget>[
        Container(
          height: 100.0,
          width: 80.0,
          color: Colors.transparent,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0,),
          child: Image.asset(
            'assets/images/sick_kid_2.png',
          ),
        ),
        Positioned(
          top: 0.5,
          right: 5.0,
          child: Image.asset(
            'assets/images/thermometer.png',
            height: 40.0,
            width: 15.0,
          ),
        ),
      ],
    ),
  );
}
