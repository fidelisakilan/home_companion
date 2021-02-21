import 'package:flutter/material.dart';

class MeterCircle extends StatelessWidget {
  final Icon circleIcon;
  final Text circlePercent;
  final Color circleColor;
  MeterCircle({this.circleIcon, this.circlePercent, this.circleColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      child: Center(child: circleIcon),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(200.0),
        color: Colors.transparent,
        border: Border.all(
          width: 5.0,
          color: circleColor,
        ),
      ),
    );
  }
}
