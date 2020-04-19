import 'dart:math';

import "package:flutter/material.dart";

class Loader extends StatefulWidget {
  @override
  _LoaderState createState() => _LoaderState();
}

class _LoaderState extends State<Loader> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation<double> animation_rotation;
  Animation<double> animation_radius_in;
  Animation<double> animation_radius_out;
  final double initialred = 30;
  double red = 0;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(vsync: this,duration: Duration(seconds: 3));
    animation_rotation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller,
        curve: Interval(0.0,1.0,curve: Curves.linear)) );

    animation_radius_in = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: controller,curve: Interval(
      0.75,1.0, curve: Curves.elasticIn
    )));
    animation_radius_out = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller,curve: Interval(
        0.0,0.25, curve: Curves.elasticOut
    )));
    controller.addListener(() {
      setState(() {
        if(controller.value>=0.75 && controller.value<=1.0){
          red = animation_radius_in.value*initialred;
        }else if(controller.value>=0.0 && controller.value<=0.25){
          red = animation_radius_out.value*initialred;
        }
      });
    });
    controller.repeat();
  }


  @override
  Widget build(BuildContext context) {
    return Container(

      child: Center(
        child: RotationTransition(
          turns: animation_rotation,
          child: Stack(
            children: <Widget>[
              Dot(
                radius: 30,
                color: Colors.grey[500],
              ),
              Transform.translate(
                offset: Offset(red*cos(pi/4),red*sin(pi/4)),
                child: Dot(
                  radius: 5,
                  color: Colors.redAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(red*cos(pi/2),red*sin(pi/2)),
                child: Dot(
                  radius: 5,
                  color: Colors.pink,
                ),
              ),
              Transform.translate(
                offset: Offset(red*cos(3*pi/4),red*sin(3*pi/4)),
                child: Dot(
                  radius: 5,
                  color: Colors.amberAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(red*cos(3*pi/4),red*sin(3*pi/4)),
                child: Dot(
                  radius: 5,
                  color: Colors.lightGreenAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(red*cos(4*pi/4),red*sin(4*pi/4)),
                child: Dot(
                  radius: 5,
                  color: Colors.greenAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(red*cos(5*pi/4),red*sin(5*pi/4)),
                child: Dot(
                  radius: 5,
                  color: Colors.blue,
                ),
              ),
              Transform.translate(
                offset: Offset(red*cos(6*pi/4),red*sin(6*pi/4)),
                child: Dot(
                  radius: 5,
                  color: Colors.cyanAccent,
                ),
              ),
              Transform.translate(
                offset: Offset(red*cos(7*pi/4),red*sin(7*pi/4)),
                child: Dot(
                  radius: 5,
                  color: Colors.indigo,
                ),
              ),
              Transform.translate(
                offset: Offset(red*cos(8*pi/4),red*sin(8*pi/4)),
                child: Dot(
                  radius: 5,
                  color: Colors.blueGrey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class Dot extends StatelessWidget {

  final double radius;
  final Color color;
  Dot({this.radius,this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.radius,
        height: this.radius,
        decoration: BoxDecoration(
          color: this.color,
          shape: BoxShape.circle
        ),
      ),
    );
  }
}
