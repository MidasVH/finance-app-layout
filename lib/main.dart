import 'package:finance_layout_test/screens/root.dart';
import 'package:flutter/material.dart';
import 'services/authentication.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: const Color(0xff121212),
      ),
      home: RootPage(auth: new Auth()),
    );
  }
}