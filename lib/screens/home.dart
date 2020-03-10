
import 'package:finance_layout_test/widgets/expenses-list.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          OverviewGraph(),
          SizedBox(height: 30.0),
          Align(
            alignment: FractionalOffset(0.1, 0),
            child: Text(
              '3 March 2020', 
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            
          ),
          Expanded(child: ExpensesList(),)
        ],
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

