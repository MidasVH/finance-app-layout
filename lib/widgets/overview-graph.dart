import 'package:flutter/material.dart';

class OverviewGraph extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff2d2d2d),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      height: 200,
      width: 350,
      child: Text('text')
    );
  }
}