import 'package:covid_tracker/data-source.dart';
import 'package:covid_tracker/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryBlack,
        fontFamily: 'OpenSans'
      ),
      home: Home(),
    )
  );
}
