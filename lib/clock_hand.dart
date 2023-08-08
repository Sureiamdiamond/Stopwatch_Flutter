import 'package:flutter/material.dart';

class ClockHnd extends StatelessWidget {
 ClockHnd({
   required this.rotationZ,
   required this.thickness,
   required this.length,
   required this.color
});

  final double rotationZ;
  final double thickness;
  final double length;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()..translate(-thickness/2 , 0.0 , 0.0)..rotateZ(rotationZ),
      child: Container(
        height: length ,
        width: thickness,
        color: color,
      ),
    );
  }
}
