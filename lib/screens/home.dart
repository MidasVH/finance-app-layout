
import 'package:finance_layout_test/widgets/expense-item.dart';
import 'package:finance_layout_test/widgets/overview-graph.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.grey[800],
      appBar: AppBar(
        title: Text(
          'Finance App',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0.0,
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white,),
            onPressed: () => { },
          ),
        ],
      ),
      body: Container(
        child: ListView(
          padding: const EdgeInsets.all(15.0),
          children: <Widget>[
            OverviewGraph(),
            SizedBox(height: 30.0),
            Text('4 March 2020', style: TextStyle(color: Colors.white, fontSize: 20.0)),
            SizedBox(height: 30.0),
            ExpenseItem('Shopping'),
           

          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
        color: Colors.grey[700],
        elevation: 5.0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.black),
        backgroundColor: Colors.white,  
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}