import 'package:flutter/material.dart';

const kBackgroundDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [Colors.black, Colors.blue],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);

const kTopTitle = TextStyle(
  color: Colors.white,
  fontSize: 24,
  fontWeight: FontWeight.bold,
  fontFamily: 'Spartan MB', 
);

const kAZTitle = TextStyle(
  color: Colors.white,
  fontSize: 12,
  fontWeight: FontWeight.bold,
  fontFamily: 'Spartan MB', 
);

const kDaily = TextStyle(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.bold,
  fontFamily: 'Spartan MB', 
);

const kTempTextStyle =
    TextStyle(fontFamily: 'Spartan MB', fontSize: 100.0, color: Colors.white);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 30.0,
  color: Colors.white,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter city name.',
  hintStyle: TextStyle(color: Colors.grey),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);
