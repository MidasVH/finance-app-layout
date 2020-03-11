import 'package:finance_layout_test/services/authentication.dart';
import 'package:finance_layout_test/widgets/expenses-list.dart';
import 'package:finance_layout_test/widgets/overview-graph.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  Home({Key key, this.auth, this.userId, this.logoutCallback})
    : super(key: key);
  
  @override 
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home>{
  final GlobalKey formkey = GlobalKey<FormState>();

  @override 
  void initState() {
    super.initState();
  }

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
          new FlatButton(
            child: new Text(
              'Logout',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0
              )
            ),
            onPressed: () => signOut(),
          )
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

  signOut() async {
    try {
      print(widget.auth.getCurrentUser());
      await widget.auth.signOut();
      widget.logoutCallback();
    }catch(e) {
      print(e);
    }
  }
}

