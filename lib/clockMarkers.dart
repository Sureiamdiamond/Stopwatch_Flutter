import 'dart:math';

import 'package:flutter/material.dart';

class ClocksecondsMarker extends StatelessWidget {

  ClocksecondsMarker({required this.radius , required this.seconds});

  final int seconds;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final color = seconds % 5 == 0 ? Colors.white : Colors.white38;
    const width = 2.0;
    const height = 12.0;
    return Transform(
      alignment: Alignment.centerRight,
      transform: Matrix4.identity()..translate(-width/2.0 , -height/2)..rotateZ(2*pi*(seconds/60))
      ..translate(0.0,  radius - height /2.4 , 0.0),
      child: Container(
        width: width,
        height: height,
        color: color,

      ),
    );
  }
}

class Clocktext extends StatelessWidget {
  const Clocktext({Key? key, required this.value, required this.maxvalue, required this.radius}) : super(key: key);

  final int value;
  final int maxvalue;
  final double radius;

  @override
  Widget build(BuildContext context) {

    const width = 70.0;
    const height = 112.0;

    return Align(
      alignment: Alignment.center,
      child: Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()..translate(-width /13 , -height/27 , 0.0)
        ..rotateZ(pi + 1.99* pi *(value/maxvalue+0.002))..translate(0.0 , radius-29 , 0)..rotateZ(pi - 1.99 * pi * (value/maxvalue)),
        child: SizedBox(
          width: width,
          height: height,
          child: Text(
            value.toString(),
            style: TextStyle(fontSize: 17 ,color: Color(0xffdfdfdf)),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
