
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stopwatch/clockMarkers.dart';
import 'package:stopwatch/clock_hand.dart';
import 'package:stopwatch/elapsed_time_text.dart';


class StopWatchRenderee extends StatelessWidget {

  final Duration separishodeh;
  final double radius;
  StopWatchRenderee({required this.separishodeh , required this.radius});


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for(var i = 0 ; i < 60 ; i++)
          Positioned(
            top: 160,
            left: 157,
              right: 169,
              child: ClocksecondsMarker(radius: radius, seconds: i)),
        for(var i = 5 ; i <= 60 ; i+=5)
          Positioned(
              child: Clocktext(value: i,radius: radius ,maxvalue: 60,)
          ),

        Positioned(
          left: radius,
          top: radius,
          child: ClockHnd(
              rotationZ: pi+(2*pi/60000) * separishodeh.inMilliseconds,
              thickness: 2,
              length: radius,
              color: Colors.orange),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: radius*1.3,
          child: ElapsedTimeText(
              elapsed: separishodeh
          ),
        ),
      ],
    );
  }
}
