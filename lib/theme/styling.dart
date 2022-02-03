import 'package:flutter/material.dart';

const bubbleDiameter = 250;

const bubbleBoxDecoration = BoxDecoration(
  color: Colors.blueAccent,
  shape: BoxShape.circle,
  boxShadow: [
    BoxShadow(
      offset: Offset(0, 27),
      blurRadius: 30,
      color: Colors.lightBlueAccent,
    )
  ],
);

const labelTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20,
  color: Colors.white,
);

const weightTextStyle = TextStyle(
  fontSize: 120,
  color: Colors.white,
);

const unitTextStyle = TextStyle(
  fontSize: 40,
  color: Color(0x80ffffff),
);

const focusedBorderStyle = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
);

const enableBorderStyle = OutlineInputBorder(
  borderSide: BorderSide(color: Colors.black, width: 1.0),
);
