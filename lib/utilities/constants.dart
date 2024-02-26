import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);
var Ktextfieldstyle = InputDecoration(
  floatingLabelBehavior: FloatingLabelBehavior.auto,
  labelStyle: TextStyle(color: Colors.black87),
  prefixIcon: Icon(
    Icons.location_city,
    color: Colors.black87,
  ),
  hintText: 'City name',
  hintStyle: TextStyle(color: Colors.black54),
  filled: true,
  fillColor: Color.fromARGB(181, 255, 255, 255),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(50), borderSide: BorderSide.none),
);
