import 'dart:async';
import 'package:flutter/material.dart';
import "package:worldtome/Services/servicess.dart";
import "package:flutter/src/widgets/framework.dart";
import "package:flutter_spinkit/flutter_spinkit.dart";

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTIme() async{
    WorldTime instance = WorldTime(location: "India",flag: "germany.png",url: "Asia/Kolkata");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": instance.location,
      "flag":instance.flag,
      "time":instance.time,
      "Daytime":instance.Daytime,
      "status": instance.statu,
    });

  }
  @override
  void initState() {
    super.initState();
    setupWorldTIme();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}



