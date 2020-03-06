import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class OverviewGraph extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[600],
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      height: 200,
      child: const Center(child: Text('Donut chart comes here')),
    );
  }
}