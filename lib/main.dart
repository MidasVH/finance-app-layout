import 'package:finance_layout_test/screens/login-page.dart';
import 'package:finance_layout_test/screens/root.dart';
import 'package:flutter/material.dart';
import './screens/home.dart';
import 'services/authentication.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Colors.grey[800],
      ),
      home: RootPage(auth: new Auth()),
    );
  }
}