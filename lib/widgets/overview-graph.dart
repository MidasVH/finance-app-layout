import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class OverviewGraph extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[600],
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      height: 200,
      child: const Center(child: Text('Hello')),
    );
  }
}