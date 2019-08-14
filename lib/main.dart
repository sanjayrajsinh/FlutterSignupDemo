import 'package:flutter/material.dart';
import 'package:flutter_login_demo/login/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.black,
          primaryColorDark: Colors.black),
      home: LoginScreen(),
    );
  }
}
