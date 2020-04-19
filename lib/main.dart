import 'package:flutter/material.dart';
import 'package:worldtome/pages/home.dart';
import 'package:worldtome/pages/loading.dart';
import 'package:worldtome/pages/location.dart';

void main() => runApp(MaterialApp(
  initialRoute: "/",
  routes: {
    "/":(context) => Loading(),
    "/home":(context) => Home(),
    "/location":(context) => Location(),
  },
));

