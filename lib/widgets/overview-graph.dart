import 'package:finance_layout_test/model/Expense.dart';
import 'package:flutter/material.dart';
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
      width: 350,
      child: Text('text')
    );
  }
}