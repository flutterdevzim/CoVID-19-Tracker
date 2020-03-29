import 'package:flutter/material.dart';

Widget symptomsColumn() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      _row('Fatigue', Colors.deepOrange),
      SizedBox(height: 15.0,),
      _row('Fever', Colors.yellow[600]),
      SizedBox(height: 15.0,),
      _row('Dry Cough', Colors.blueGrey),
      SizedBox(height: 15.0,),
      _row('Shortness of Breath', Colors.blueAccent),
    ],
  );
}

Widget _row(String symptom, Color color) {
  return Row(
    children: <Widget>[
      CircleAvatar(
        backgroundColor: color,
        radius: 3.0,
      ),
      SizedBox(
        width: 5.0,
      ),
      Text(
        symptom,
        style: TextStyle(
          fontSize: 8.0,
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}
