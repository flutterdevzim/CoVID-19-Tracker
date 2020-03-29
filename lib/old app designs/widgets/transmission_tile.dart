import 'package:flutter/material.dart';

Widget transmissionTile(
    String transmissionType, String transmissionImage, Color tileColor) {
  return Column(
    children: <Widget>[
      Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          color: tileColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.transparent,
            child: Image.asset(
              transmissionImage,
              color: Colors.white,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        transmissionType,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 10.0,
        ),
      )
    ],
  );
}
